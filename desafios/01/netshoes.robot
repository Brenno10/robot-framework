*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${produto}    Tênis Mizuno Wave Titan 2
${valor_produto}    //div[@class="default-price"][1]/span/strong


*** Keywords ***
Abrir o navegador e entrar no site da netshoes
    Open Browser    https://www.netshoes.com.br/    chrome
    Maximize Browser Window

Pesquisar pelo produto
    Input Text    id:search-input    ${produto}
    Click Element    //button[@type="submit"]

Clicar no produto
    Click Element    class:cookie-notification-button
    Click Element    //span[contains(text(), "${produto}")][1]

Verificar o valor se é igual a "${valor}"
    ${texto_preco}    Get Text    ${valor_produto}
    Should Be Equal As Strings    ${texto_preco}    ${valor}

Selecionar o tamanho
    Wait Until Element Is Visible    //*[@class="radio-options"]/li[7]/a    10s
    Click Element    //*[@class="radio-options"]/li[7]/a

Clicar no botão comprar
    Wait Until Element Is Visible    //*[@id="buy-button-now"]    10s
    Click Element    //*[@id="buy-button-now"]

Digitar CEP
    Input Text    id:cep    03820100

Clicar em calcular
    Click Element    //*[contains(text(), "Calcular")][1]
    Sleep    3s

finaliza o teste
    Close Browser


*** Test Cases ***
Cenário 01: Consultar um produto no site da netshoes e comparar o valor
    Abrir o navegador e entrar no site da netshoes
    Pesquisar pelo produto
    Clicar no produto
    Verificar o valor se é igual a "R$ 227,99"
    finaliza o teste

Cenário 02: comprar um tênis
    Abrir o navegador e entrar no site da netshoes
    Pesquisar pelo produto
    Clicar no produto
    Selecionar o tamanho
    Clicar no botão comprar
    Digitar CEP
    Clicar em calcular
    finaliza o teste

