***Settings***
Library  SeleniumLibrary
Resource  ../Resources/Keywords.robot
Resource  ../Resources/KeywordsLevel2.robot

*** Test Cases ***
User Open and Load Page
    Open and Load
User Choose The Language Settings
    Open and Load
    Choose The Language
    Close Browser
 Test Checkout Flow
    @{COUNTRYES} =  Create List  us  ca  mx
    :FOR  ${COUNTRY}  IN  @{COUNTRYES}
    \     Choose The Country  ${COUNTRY_BUTTONS}[${COUNTRY}] 
    \     Run Keyword and Ignore Error   Dismiss Alert  
    \     Run Keyword and Ignore Error   User Sign Into Account  ${COUNTRY}
    \     User Search The Product  ${COUNTRY} 
    \     Verify That Search Completed
    \     User Sort All Results   ${COUNTRY}
    \     User Select One Of The Results  ${COUNTRY}
    \     User Add Product To Cart  ${COUNTRY}
    \     Verify That Product At The Cart  
