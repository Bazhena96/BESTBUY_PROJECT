***Settings***
Library  SeleniumLibrary
Resource  Variables.robot
Resource  BaseKeywords.robot
***Keywords***
Choose The Country
    [Arguments]  ${COUNTRY}
    
    &{COUNTRY_BUTTONS}  Create Dictionary  ca=css=.content > div:nth-child(1) > div:nth-child(4) > a:nth-child(1) > img:nth-child(1)  us=css=.content > div:nth-child(1) > div:nth-child(4) > a:nth-child(2) > img:nth-child(1)  mx=css=.content > div:nth-child(1) > div:nth-child(4) > a:nth-child(3) > img:nth-child(1)

    Open and Load
    Click Element  ${COUNTRY_BUTTONS}[${COUNTRY}]
Verify That Search Completed
    Wait Until Page Contains  Results for
User Sort All Results
    [Arguments]  ${COUNTRY}
    &{SORT_PRODUCT}  Create Dictionary   ca=css=#Sort     us=css=#sort-by-select  mx=css=#sort-by-select
    Sort Product  ${SORT_PRODUCT}[${COUNTRY}]
User Select One Of The Results
    [Arguments]  ${COUNTRY}
    &{PRODUCT_LINK}  Create Dictionary     ca=css=div.col-xs-12_1GBy8:nth-child(1) > div:nth-child(1) > a:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1)  us=css=li.col-xs-4:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > h3:nth-child(1) > a:nth-child(1)      mx=css=#product-line-item-1000204433 > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > a:nth-child(1) > h4:nth-child(1)
    Maximize Browser Window
    Wait Until Page Contains Element  ${PRODUCT_LINK}[${COUNTRY}]
    Select Item  ${PRODUCT_LINK}[${COUNTRY}]
User Search The Product  
    [Arguments]  ${COUNTRY} 
    &{SEARCH_FIELDS}  Create Dictionary  ca=css=textField_e79SD   us=gh-search-input  mx=gh-search-input
    &{SEARCH_ICON}  Create Dictionary  ca=css=.searchButton_T4-BG  us=css=.header-search-button  mx=css=.header-search-button
    Wait Until Page Contains Element  ${SEARCH_FIELDS}[${COUNTRY}]
    Input Text   ${SEARCH_FIELDS}[${COUNTRY}]  ${SEARCH_QUERY}
    Sleep  5
    Wait Until Page Contains Element  ${SEARCH_ICON}[${COUNTRY}] 
    Click Element   ${SEARCH_ICON}[${COUNTRY}]  
User Sign Into Account
    [Arguments]  ${COUNTRY}
    &{ACCOUNT_BUTTON}  Create Dictionary  ca=css=.accountLabel_3bhLI  mx=css=#profileMenuWrap1  us=css=.account-icon
    &{CLICK_BUTTON_TO_SIGN_IN}  Create Dictionary  ca=css=.page-title  us=css=.lam-signIn__button  mx=css=.action-btn
    &{USER_EMAIL_FIELD}  Create Dictionary  ca=css=#email  us=css=#fld-e  mx=css=#email
    &{PASSWORD_FIELD}  Create Dictionary  ca=css=#password    mx=css=#password   us=id=fld-p1
    &{SUBMIT_TO_SIGN_IN}  Create Dictionary  ca=css=.YfMde  us=css=.btn-secondary  mx=css=.signin-button
    User Click The Button To Account   ${CLICK_BUTTON_TO_SIGN_IN}[${COUNTRY}]  ${ACCOUNT_BUTTON}[${COUNTRY}] 
    User Input Email To Sign In  ${USER_EMAIL_FIELD}[${COUNTRY}] 
    User Input Password  ${PASSWORD_FIELD}[${COUNTRY}] 
    User Click Submit  ${SUBMIT_TO_SIGN_IN}[${COUNTRY}] 
User Add Product To Cart
    [Arguments]  ${COUNTRY}
    &{ADD_TO_CART_BUTTON}  Create Dictionary   ca=css=.button_1XJDJ  us=css=#fulfillment-add-to-cart-button-ae06fe1c-7f9a-4336-be08-258612411dec > div > div > button  mx=css=.btn-lg 
    Wait Until Page Contains Element  ${ADD_TO_CART_BUTTON}[${COUNTRY}]
    Click Element  ${ADD_TO_CART_BUTTON}[${COUNTRY}]
Verify That Product At The Cart
    Wait Until PAge Contains  added to cart
    Page Should Contain  added to cart

    
    
    
    