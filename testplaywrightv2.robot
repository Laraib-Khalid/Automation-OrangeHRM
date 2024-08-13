*** Settings ***
Library    Browser
Test Template    Open Browser and Test

*** Variables ***
${URL}          https://playwright.dev/

*** Keywords ***
Get Started Link [Alternative]
    [Arguments]    ${BROWSER}
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}
    Click    a >> "Get started"
    Get Element States    h1 >> "Installation"    contains    visible
    Close Browser

*** Test Cases ***
# Define test cases using a template for parallel execution
Test in Chromium
    [Template]    Open Browser and Test
    chromium

Test in Firefox
    [Template]    Open Browser and Test
    firefox

Test in Webkit
    [Template]    Open Browser and Test
    webkit

*** Keywords ***
Open Browser and Test
    [Arguments]    ${BROWSER}
    Get Started Link [Alternative]    ${BROWSER}
