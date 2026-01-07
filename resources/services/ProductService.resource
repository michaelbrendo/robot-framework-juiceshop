*** Settings ***
Documentation       Service resource for interacting with the Juice Shop Products API.
...                 Handles request construction and schema mapping.

Resource            ../base.resource
Library             Collections
Library             JSONSchemaLibrary    ${EXECDIR}/resources/data/


*** Variables ***
&{PRODUCT_SCHEMAS}
...                     SEARCH=product_search_schema.json
...                     LIST=product_list_schema.json
...                     DETAIL=product_detail_schema.json


*** Keywords ***
Get Product Search Results
    [Documentation]    Performs a product search using an optional query parameter.
    [Arguments]    ${search_term}=${EMPTY}
    ${params}    Create Dictionary    q=${search_term}
    ${response}    GET On Session    juice_api    /rest/products/search    params=${params}    expected_status=any
    RETURN    ${response}

Assert Product Contract
    [Documentation]    Retrieves the correct schema file from the dictionary and validates the JSON data.
    [Arguments]    ${json_data}    ${schema_key}
    ${schema_file}    Get From Dictionary    ${PRODUCT_SCHEMAS}    ${schema_key}

    Validate Json    ${schema_file}    ${json_data}
