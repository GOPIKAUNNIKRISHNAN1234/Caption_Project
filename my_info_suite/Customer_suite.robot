Customer code
*** Settings ***
Documentation      This suite handles test case related to Customer Search
Resource    ../Resource/Base/CommonFunctionality.resource

Library     DataDriver      file=../test_data/data.xlsx      sheet_name=About


Test Setup      Launch Browser And Navigate To URL
Test Teardown      Close Browser

Test Template       Verify About Template


*** Test Cases ***
TC1        admin@yourStore.com         John      Smith

*** Keywords ***
Verify About Template
    [Arguments]     ${Email}     ${First_name}     ${Last_name}
    Set Selenium Speed    2s
    Click Element    xpath=//*[@class="button-1 login-button"]
    Click Element    xpath=//*[@class="nav-icon far fa-user"]
    Click Element    //a[@href='/Admin/Customer/List']
    Input Text    id=SearchEmail   ${Email}
    Input Text    id=SearchFirstName    ${First_name}
    Input Text    id=SearchLastName    ${Last_name}
    Click Button    id=search-customers
    Capture Page Screenshot
