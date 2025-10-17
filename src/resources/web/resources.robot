*** Settings ***
Library      SeleniumLibrary
Variables    ../../resources/variables/variables.yaml


*** Variables ***
${BROWSER}    gc

*** Keywords ***
Open Home Page
    [Documentation]    Abre a página do login.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Finish Test
    [Documentation]    Encerra a sessão do navegador.
    Close Browser

Remove Iframes
    Execute JavaScript                  document.querySelectorAll('ins.adsbygoogle').forEach(e => e.remove());