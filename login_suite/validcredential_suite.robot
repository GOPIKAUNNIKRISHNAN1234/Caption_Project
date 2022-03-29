*** Settings ***
Documentation      This suite will handles all the test cases related to valid
...     credential test.
Resource      ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser And Navigate To URL
Test Teardown      Close Browser

*** Test Cases ***
Verify Valid Credential Test
    Click Element    xpath=//*[@class="button-1 login-button"]
    Page Should Contain    Dashboard
    Capture Page Screenshot
