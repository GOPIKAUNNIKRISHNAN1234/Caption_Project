*** Comments ***


*** Settings ***
Documentation   This suite will test the membership details
Resource      ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser And Navigate To URL
Test Teardown       Close Browser

Test Template       Verify Add Membership Template
*** Test Cases ***
TC1     Build your own computer      All     All      All       All       All      All      10000
#TC2     Admin      admin123     ACCA      Individual       5000       AUD      2022-03-19      2023-04-21

*** Keywords ***
Verify Add Membership Template
    [Arguments]     ${Product name}     ${Category}     ${Manufacturer}       ${Vendor}       ${Warehouse}     ${Product type}     ${Published}    ${Go directly to product SKU}
    Click Element    xpath=//*[@class="button-1 login-button"]
    Click Element  xpath=//*[@class="nav-icon fas fa-book"]
    Click Element  xpath=//p[contains(text(),'Products')]
    Input Text    id=SearchProductName  ${Product name}

    Select From List By Value     xpath=//select[@id="SearchCategoryId"]    1
    Select From List By Value     xpath=//select[@id="SearchCategoryId"]    1
    Select From List By Value     xpath=//select[@id="SearchManufacturerId"]    2
    Select From List By Value     xpath=//select[@id="SearchVendorId"]    1
    Select From List By Value     xpath=//select[@id="SearchWarehouseId"]    2
    Select From List By Value     xpath=//select[@id="SearchProductTypeId"]    5
    Select From List By Value    id=SearchPublishedId   1
    Input Text    id=GoDirectlyToSku    ${Go directly to product SKU}
    Click Button    id=search-products
    Capture Page Screenshot