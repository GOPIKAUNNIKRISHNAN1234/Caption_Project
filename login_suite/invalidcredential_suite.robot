*** Settings ***
Documentation      This suite will handles all the test cases related to invalid
...     credential test for orangehrm. Test case - TC_OH_3,4,5
Resource      ../Resource/Base/CommonFunctionality.resource


Test Setup      Launch Browser And Navigate To URL
Test Teardown      Close Browser

Test Template       Verify Invalid Credential Template

*** Test Cases ***
TC1       abcd@gmail.com      thndb     Login was unsuccessful.
TC2       mnop@gmail.com      gdhey     Login was unsuccessful.
#TC3       ${EMPTY}      admin123        Username cannot be empty
#TC4       bala       ${EMPTY}       Password cannot be empty


*** Keywords ***
Verify Invalid Credential Template
    [Arguments]     ${email}     ${password}     ${expectederror}
    Input Text    id=Email    ${email}
    Input Password    id=Password    ${password}
    Click Element    xpath=//*[@class="button-1 login-button"]
    Element Should Contain    xpath=//*[@class="message-error validation-summary-errors"]    ${expectederror}