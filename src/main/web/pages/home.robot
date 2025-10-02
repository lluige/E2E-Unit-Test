*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN}        //a[@href='/login']
${LOGOUT}       //a[@href='/logout']

*** Keywords ***
Go To Login Page
    Wait Until Page Contains Element    ${LOGIN}    timeout=10s
    Click Element    ${LOGIN}
Logout
    Wait Until Page Contains Element    ${LOGOUT}    timeout=10s
    Click Element    ${LOGOUT}