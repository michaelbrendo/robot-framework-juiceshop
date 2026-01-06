*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Keywords ***
Start API Session
    Create Session    juice_api    url=${BASE_URL}    disable_warnings=1