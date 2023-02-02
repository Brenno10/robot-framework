*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# Selecinar elementos
${input_name}          id:name
${input_phone}         id:phone
${input_email}         id:email
${input_password}      id:password
${textarea_address}    id:address
${button_submit}       name:submit


*** Keywords ***
abrir navegador e acessar o site  
    Open Browser    https://itera-qa.azurewebsites.net/home/automation    chrome

preencher campos
    Input Text    ${input_name}          Bianca
    Sleep    1s
    Input Text    ${input_phone}         988774455
    Sleep    1s
    Input Text    ${input_email}         bianca@teste.com
    Sleep    1s
    Input Text    ${input_password}      123456
    Sleep    1s
    Input Text    ${textarea_address}    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    Sleep    1s

clicar em submit
    Click Element    ${button_submit}

fechar navegador
    Close Browser


*** Test Cases ***
Cenário 1: preencher formulário
    abrir navegador e acessar o site
    preencher campos
    clicar em submit
    fechar navegador
