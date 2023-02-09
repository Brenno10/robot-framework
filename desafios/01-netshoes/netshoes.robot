*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${produto}    Tênis Mizuno Wave Titan 2
${valor}      R$ 227,99


*** Keywords ***
Abrir o navegador e entrar no site da netshoes
    Open Browser    https://www.netshoes.com.br/    chrome

Pesquisar pelo produto
    Input Text    id:search-input    ${produto}
    Click Element    //button[@type="submit"]

Clicar no produto
    Click Element    class:cookie-notification-button
    Click Element    //span[contains(text(), "${produto}")][1]

Verificar o valor se é igual a ${valor}
    ${texto_preco}    Get Text    //div[@class="default-price"][1]/span/strong
    Should Be Equal As Strings    ${texto_preco}    ${valor}
    
Selecionar o tamanho
    Click Element    //*[@class="radio-options"]/li[7]/a
        
Clicar no botão comprar
    Click Element    //button[@id="buy-button-now"]

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
    Verificar o valor se é igual a ${valor}
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

