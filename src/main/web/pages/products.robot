*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***    
Add Item To Cart
    [Arguments]    ${item_name}
    Wait Until Page Contains Element    //div[@class="productinfo text-center"][p[normalize-space(text())="${item_name}"]]    timeout=10s
    Scroll Element Into View            //div[@class="productinfo text-center"][p[normalize-space(text())="${item_name}"]]
    Remove Iframes
    Wait Until Element Is Visible       //div[@class="product-overlay"]//div[@class="overlay-content"][p[normalize-space(text())="${item_name}"]]//a[contains(@class,"add-to-cart")]
    Click Element                       //div[@class="product-overlay"]//div[@class="overlay-content"][p[normalize-space(text())="${item_name}"]]//a[contains(@class,"add-to-cart")]

Remove Iframes
    Execute JavaScript                  document.querySelectorAll('ins.adsbygoogle').forEach(e => e.remove());