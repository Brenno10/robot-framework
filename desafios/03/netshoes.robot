*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String


*** Variables ***
${button_cookies}           //*[@class="cookie-notification-button"]
${button_close_pop_up}      //*[@class="ns-icon ns-icon-close overlay-floater_banner_close-button"]

${button_informe_cep}       //*[contains(text(), "Informe seu CEP")][1]
${input_cep}                //*[@id="zipcode-focus"]
${button_consultar_cep}     //*[@class="zip__code--calculate"]
${button_ok}                //*[@class="zip__code--calculate"]

${list_entrar}              //*[@qa-automation="home-account-button"]
${button_login}             //*[contains(text(), "Login")][1]
${input_user}               //*[@id="user"]
${input_senha}              //*[@id="password"]
${button_submit}            //*[@data-testid="submitButton"]

@{produtos}=                ${produto_mizuno}    ${produto_nike}    ${produto_adidas}
${produto_mizuno}           Tênis Mizuno Wave Titan 2
${produto_nike}             Tênis Nike Downshifter 12 Masculino
${produto_adidas}           Tênis Adidas Lite Racer CLN 2.0 Masculino

${input_pesquisa}           //*[@id="search-input"]
${button_pesquisar}         //*[@qa-automation="home-search-button"]
${list_tamanho}             //*[@class="radio-options"]/li[7]/a
${button_comprar}           //*[@id="buy-button-now"]
${button_lista_desejos}     (//*[@class="wishlist__heart__logo ns-icon ns-icon-wishlist-heart"])[1]
${button_carrinho}          //*[@qa-automation="home-cart-button"]
${button_continuar}         //*[@qa-auto="cart-keep-buying"]

${button_calcular}          //*[@qa-auto="cart-cep-button"]
${text_sub_total}           //*[@class="summary__item"]/*[@class="summary__item-value"]/div[@qa-auto]
${text_frete}               //*[@class="summary__item__content"]/*[@class="summary__item-value"]/div[@qa-auto]
${text_total}               //*[@qa-auto="cart-price-payment-method"]



*** Keywords ***
Abrir o navegador no site da Netshoes
    Open Browser    https://www.netshoes.com.br/    chrome
    Maximize Browser Window

Voltar para a página inicial
    Wait Until Keyword Succeeds    5    5s    Go To    https://www.netshoes.com.br/

Fazer login "${usuario}" "${senha}"
    Colocar o mouse em cima do "${list_entrar}"
    Clicar no elemento "${button_login}"
    Escreva "${usuario}" no elemento "${input_user}"
    Escreva "${senha}" no elemento "${input_senha}"
    Clicar no elemento "${button_submit}"

Verificar se o "${elemento}" existe
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${elemento}
    Run Keyword If    ${present}    Clicar no elemento "${elemento}"

Escreva "${texto}" no elemento "${elemento}"
    Wait Until Keyword Succeeds    5    5s    Input Text    ${elemento}    ${texto}

Colocar o mouse em cima do "${elemento}"
    Wait Until Element Is Visible    ${elemento}    10s
    Mouse Over    ${elemento}

Clicar no elemento "${elemento}"
    Run Keyword And Ignore Error    Scroll Element Into View    ${elemento}
    Wait Until Keyword Succeeds    5    5s    Click Element    ${elemento}

Adicionar todos os produtos a lista de desejo
    FOR    ${produto}    IN    @{produtos}
        Escreva "${produto}" no elemento "${input_pesquisa}"
        Clicar no elemento "${button_pesquisar}"
        Clicar no elemento "${button_lista_desejos}"
    END

Adicionar todos os produtos ao carrinho
    FOR    ${produto}    IN    @{produtos}
        Escreva "${produto}" no elemento "${input_pesquisa}"
        Clicar no elemento "${button_pesquisar}"
        Clicar no elemento "(//*[@class="item-card__description__product-name"])[1]/span[contains(text(), "${produto}")]"
        Clicar no elemento "${list_tamanho}"
        Clicar no elemento "${button_comprar}"
        Clicar no elemento "${button_continuar}"
    END

Verificar os valores de subtotal, frete e total
    ${sub_total}=    Get Text    ${text_sub_total}
    ${frete}=        Get Text    ${text_frete}
    ${total}=        Get Text    ${text_total}
    Log    ${sub_total}
    Log    ${frete}
    Log    ${total}

Finalizar o teste
    Close All Browsers


*** Test Cases ***
Caso 01: Verificar CEP
    Abrir o navegador no site da netshoes
    Verificar se o "${button_close_pop_up}" existe
    Verificar se o "${button_cookies}" existe
    Clicar no elemento "${button_informe_cep}"
    Escreva "05001-903" no elemento "${input_cep}"
    Clicar no elemento "${button_consultar_cep}"
    Clicar no elemento "${button_ok}"
    Finalizar o teste

Caso 02: Teste de login
    Abrir o navegador no site da Netshoes
    Verificar se o "${button_close_pop_up}" existe
    Verificar se o "${button_cookies}" existe
    Fazer login "58594691017" "123321"
    Finalizar o teste

Caso 03: Adicionar produtos a lista de desejo
    Abrir o navegador no site da Netshoes
    Verificar se o "${button_close_pop_up}" existe
    Verificar se o "${button_cookies}" existe
    Fazer login "hewota7698@proexbol.com" "test123321"
    Voltar para a página inicial
    Adicionar todos os produtos a lista de desejo
    Finalizar o teste

Caso 04: Adicionar produtos no carrinho
    Abrir o navegador no site da Netshoes
    Verificar se o "${button_close_pop_up}" existe
    Verificar se o "${button_cookies}" existe
    Adicionar todos os produtos ao carrinho
    Clicar no elemento "${button_carrinho}"
    Clicar no elemento "${button_calcular}"
    Verificar os valores de subtotal, frete e total
    Finalizar o teste

