*** Settings ***
Documentation    Page Object for SauceDemo Cart Page
Library          SeleniumLibrary
Resource         ../keywords/common_keywords.robot


*** Variables ***
# Page Locators
${CART_TITLE}               css:.title
${CART_ITEM}                css:.cart_item
${CART_ITEM_NAME}           css:.inventory_item_name
${CHECKOUT_BUTTON}          id:checkout
${CONTINUE_SHOPPING}        id:continue-shopping


*** Keywords ***
Verify Cart Page Is Displayed
    [Documentation]    Verifies that the cart page is displayed
    Wait Until Element Is Visible    ${CART_TITLE}
    Element Text Should Be    ${CART_TITLE}    Your Cart

Verify Product In Cart
    [Documentation]    Verifies that a specific product is in the cart
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    ${CART_ITEM_NAME}
    ${cart_product_name}=    Get Text    ${CART_ITEM_NAME}
    Should Be Equal    ${cart_product_name}    ${product_name}

Get Cart Item Count
    [Documentation]    Returns the number of items in the cart
    ${count}=    Get Element Count    ${CART_ITEM}
    RETURN    ${count}

Click Checkout Button
    [Documentation]    Clicks the checkout button and handles any browser dialogs
    Element Should Be Clickable    ${CHECKOUT_BUTTON}
    Click Button    ${CHECKOUT_BUTTON}
    
    Sleep    0.5s    # Wait for dialog to appear
    Press Keys    None    ESC
    
    # Wait for navigation to checkout page
    Wait Until Location Contains    checkout-step-one.html    timeout=10s

