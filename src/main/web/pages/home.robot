*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN}        //a[@href='/login']
${LOGOUT}       //a[@href='/logout']

*** Keywords ***
Go To Login Page
    Wait Until Page Contains Element    ${LOGIN}    timeout=10s
    Click Element    ${LOGIN}

Go To Products Page
    Wait Until Page Contains Element    //a[@href='/products']    timeout=10s
    Click Element    //a[@href='/products']

Go To Cart Page
    Wait Until Page Contains Element    //a[@href='/view_cart']    timeout=10s
    Click Element    //a[@href='/view_cart']

Logout
    Wait Until Page Contains Element    ${LOGOUT}    timeout=10s
    Click Element    ${LOGOUT}