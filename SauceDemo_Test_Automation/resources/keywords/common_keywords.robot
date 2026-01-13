*** Settings ***
Documentation    Common keywords used across all test cases
Library          SeleniumLibrary
Library          ../libraries/BrowserOptions.py
Resource         ../../config/settings.robot
Resource         ../../variables/common_variables.robot


*** Keywords ***
Open Browser To URL
    [Documentation]    Opens browser with custom options and navigates to the specified URL
    [Arguments]    ${url}    ${browser}=${BROWSER}
    ${options}=    Get Chrome Options With Disabled Popups
    Open Browser    ${url}    ${browser}    options=${options}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Close Browser Session
    [Documentation]    Closes the current browser session
    Close Browser

Wait Until Page Is Ready
    [Documentation]    Waits until the page is fully loaded
    Wait Until Element Is Not Visible    css:div.loading    timeout=10s
    Sleep    0.5s

Capture Screenshot On Failure
    [Documentation]    Captures screenshot when test fails
    Run Keyword If Test Failed    Capture Page Screenshot

Element Should Be Clickable
    [Documentation]    Verifies element is visible and enabled
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}

