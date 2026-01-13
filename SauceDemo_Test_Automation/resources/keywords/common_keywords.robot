*** Settings ***
Documentation    Common keywords used across all test cases
Library          SeleniumLibrary
Library          ../libraries/BrowserOptions.py
Resource         ../../config/settings.robot
Resource         ../../variables/common_variables.robot


*** Keywords ***
Setup Test Environment
    [Documentation]    Prepares the test environment before each test
    Log    Starting test execution...    console=True
    Set Selenium Speed    ${SELENIUM_SPEED}

Teardown Test Environment
    [Documentation]    Cleans up after test execution
    Run Keyword If Test Failed    Log    Test failed! Check screenshots for details.    console=True
    Run Keyword If Test Passed    Log    Test passed successfully!    console=True
    Capture Screenshot On Failure
    Close Browser Session
    
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

Capture Screenshot On Failure
    [Documentation]    Captures screenshot when test fails
    Run Keyword If Test Failed    Capture Page Screenshot

Element Should Be Clickable
    [Documentation]    Verifies element is visible and enabled
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}

