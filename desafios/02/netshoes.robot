*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${produto_mizuno}    Tênis Mizuno Wave Titan 2


*** Keywords ***
Abrir o navegador no site da Netshoes
    Open Browser    https://www.netshoes.com.br/    chrome
    Maximize Browser Window

Abrir o video noot noot
    Open Browser    https://www.youtube.com/watch?v=bnmAi53H520    chrome
    Wait Until Element Is Visible    //*[@data-title-no-tooltip="Reiniciar"]    20s
    Maximize Browser Window

Pesquisar pelo produto "${produto}"
    Input Text    id:search-input    ${produto}
    Click Element    //button[@type="submit"]

Clicar no produto
    Click Element    class:cookie-notification-button
    Click Element    //span[contains(text(), "${produto_mizuno}")][1]

Finalizar o teste
    Close All Browsers

Verificar se o valor do produto for maior que "${valor}"
    ${texto_preco}    Get Text    //*[@class="default-price"]/span/strong
    ${preco}    Fetch From Right    ${texto_preco}    $
    IF    ${preco} <= ${valor}
        Abrir o video noot noot
    ELSE
        Finalizar o teste
    END


*** Test Cases ***
Caso 01: Condicionais
    Abrir o navegador no site da Netshoes
    Pesquisar pelo produto "${produto_mizuno}"
    Clicar no produto
    Verificar se o valor do produto for maior que "250"
    Finalizar o teste
