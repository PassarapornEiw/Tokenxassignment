*** Settings ***
Documentation    Page Object for SauceDemo Login Page
Library          SeleniumLibrary
Resource         ../keywords/common_keywords.robot


*** Variables ***
# Page Locators
${LOGIN_USERNAME_INPUT}     id:user-name
${LOGIN_PASSWORD_INPUT}     id:password
${LOGIN_BUTTON}             id:login-button
${LOGIN_ERROR_MESSAGE}      css:[data-test="error"]
${PRODUCTS_PAGE_TITLE}      css:.title


*** Keywords ***
Navigate To Login Page
    [Documentation]    Opens the login page
    Open Browser To URL    ${BASE_URL}    ${BROWSER}
    Wait Until Element Is Visible    ${LOGIN_USERNAME_INPUT}

Enter Username
    [Documentation]    Enters username in the username field
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${LOGIN_USERNAME_INPUT}
    Input Text    ${LOGIN_USERNAME_INPUT}    ${username}

Enter Password
    [Documentation]    Enters password in the password field
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${LOGIN_PASSWORD_INPUT}
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${password}

Click Login Button
    [Documentation]    Clicks the login button
    Element Should Be Clickable    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}

Verify Login Success
    [Documentation]    Verifies successful login by checking Products page
    Wait Until Element Is Visible    ${PRODUCTS_PAGE_TITLE}    timeout=10s
    Element Text Should Be    ${PRODUCTS_PAGE_TITLE}    Products

Login With Credentials
    [Documentation]    Complete login process with given credentials
    [Arguments]    ${username}    ${password}
    Navigate To Login Page
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Verify Login Success

