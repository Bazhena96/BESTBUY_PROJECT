*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/BaseKeywords.robot
Resource  ../Resources/SuiteKeywords.robot

*** Test Cases ***
User open and load Page
    Load And Maximize Browser Window
User choose the language settings
    Load And Maximize Browser Window
    Choose The Language
    Close Browser
Test checkout flow
    Load And Maximize Browser Window
    @{countryes} =  Create List  us  ca  mx
    FOR  ${country}  IN  @{countryes}
         Choose The Country  ${country}
         Run Keyword IF  '${country}' == 'us'  Dismiss Alert US
         Run Keyword IF  '${country}' == 'us'  User Sign In to Account  ${country}  ELSE  Run Keyword and Ignore Error  User Sign In to Account  ${country}
         Run Keyword IF  '${country}' == 'mx'  Dismiss Alert MX
         User Search The Product  ${country}
         Verify That Search Completed
         User Sort All Results   ${country}
         User Select One Of The Results  ${country}
         User Add Product To Cart  ${country}
         Verify That Product At The Cart  ${country}
     END
     Close Browser