*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FORM_FIELD}               //div[@class='login-form']
${MR_TITLE_RADIO}           //input[@id='id_gender1']
${MRS_TITLE_RADIO}          //input[@id='id_gender2']
${PASSWORD_FIELD}           //input[@data-qa='password']
${BIRTHDAY_DROPDOWN}        //select[@data-qa='days']
${BIRTHMONTH_DROPDOWN}      //select[@data-qa='months']
${BIRTHYEAR_DROPDOWN}       //select[@data-qa='years']
${FIRSTNAME_FIELD}          //input[@data-qa='first_name']
${LASTNAME_FIELD}           //input[@data-qa='last_name']
${COMPANY_FIELD}            //input[@data-qa='company']
${ADDRESS1_FIELD}           //input[@data-qa='address']
${ADDRESS2_FIELD}           //input[@data-qa='address2']
${COUNTRY_DROPDOWN}         //select[@data-qa='country']
${STATE_FIELD}              //input[@data-qa='state']
${CITY_FIELD}               //input[@data-qa='city']
${ZIPCODE_FIELD}            //input[@data-qa='zipcode']
${MOBILE_NUMBER_FIELD}      //input[@data-qa='mobile_number']
${CREATE_ACCOUNT_BUTTON}    //button[@data-qa='create-account']
${CONTINUE_BUTTON}          //section[@id='form']//a[@data-qa='continue-button']


*** Keywords ***
Validate Signup Page
    ${result}=    Run Keyword And Return Status    Page Should Contain Element    ${FORM_FIELD}    timeout=5s
    Should Be True    ${result}    Signup Page is not displayed
    Log    Signup Page is displayed

Fill Signup Form
    [Arguments]    ${title}    ${password}    ${birthdate}    ${firstname}    ${lastname}    ${company}    ${address1}    ${address2}    ${country}    ${state}    ${city}    ${zipcode}    ${mobile_number}
    
    IF    '${title}' == 'Mr'
        Click Element    ${MR_TITLE_RADIO}
    ELSE IF    '${title}' == 'Mrs'
        Click Element    ${MRS_TITLE_RADIO}
    END

    Input Text    ${PASSWORD_FIELD}    ${password}
    
    ${birth}=    Evaluate    [int(x) for x in "${birthdate}".split('/')]

    Select From List By Value    ${BIRTHDAY_DROPDOWN}      ${birth[0]}
    Select From List By Value    ${BIRTHMONTH_DROPDOWN}    ${birth[1]}
    Select From List By Value    ${BIRTHYEAR_DROPDOWN}     ${birth[2]}

    Input Text    ${FIRSTNAME_FIELD}         ${firstname}
    Input Text    ${LASTNAME_FIELD}          ${lastname}
    Input Text    ${COMPANY_FIELD}           ${company}
    Input Text    ${ADDRESS1_FIELD}          ${address1}
    Input Text    ${ADDRESS2_FIELD}          ${address2}
    Select From List By Value    ${COUNTRY_DROPDOWN}      ${country}
    Input Text    ${STATE_FIELD}             ${state}
    Input Text    ${CITY_FIELD}              ${city}
    Input Text    ${ZIPCODE_FIELD}           ${zipcode}
    Input Text    ${MOBILE_NUMBER_FIELD}     ${mobile_number}

Complete Signup
    Click Button    ${CREATE_ACCOUNT_BUTTON}

Validate Account Created
    ${result}=    Run Keyword And Return Status    Element Should Be Visible    //h2[@data-qa='account-created']    timeout=5s
    Should Be True    ${result}    Account Created page is not displayed
    Element Text Should Be    //h2[@data-qa='account-created']    ACCOUNT CREATED!
    Log    Account Created page is displayed

Continue To Home Page
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}    timeout=10s
    Click Element    ${CONTINUE_BUTTON}