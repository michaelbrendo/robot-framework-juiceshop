*** Settings ***
Resource    ../base.resource

*** Keywords ***
Get All Products
    # Using an empty search term as a baseline
    ${params}      Create Dictionary    q=${EMPTY}
    ${response}    GET On Session    juice_api    /rest/products/search    params=${params}    expected_status=any
    RETURN         ${response}