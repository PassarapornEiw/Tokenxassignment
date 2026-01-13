*** Settings ***
Documentation    End-to-End test for SauceDemo checkout flow
...              This test covers: Login -> Add Product -> Checkout -> Order Confirmation
Library          SeleniumLibrary
Resource         ../config/settings.robot
Resource         ../variables/common_variables.robot
Resource         ../resources/keywords/common_keywords.robot
Resource         ../resources/page_objects/login_page.robot
Resource         ../resources/page_objects/products_page.robot
Resource         ../resources/page_objects/cart_page.robot
Resource         ../resources/page_objects/checkout_page.robot
Test Setup       Setup Test Environment
Test Teardown    Teardown Test Environment


*** Variables ***
${PRODUCT_NAME}    ${EMPTY}


*** Test Cases ***

Complete Checkout Flow Successfully
    [Documentation]    Verifies the complete e2e checkout process
    ...                1. Login with valid credentials
    ...                2. Add one product to cart
    ...                3. Complete checkout and verify order confirmation
    [Tags]    smoke    e2e    checkout
    
    # Step 1: Login
    Log    Step 1: Login to SauceDemo    console=True
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    
    # Step 2: Add Product to Cart
    Log    Step 2: Add product to cart    console=True
    Verify Products Page Is Displayed
    ${PRODUCT_NAME}=    Add First Product To Cart
    Set Test Variable    ${PRODUCT_NAME}
    Log    Added product: ${PRODUCT_NAME}    console=True
    Verify Cart Badge Count    1
    
    # Step 3: Go to Cart and Verify
    Log    Step 3: View shopping cart    console=True
    Click Shopping Cart
    Verify Cart Page Is Displayed
    Verify Product In Cart    ${PRODUCT_NAME}
    ${cart_count}=    Get Cart Item Count
    Should Be Equal As Numbers    ${cart_count}    1
    
    # Step 4: Start Checkout
    Log    Step 4: Proceed to checkout    console=True
    Click Checkout Button
    
    # Step 5: Complete Checkout Process
    Log    Step 5: Complete checkout process    console=True
    Complete Checkout Process    
    ...    ${FIRST_NAME}    
    ...    ${LAST_NAME}    
    ...    ${POSTAL_CODE}    
    ...    ${PRODUCT_NAME}
    
    Log    Test completed successfully! Order confirmed.    console=True


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

