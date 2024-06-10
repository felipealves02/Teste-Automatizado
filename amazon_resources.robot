*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${URL}                 https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics']
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${CARRINHO}    nav-cart-count-container
${REMOVER_PRODUTO}    //input[@value='Excluir']




*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser    

Acessar a home page do site Amazon.com.br

    Go To    url=${URL}    
    Sleep    20s
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS} 
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=//input[contains(@type,'text')]    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//div[@class='sg-col-inner'])[7]


# caso de teste 03

Adicionar o produto "${PRODUTO}" no carrinho
    Click Button    locator=a-autoid-2-announce

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//img[@src='https://m.media-amazon.com/images/I/61f1agMOeTL._AC_AA152_.jpg']


# caso de teste 04

Remover o produto "${PRODUTO}" do carrinho
    Click Element    ${CARRINHO}
    Wait Until Element Is Visible    ${REMOVER_PRODUTO}
    Click Element    ${REMOVER_PRODUTO}
    Wait Until Page Contains    //span[contains(.,'Xbox Series S  Abre em uma nova aba   foi removido de Carrinho de compras.')]


Verificar se o produto foi removido
    Wait Until Element Is Visible    locator=/html[1]/body[1]/div[1]/div[1]/div[3]/div[5]/div[1]/div[2]/div[1]/div[1]/form[1]/div[2]/div[3]/div[1]/div[1]/span[1]




