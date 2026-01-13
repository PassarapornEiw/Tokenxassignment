*** Settings ***
Documentation    Page Object for SauceDemo Products Page
Library          SeleniumLibrary
Resource         ../keywords/common_keywords.robot


*** Variables ***
# Page Locators
${PRODUCTS_TITLE}                   css:.title
${PRODUCT_ITEM}                     css:.inventory_item
${FIRST_PRODUCT_NAME}               css:.inventory_item:first-child .inventory_item_name
${FIRST_PRODUCT_ADD_BUTTON}         id:add-to-cart-sauce-labs-backpack
${SHOPPING_CART_BADGE}              css:.shopping_cart_badge
${SHOPPING_CART_LINK}               css:.shopping_cart_link


*** Keywords ***
Verify Products Page Is Displayed
    [Documentation]    Verifies that the products page is displayed
    Wait Until Element Is Visible    ${PRODUCTS_TITLE}
    Element Text Should Be    ${PRODUCTS_TITLE}    Products

Get First Product Name
    [Documentation]    Returns the name of the first product
    Wait Until Element Is Visible    ${FIRST_PRODUCT_NAME}
    ${product_name}=    Get Text    ${FIRST_PRODUCT_NAME}
    RETURN    ${product_name}

Add First Product To Cart
    [Documentation]    Adds the first product to the shopping cart
    Wait Until Element Is Visible    ${FIRST_PRODUCT_ADD_BUTTON}
    ${product_name}=    Get First Product Name
    Click Button    ${FIRST_PRODUCT_ADD_BUTTON}
    Wait Until Element Is Visible    ${SHOPPING_CART_BADGE}
    RETURN    ${product_name}

Verify Cart Badge Count
    [Documentation]    Verifies the shopping cart badge shows correct count
    [Arguments]    ${expected_count}
    Wait Until Element Is Visible    ${SHOPPING_CART_BADGE}
    ${badge_text}=    Get Text    ${SHOPPING_CART_BADGE}
    Should Be Equal    ${badge_text}    ${expected_count}

Click Shopping Cart
    [Documentation]    Clicks on the shopping cart icon and waits for navigation
    Element Should Be Clickable    ${SHOPPING_CART_LINK}
    Click Element    ${SHOPPING_CART_LINK}
    Wait Until Location Contains    cart.html    timeout=10s

