*** Settings ***
Resource    ../../resources/web/resources.robot
Resource    ../../main/web/pages/login.robot
Resource    ../../main/web/pages/home.robot
Resource    ../../main/web/pages/cart.robot
Resource    ../../main/web/pages/products.robot

*** Variables ***


*** Test Cases ***
Add Item To Cart
    [Documentation]    Test to add an item to the cart and verify it is added successfully.
    [Tags]    Cart
    Open Home Page
    Go To Login Page
    Validate Login Page
    Input Login Email       ${VALID_EMAIL}
    Input Login Password    ${PASSWORD}
    Click Login Button
    Validate User Logged In
    Go To Products Page
    Add Item To Cart    Men Tshirt
    Go To Cart Page
    Validate Item In Cart    Men Tshirt

    [Teardown]    Finish Test

Remove Item From Cart
    [Documentation]    Test to remove an item from the cart and verify it is removed successfully.
    [Tags]    Cart 
    Open Home Page
    Go To Login Page
    Validate Login Page
    Input Login Email       ${VALID_EMAIL}
    Input Login Password    ${PASSWORD}
    Click Login Button
    Validate User Logged In
    Go To Products Page
    Add Item To Cart    Men Tshirt
    Go To Cart Page
    Remove Item    Men Tshirt
    Validate Item Removed From Cart    Men Tshirt

    [Teardown]    Finish Test