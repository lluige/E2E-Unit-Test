*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Validate Item In Cart
    [Arguments]    ${item_name}
    ${result}=    Run Keyword And Return Status    Wait Until Page Contains Element    //td[@class="cart_description"]/h4/a[normalize-space(text())="${item_name}"]    timeout=5s
    Should Be True    ${result}    Item '${item_name}' not found in cart.
    Log    Item '${item_name}' found in cart.

Remove Item
    [Arguments]    ${item_name}
    Wait Until Page Contains Element             //td[@class="cart_description"]/h4/a[normalize-space(text())="${item_name}"]    timeout=10s
    Click Element                                //td[@class="cart_description"]/h4/a[normalize-space(text())="${item_name}"]/ancestor::td/following-sibling::td[@class="cart_delete"]/a
    Wait Until Page Does Not Contain Element     //td[@class="cart_description"]/h4/a[normalize-space(text())="${item_name}"]    timeout=10s
    Log    Item '${item_name}' removed from cart.

Validate Item Removed From Cart
    [Arguments]    ${item_name}
    ${result}=    Run Keyword And Return Status    Wait Until Page Contains Element    //td[@class="cart_description"]/h4/a[normalize-space(text())="${item_name}"]    timeout=5s
    Should Not Be True    ${result}    Item '${item_name}' still found in cart.
    Log    Item '${item_name}' successfully removed from cart.