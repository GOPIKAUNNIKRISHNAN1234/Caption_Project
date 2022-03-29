*** Settings ***
Documentation   This suite will test the membership details
Resource      ../Resource/Base/CommonFunctionality.resource
Test Setup      Launch Browser And Navigate To URL
Test Teardown       Close Browser

Test Template       Customers
*** Test Cases ***
TC1     	admin@yourStore.com      John     Smith

*** Keywords ***
Customers
    [Arguments]     ${Email}     ${First_name}     ${Last_name}
    Set Selenium Speed      1s
    Click Element    xpath=//*[@class="button-1 login-button"]
    Click Element    xpath=//*[@class="nav-icon far fa-user"]
    Click Element    xpath=//a[@href="/Admin/Customer/List"]
    Input Text    id=SearchEmail   ${Email}
    Input Text    id=SearchFirstName    ${First_name}
    Input Text    id=SearchLastName    ${Last_name}
    Click Button    id=search-customers
    Capture Page Screenshot

