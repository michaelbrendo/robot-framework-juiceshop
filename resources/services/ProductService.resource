*** Settings ***
Resource    ../base.resource

*** Keywords ***
Search For Product
    [Arguments]    ${search_term}=${EMPTY}
    ${params}      Create Dictionary    q=${search_term}
    ${response}    GET On Session    juice_api    /rest/products/search    params=${params}    expected_status=any
    RETURN         ${response}