*** Settings ***
Documentation    product workflow keywords
Library          SeleniumLibrary
Library          ../libraries/BrowserOptions.py
Resource         ../../config/settings.robot
Resource         ../../variables/common_variables.robot
Resource         ../keywords/common_keywords.robot
Resource         ../page_objects/products_page.robot

*** Keywords ***
Add Product to Cart
    [Documentation]  Add product to cart
    Verify Products Page Is Displayed
    ${PRODUCT_NAME}=    Add First Product To Cart
    Set Test Variable    ${PRODUCT_NAME}
    Verify Cart Badge Count    1
