*** Settings ***
Resource          ../../resources/base.resource
Resource          ../../resources/services/ProductService.resource
Test Setup        Start API Session

*** Test Cases ***
Validate Product List Availability
    [Tags]    smoke    api
    ${response}    Get All Products
    
    Status Should Be    200    ${response}