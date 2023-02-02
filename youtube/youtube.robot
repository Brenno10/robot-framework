*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${input_search}      //input[@id="search"]
${button_search}     //button[@id="search-icon-legacy"]
# ${button_skip_add}   //button[@class="ytp-ad-skip-button ytp-button"]
${musica_natural}    //yt-formatted-string[contains(text(), "Imagine Dragons - Natural")][1]


*** Keywords ***
abrir site do youtube
    Open Browser     https://www.youtube.com/    chrome
    
pesquisar musica
    Input Text    ${input_search}    natural
    Click Button    ${button_search}

clicar na musica
    Wait Until Element Is Visible    ${musica_natural}
    Click Element    ${musica_natural}

esperar a musica terminar
    Sleep    200s

fechar navegador
    Close Browser

*** Test Cases ***
# Escrever casos de teste
Cenário 1: Teste de abrir musica no youtube
    abrir site do youtube
    pesquisar musica
    clicar na musica
    esperar a musica terminar
    fechar navegador    
