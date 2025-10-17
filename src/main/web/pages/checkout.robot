*** Settings ***
Library     SeleniumLibrary
Resource    ../../../resources/web/resources.robot

*** Variables ***

*** Keywords ***
Place Order
    Remove Iframes
    Scroll Element Into View     //a[@href='/payment' and contains(@class, 'check_out')]
    Click Element                //a[@href='/payment' and contains(@class, 'check_out')]

Input Payment Details
    [Arguments]    ${name_on_card}    ${card_number}    ${cvc}    ${expiry_month}    ${expiry_year}
    Wait Until Page Contains Element    //input[@data-qa='name-on-card']
    Input Text                          //input[@data-qa='name-on-card']        ${name_on_card}
    Input Text                          //input[@data-qa='card-number']         ${card_number}
    Input Text                          //input[@data-qa='cvc']                 ${cvc}
    Input Text                          //input[@data-qa='expiry-month']        ${expiry_month}
    Input Text                          //input[@data-qa='expiry-year']         ${expiry_year}

Submit Payment
    Click Element        //button[@data-qa='pay-button']

Verify Order Confirmation
    ${result}=    Run Keyword And Return Status    Wait Until Page Contains Element    //b[normalize-space()='Order Placed!']    timeout=10s
    Should Be True    ${result}    Order Failed
    Log    Order placed successfully
