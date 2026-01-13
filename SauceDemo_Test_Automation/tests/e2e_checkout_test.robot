*** Settings ***
Library          SeleniumLibrary
Resource         ../config/settings.robot
Resource         ../variables/common_variables.robot
Resource         ../resources/keywords/common_keywords.robot
Resource         ../resources/keywords/product_workflows.robot
Resource         ../resources/keywords/checkout_steps.robot
Resource         ../resources/page_objects/login_page.robot
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
    
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}  
    Add Product to Cart  
    Go to Cart and Verify    ${PRODUCT_NAME}
    Click Checkout Button
    Complete Checkout Process    
    ...    ${FIRST_NAME}    
    ...    ${LAST_NAME}    
    ...    ${POSTAL_CODE}    
    ...    ${PRODUCT_NAME}

