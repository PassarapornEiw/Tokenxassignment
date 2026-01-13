*** Settings ***
Documentation    Page Object for SauceDemo Checkout Pages
Library          SeleniumLibrary
Resource         ../keywords/common_keywords.robot


*** Variables ***
# Checkout Information Page Locators
${CHECKOUT_INFO_TITLE}          css:.title
${FIRST_NAME_INPUT}             id:first-name
${LAST_NAME_INPUT}              id:last-name
${POSTAL_CODE_INPUT}            id:postal-code
${CONTINUE_BUTTON}              id:continue
${CANCEL_BUTTON}                id:cancel

# Checkout Overview Page Locators
${CHECKOUT_OVERVIEW_TITLE}      css:.title
${FINISH_BUTTON}                id:finish
${PAYMENT_INFO}                 css:.summary_info_label
${SHIPPING_INFO}                css:.summary_info_label
${TOTAL_PRICE}                  css:.summary_total_label

# Checkout Complete Page Locators
${CHECKOUT_COMPLETE_TITLE}      css:.title
${SUCCESS_HEADER}               css:.complete-header
${SUCCESS_TEXT}                 css:.complete-text
${BACK_HOME_BUTTON}             id:back-to-products


*** Keywords ***
# Checkout Information Page Keywords
Verify Checkout Info Page Is Displayed
    [Documentation]    Verifies checkout information page is displayed
    Wait Until Element Is Visible    ${CHECKOUT_INFO_TITLE}
    Element Text Should Be    ${CHECKOUT_INFO_TITLE}    Checkout: Your Information

Enter Checkout Information
    [Documentation]    Enters customer information for checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${LAST_NAME_INPUT}    ${last_name}
    Input Text    ${POSTAL_CODE_INPUT}    ${postal_code}

Click Continue To Overview
    [Documentation]    Clicks continue button to proceed to overview and waits for navigation
    Element Should Be Clickable    ${CONTINUE_BUTTON}
    Click Button    ${CONTINUE_BUTTON}
    Wait Until Location Contains    checkout-step-two.html    timeout=10s

# Checkout Overview Page Keywords
Verify Checkout Overview Page Is Displayed
    [Documentation]    Verifies checkout overview page is displayed
    Wait Until Element Is Visible    ${CHECKOUT_OVERVIEW_TITLE}
    Element Text Should Be    ${CHECKOUT_OVERVIEW_TITLE}    Checkout: Overview

Verify Order Summary Contains Product
    [Documentation]    Verifies the order summary contains the expected product
    [Arguments]    ${product_name}
    Wait Until Page Contains Element    css:.inventory_item_name
    ${summary_product}=    Get Text    css:.inventory_item_name
    Should Be Equal    ${summary_product}    ${product_name}

Get Order Total
    [Documentation]    Returns the total price from the order summary
    Wait Until Element Is Visible    ${TOTAL_PRICE}
    ${total}=    Get Text    ${TOTAL_PRICE}
    RETURN    ${total}

Click Finish Button
    [Documentation]    Clicks the finish button to complete the order and waits for navigation
    Element Should Be Clickable    ${FINISH_BUTTON}
    Click Button    ${FINISH_BUTTON}
    Wait Until Location Contains    checkout-complete.html    timeout=10s

# Checkout Complete Page Keywords
Verify Order Completion
    [Documentation]    Verifies that the order was completed successfully
    Wait Until Element Is Visible    ${CHECKOUT_COMPLETE_TITLE}
    Element Text Should Be    ${CHECKOUT_COMPLETE_TITLE}    Checkout: Complete!
    
    Wait Until Element Is Visible    ${SUCCESS_HEADER}
    ${header_text}=    Get Text    ${SUCCESS_HEADER}
    Should Contain    ${header_text}    Thank you for your order
    
    Wait Until Element Is Visible    ${SUCCESS_TEXT}
    Element Should Be Visible    ${BACK_HOME_BUTTON}

Complete Checkout Process
    [Documentation]    Completes the entire checkout process
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}    ${product_name}
    Verify Checkout Info Page Is Displayed
    Enter Checkout Information    ${first_name}    ${last_name}    ${postal_code}
    Click Continue To Overview
    Verify Checkout Overview Page Is Displayed
    Verify Order Summary Contains Product    ${product_name}
    Click Finish Button
    Verify Order Completion

