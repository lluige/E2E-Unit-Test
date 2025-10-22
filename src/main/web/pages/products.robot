*** Settings ***
Library     SeleniumLibrary
Resource    ../../../resources/web/resources.robot

*** Variables ***


*** Keywords ***    
Add Item To Cart
    [Arguments]    ${item_name}
    Wait Until Page Contains Element    //div[@class="productinfo text-center"][p[normalize-space(text())="${item_name}"]]    timeout=10s
    Scroll Element Into View            //div[@class="productinfo text-center"][p[normalize-space(text())="${item_name}"]]
    Remove Iframes
    Mouse Over                          //div[@class="productinfo text-center"][p[normalize-space(text())="${item_name}"]]
    Wait Until Element Is Visible       //div[@class="product-overlay"]//div[@class="overlay-content"][p[normalize-space(text())="${item_name}"]]//a[contains(@class,"add-to-cart")]
    Click Element                       //div[@class="product-overlay"]//div[@class="overlay-content"][p[normalize-space(text())="${item_name}"]]//a[contains(@class,"add-to-cart")]

Search Item
    [Arguments]    ${search_term}
    Wait Until Element Is Visible    //input[@id="search_product"]    timeout=10s
    Input Text                       //input[@id="search_product"]    ${search_term}
    Click Button                     //button[@id="submit_search"]

Validate Search Results
    [Arguments]    ${expected_text}
    Wait Until Page Contains Element    //div[@class="features_items"]//h2[normalize-space(text())="Searched Products"]    timeout=10s
    Element Should Contain              //div[@class="features_items"]    ${expected_text}