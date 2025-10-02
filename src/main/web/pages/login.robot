*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FORM_FIELD}            //form[@action='/signup' and @method='POST']
${SIGN_UP_NAME}          //input[@data-qa='signup-name']
${SIGN_UP_EMAIL}         //input[@data-qa='signup-email']
${SIGN_UP_BUTTON}        //button[@data-qa='signup-button']
${LOGIN_EMAIL}           //input[@data-qa='login-email']
${LOGIN_PASSWORD}        //input[@data-qa='login-password']
${LOGIN_BUTTON}          //button[@data-qa='login-button']


*** Keywords *** 
Validate Login Page
    ${result}=    Run Keyword And Return Status    Page Should Contain Element    ${FORM_FIELD}    timeout=5s
    Should Be True    ${result}    Login Page is not displayed
    Log    Login Page is displayed
    
Input SignUp Name
    [Arguments]    ${name}
    Input Text    ${SIGN_UP_NAME}    ${name}

Input SignUp Email
    [Arguments]    ${email}
    Input Text    ${SIGN_UP_EMAIL}    ${email}

Click SignUp Button
    Click Button    ${SIGN_UP_BUTTON}

Input Login Email
    [Arguments]    ${email}
    Input Text    ${LOGIN_EMAIL}    ${email}

Input Login Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Validate User Logged In
    ${result}=    Run Keyword And Return Status    Page Should Contain Element    //a[contains(text(),'Logged in as')]
    Should Be True    ${result}    User is not logged in
    Log    User is logged in