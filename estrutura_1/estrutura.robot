*** Settings ***
# Importar recursos, bibliotecas, definir ssetups e definir teardown
Library    SeleniumLibrary


*** Variables ***
# Declarar variaveis
${variavel1}    teste
${variavel2}    hhhh
${variavel3}    155342


*** Keywords ***
# Palavras que descrevem o caso de teste
abrir site do google
    Open Browser     https://google.com/    chrome
    
abrir site do minecraft
    Open Browser    https://www.minecraft.net/pt-pt    chrome

fechar navegador
    Close Browser

*** Test Cases ***
# Escrever casos de teste
Cenário 1: Teste de abrir site google
    abrir site do google
    fechar navegador    

Cenário 2: Teste de abrir o site do minecraft
    abrir site do minecraft
    fechar navegador
