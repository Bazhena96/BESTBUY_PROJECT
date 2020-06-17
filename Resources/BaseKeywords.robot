***Settings***
Library  SeleniumLibrary
Resource  Variables.robot
Resource  SuiteKeywords.robot
***Keywords***
Open and Load
    # ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    # ${disabled}  Create List  Chrome PDF Viewer  PrintFileServer
    # ${prefs}  Create Dictionary  download.prompt_for_download=${FALSE}  plugins.always_open_pdf_externally=${TRUE}  plugins.plugins_disabled=${disabled}
    # Call Method  ${chrome_options}  add_experimental_option  prefs  ${prefs}
    Open Browser  https://www.bestbuy.com  chrome  executable_path=/usr/local/Caskroom/chromedriver/83.0.4103.39/chromedriver   
    Set Browser Implicit Wait  20
Choose The Language
    [Documentation]  Language: english
    Wait Until Page Contains Element  css=.is-active
    Click Element  css=.is-active
Sort Product
    [Arguments]  ${SORT_PRODUCT}
    Wait Until Page Contains Element  ${SORT_PRODUCT}
    Click Element  ${SORT_PRODUCT}
Select Item
    [Arguments]    ${PRODUCT_LINK}
    Click Element  ${PRODUCT_LINK}
User Input Email To Sign In
    [Arguments]  ${USER_EMAIL_FIELD}
    Wait Until page Contains Element  ${USER_EMAIL_FIELD}
    Input Text  ${USER_EMAIL_FIELD}  ${USER_EMAIL}
User Input Password
    [Arguments]  ${PASSWORD_FIELD}
    Wait Until Page Contains Element  ${PASSWORD_FIELD}
    Input Password  ${PASSWORD_FIELD}  ${USER_PASSWORD}
User Click The Button To Account
    [Arguments]  ${CLICK_BUTTON_TO_SIGN_IN}  ${ACCOUNT_BUTTON}
    Wait Until page Contains Element  ${ACCOUNT_BUTTON}
    Click Element  ${ACCOUNT_BUTTON}
    Wait Until Page Contains Element  ${CLICK_BUTTON_TO_SIGN_IN}
    Click Element  ${CLICK_BUTTON_TO_SIGN_IN}
User Click Submit
    [Arguments]  ${SUBMIT_TO_SIGN_IN}
    Wait Until Page Contains Element  ${SUBMIT_TO_SIGN_IN}
    Click Element  ${SUBMIT_TO_SIGN_IN}
Dismiss Alert
    Click Element  css=#widgets-view-email-modal-mount > div > div > div:nth-child(2) > div > div > div > div > button