*** Settings ***
Resource          ../../resources/base.resource
Resource          ../../resources/services/ProductService.resource
Test Setup        Start API Session

*** Test Cases ***
Should Validate Product List Availability
    [Tags]    smoke    api
    ${response}    Search For Product
    
    Status Should Be    200    ${response}

Should Search Product By Name
    [Tags]    regression    api
    ${product_name}    Set Variable    Apple Juice
    ${response}    Search For Product    search_term=${product_name}

    Status Should Be    200    ${response}
    Should Contain    ${response.json()['data'][0]['name']}    ${product_name}