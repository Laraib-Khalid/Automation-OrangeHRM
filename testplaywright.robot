#*** Settings ***
#Library    Browser
#
#
#*** Variables ***
##${URL}    https://www.google.com/
#
#${URL}          https://playwright.dev/
#
#*** Keywords ***
#Get Started Link [Alternative]
#    New Browser     chromium    headless=false
#    New Page    https://playwright.dev/
#    Click    a >> "Get started"
#    Get Element States    h1 >> "Installation"    contains    visible
#
#
#*** Test Cases ***
#
#Test in Chromium
#        Sleep    7s
#        Get Started Link [Alternative]
##        Open Browser        ${URL}          chromium     firefox
##       [Documentation]    Test the website in Chromium browser
##       Open Browser    Get Started Link [Alternative]    chromium
##       Take Screenshot    chromium_screenshot.png
###       Close Browser
##
###Test in Firefox
###        Sleep    7s
###       [Documentation]    Test the website in Firefox browser
##       Open Browser    ${URL}    firefox
##       Take Screenshot    firefox_screenshot.png
###       Close Browser
##
###Test in Webkit
###        Sleep    7s
###       [Documentation]    Test the website in Webkit browser
##       Open Browser    ${URL}    webkit
##       Take Screenshot    webkit_screenshot.png
###       Close Browser


*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://playwright.dev/

*** Keywords ***
Get Started Link
    [Arguments]    ${BROWSER}
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}
    Click    a >> "Get started"
    Get Element States    h1 >> "Installation"    contains    visible
    Close Browser

*** Test Cases ***
Test in Chromium
    Get Started Link    chromium

Test in Firefox
    Get Started Link    firefox

Test in Webkit
    Get Started Link    webkit
