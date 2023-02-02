*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${input_search}      //input[@id="search"]
${button_search}     //button[@id="search-icon-legacy"]
# ${button_skip_add}   //button[@class="ytp-ad-skip-button ytp-button"]
${musica_natural}    //yt-formatted-string[contains(text(), "Imagine Dragons - Natural")][1]

${nomeDaMusica}      natural


*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser     https://www.youtube.com/    chrome
    
Quando digito o nome da musica
    Input Text    ${input_search}    ${nomeDaMusica}

E clico no botão buscar
    Click Button    ${button_search}

E clico na primeira música
    Wait Until Element Is Visible    ${musica_natural}
    Click Element    ${musica_natural}

E espero a musica terminar
    Sleep    200s

Então fecho o navegador
    Close Browser

*** Test Cases ***
# Escrever casos de teste
Cenário 1: Teste de abrir musica no youtube
    Dado que eu acesso o site do youtube
    Quando digito o nome da musica
    E clico no botão buscar
    E clico na primeira música
    E espero a musica terminar
    Então fecho o navegador
