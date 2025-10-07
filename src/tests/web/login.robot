*** Settings ***
Resource           ../../main/web/pages/home.robot
Resource           ../../main/web/pages/login.robot
Resource           ../../main/web/pages/signup.robot
Resource           ../../resources/web/resources.robot

*** Test Cases ***
New User Sign Up
    [Documentation]    Test Case to validate new user sign up functionality.
    [Tags]    SignUp
    Open Home Page
    Go To Login Page
    Validate Login Page
    Input SignUp Name    Joe Doe
    Input SignUp Email   ${EMAIL}        # NEED TO CHANGE TO A UNIQUE EMAIL EACH TIME (IN VARIABLES FILE)
    Click SignUp Button
    Validate Signup Page
    Fill Signup Form    Mr    ${PASSWORD}    01/01/1990    Joe    Doe    Example Corp    123 Main St    Apt 4B    United States    CA    Los Angeles    90001    555-1234
    Complete Signup
    Validate Account Created
    Continue To Home Page
    Logout

    [Teardown]    Finish Test

Valid User Login
    [Documentation]    Test Case to validate existing user login functionality.
    [Tags]    SignIn
    Open Home Page
    Go To Login Page
    Validate Login Page
    Input Login Email      ${VALID_EMAIL}        # ATTENTION HERE, MUST BE AN EXISTING EMAIL ACCOUNT
    Input Login Password   ${PASSWORD}
    Click Login Button
    Validate User Logged In

    [Teardown]    Finish Test

Invalid User Login
    [Documentation]    Test Case to validate login functionality with invalid credentials.
    [Tags]    Login    Negative
    Open Home Page
    Go To Login Page
    Validate Login Page
    Input Login Email      ${INVALID_EMAIL}
    Input Login Password   ${PASSWORD}
    Click Login Button
    Validate Error Message

    [Teardown]    Finish Test