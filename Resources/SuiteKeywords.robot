*** Settings ***
Library  SeleniumLibrary
Resource  GlobalVariables.robot
Resource  BaseKeywords.robot
*** Keywords ***
Choose The Country
    [Arguments]  ${country}
    &{country button}  Create Dictionary  ca=css=.content > div:nth-child(1) > div:nth-child(4) > a:nth-child(1) > img:nth-child(1)  us=css=.content > div:nth-child(1) > div:nth-child(4) > a:nth-child(2) > img:nth-child(1)  mx=css=.content > div:nth-child(1) > div:nth-child(4) > a:nth-child(3) > img:nth-child(1)
    Click Element  ${country button}[${country}]
Verify That Search Completed
    Wait Until Page Contains  Results for
User Sort All Results
    [Arguments]  ${country}
    &{sort product}  Create Dictionary   ca=css=#Sort     us=css=#sort-by-select  mx=css=#sort-by-select
    Sort Product  ${sort product}[${country}]
User Select One Of The Results
    [Arguments]  ${country}
    &{product link}  Create Dictionary     ca=css=div.col-xs-12_1GBy8:nth-child(1) > div:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1)  us=css=#shop-sku-list-item-60d05b43-d0e6-40b2-810d-cae509018b75 > div > div > div.right-column > div.information > div:nth-child(3) > div.sku-title > h4 > a  mx=css=#product-line-item-1000204433 > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > a:nth-child(1) > h4:nth-child(1)
    Maximize Browser Window
    Wait Until Page Contains Element  ${product link}[${country}]
    Select Item  ${product link}[${country}]
User Search The Product  
    [Arguments]  ${country}
    &{search field}  Create Dictionary  ca=css=.textField_e79SD   us=gh-search-input  mx=#gh-search-input
    &{search icon}  Create Dictionary  ca=css=.searchButton_T4-BG  us=css=.header-search-button  mx=css=.header-search-button
    Wait Until Page Contains Element  ${search field}[${country}]
    Input Text   ${search field}[${country}]  ${Search query}
    Sleep  5
    Wait Until Page Contains Element  ${search icon}[${country}]
    Click Element   ${search icon}[${country}]
User Sign In to Account
    [Arguments]  ${country}
    &{account button}  Create Dictionary  ca=css=.accountLabel_3bhLI  mx=css=#profileMenuWrap1  us=css=.account-icon
    &{click button to sign in}  Create Dictionary  ca=css=.page-title  us=css=.lam-signIn__button  mx=css=.action-btn
    &{user email field}  Create Dictionary  ca=css=#email  us=css=#fld-e  mx=css=#email
    &{password field}  Create Dictionary  ca=css=#password    mx=css=#password   us=id=fld-p1
    &{submit to sign in}  Create Dictionary  ca=css=.YfMde  us=css=.btn-secondary  mx=css=.signin-button
    User Click The Button To Account   ${click button to sign in}[${country}]  ${account button}[${country}]
    User Input Email To Sign In  ${user email field}[${country}]
    User Input Password  ${password field}[${country}]
    User Click Submit  ${submit to sign in}[${country}]
User Add Product To Cart
    [Arguments]  ${country}
    &{add to cart button}  Create Dictionary   ca=css=#test  us=css=#fulfillment-add-to-cart-button-dc6d05f2-db9d-498b-83b0-d0cdea78fdc7 > div > div > button  mx=css=.btn-lg
    Wait And Click  ${add to cart button}[${country}]
Verify That Product At The Cart
        [Arguments]  ${country}
        &{added to cart}  Create Dictionary  ca=This item has been added to your cart.  us=Order Summary  mx=Tù Producto Se Agregó Al Carrito.
    Wait Until Page Contains  ${added to cart}[${country}]


    
    
    
    