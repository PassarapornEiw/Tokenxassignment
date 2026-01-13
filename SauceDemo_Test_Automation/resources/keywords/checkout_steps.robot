*** Settings ***
Documentation    product workflow keywords
Library          SeleniumLibrary
Library          ../libraries/BrowserOptions.py
Resource         ../../config/settings.robot
Resource         ../../variables/common_variables.robot
Resource         ../keywords/common_keywords.robot
Resource         ../page_objects/products_page.robot
Resource         ../page_objects/cart_page.robot

*** Keywords ***
Go to Cart and Verify
    [Documentation]    View shopping cart 
    [Arguments]   ${PRODUCT_NAME}
    Click Shopping Cart
    Verify Cart Page Is Displayed
    Verify Product In Cart    ${PRODUCT_NAME}
    ${cart_count}=    Get Cart Item Count
    Should Be Equal As Numbers    ${cart_count}    1
