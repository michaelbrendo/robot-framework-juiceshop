*** Settings ***
Documentation       API test suite for Juice Shop product search and contract validation.
...                 This suite ensures that product endpoints are reachable and
...                 return data according to the defined JSON schemas.

Resource            ../../resources/base.resource
Resource            ../../resources/services/ProductService.resource

Test Setup          Start API Session


*** Test Cases ***
Should Validate Product List Availability
    [Documentation]    Ensures the general product list is available and the
    ...    JSON response matches the search contract.
    [Tags]    smoke    api
    ${response}    Get Product Search Results

    Status Should Be    200    ${response}
    Assert Product Contract    json_data=${response.json()}    schema_key=SEARCH

Should Search Product By Name
    [Documentation]    Ensures the search functionality filters products correctly by name
    ...    while maintaining the integrity of the JSON contract.
    [Tags]    regression    api
    ${product_name}    Set Variable    Apple Juice
    ${response}    Get Product Search Results    search_term=${product_name}

    Status Should Be    200    ${response}
    Assert Product Contract    json_data=${response.json()}    schema_key=SEARCH
    Should Contain    ${response.json()['data'][0]['name']}    ${product_name}
