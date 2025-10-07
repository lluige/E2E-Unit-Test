*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Validate Item In Cart
    [Arguments]    ${item_name}
    ${result}=    Run Keyword And Return Status    Wait Until Page Contains Element    //td[@class="cart_description"]/h4/a[normalize-space(text())="${item_name}"]    timeout=5s
    Should Be True    ${result}    Item '${item_name}' not found in cart.
    Log    Item '${item_name}' found in cart.