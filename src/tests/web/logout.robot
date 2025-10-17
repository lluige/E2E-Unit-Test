*** Settings ***
Resource        ../../main/web/pages/home.robot
Resource        ../../main/web/pages/checkout.robot
Resource        ../../main/web/pages/cart.robot
Resource        ../../main/web/pages/products.robot
Resource        ../../main/web/pages/login.robot

*** Test Cases ***
Logout After Checkout
    [Documentation]    Logout Test After Completing a Purchase
    [Tags]    Logout
    Open Home Page
    Go To Login Page
    Validate Login Page
    Input Login Email       ${VALID_EMAIL}
    Input Login Password    ${PASSWORD}
    Click Login Button
    Validate User Logged In
    Go To Products Page
    Add Item To Cart        Men Tshirt
    Go To Cart Page
    Proceed To Checkout
    Place Order
    Input Payment Details    ${NAME_ON_CARD}    ${CARD_NUMBER}    ${CVC}    ${EXPIRY_MONTH}    ${EXPIRY_YEAR}
    Submit Payment
    Verify Order Confirmation
    Logout User
    Validate Login Page

    [Teardown]    Finish Test