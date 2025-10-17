*** Settings ***
Resource        ../../main/web/pages/home.robot
Resource        ../../main/web/pages/login.robot
Resource        ../../main/web/pages/products.robot
Resource        ../../resources/web/resources.robot
Variables       ../../resources/variables/variables.yaml

*** Test Cases ***
Valid Search
    [Documentation]    Test a valid search functionality and verify the search results.
    Open Home Page
    Go To Login Page
    Input Login Email       ${VALID_EMAIL}
    Input Login Password    ${PASSWORD}
    Click Login Button
    Validate User Logged In
    Go To Products Page
    Search Item       Men Tshirt
    Validate Search Results    Men Tshirt