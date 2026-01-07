*** Settings ***
Documentation       Global setup and configuration for Juice Shop API testing.
...                 This resource initializes the base sessions used by all services.
Library             RequestsLibrary


*** Variables ***
${BASE_URL}         http://localhost:3000


*** Keywords ***
Start API Session
    [Documentation]    Initializes a global session for the Juice Shop API.
    ...                Disables warnings for a cleaner log output.
    Create Session     juice_api    url=${BASE_URL}    disable_warnings=1