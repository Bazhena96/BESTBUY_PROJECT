*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/BaseKeywords.robot
Resource  ../Resources/SuiteKeywords.robot

*** Test Cases ***
User open and load Page
    Open and Load
User choose the language settings
    Open and Load
    Choose The Language
    Close Browser
    
Test checkout flow
    @{countryes} =  Create List  us  ca  mx
    FOR  ${country}  IN  @{countryes}
         Choose The Country  ${country}
         Run Keyword IF  '${country}' == 'us'  Dismiss Alert
         Run Keyword IF  '${country}' == 'us'  User Sign Into Account  ${country}  ELSE  Run Keyword and Ignore Error  User Sign Into Account  ${COUNTRY}
         User Search The Product  ${country}
         Verify That Search Completed
         User Sort All Results   ${country}
         User Select One Of The Results  ${country}
         User Add Product To Cart  ${country}
         Verify That Product At The Cart
     END