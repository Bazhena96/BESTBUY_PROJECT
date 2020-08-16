*** Settings ***
Library  SeleniumLibrary
Resource  GlobalVariables.robot
Resource  SuiteKeywords.robot
*** Keywords ***
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
    [Arguments]  ${sort product}
    Wait Until Page Contains Element  ${sort product}
    Click Element  ${sort product}
Select Item
    [Arguments]    ${product link}
    Click Element  ${product link}
User Input Email To Sign In
    [Arguments]  ${user email fild}
    Wait Until page Contains Element  ${user email field}
    Input Text  ${user email field}  ${user email}
User Input Password
    [Arguments]  ${password field}
    Wait Until Page Contains Element  ${password field}
    Input Password  ${password field}  ${user password}
User Click The Button To Account
    [Arguments]  ${click button to sign in}  ${account button}
    Wait Until page Contains Element  ${account button}
    Click Element  ${account button}
    Wait Until Page Contains Element  ${click button to sign in}
    Click Element  ${click button to sign in}
User Click Submit
    [Arguments]  ${submit to sign in}
    Wait Until Page Contains Element  ${submit to sign in}
    Click Element  ${submit to sign in}
Dismiss Alert
    Click Element  css=#widgets-view-email-modal-mount > div > div > div:nth-child(2) > div > div > div > div > button