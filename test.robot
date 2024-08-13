*** Settings ***
Library     SeleniumLibrary
Library     custom.py
#Resource    input.resource

*** Variables ***
#${DROPDOWN_XPATH}     //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div
${USER_ROLE_DROPDOWN_XPATH}       //*[@class='oxd-select-text oxd-select-text--active']
${USER_ROLE_OPTION_XPATH}         //*[@class='oxd-select-option']
#${OPTION_XPATH}       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[1]
${USER_ROLE_INDEX_TO_SELECT}    1



${INPUT_FIELD}  xpath=//input[@placeholder='Type for hints...']
${TEXT}         Timothy Lewis Amiano
${DROPDOWN}     xpath=//div[@role='listbox' and contains(@class, 'oxd-autocomplete-dropdown --positon-bottom')]
#${OPTION}       xpath=//div[@role='listbox']//div[contains(text(), '${TEXT}')]



${Status_DROPDOWN_XPATH}        xpath=//*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div
${Status_OPTION_XPATH}         xpath=//*[@class='oxd-select-option']
${Status_INDEX_TO_SELECT}    1


${SYSTEM_USER_ROLE_DROPDOWN_XPATH}     xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[2]/div/div[2]/div/div
${SYSTEM_USER_ROLE_OPTION_XPATH}       xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[2]/div/div[2]/div/div/div[1]
${SYSTEM_USER_ROLE_INDEX_TO_SELECT}    1


${SYSTEM_USER_STATUS_DROPDOWN_XPATH}        xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[4]/div/div[2]/div/div
${SYSTEM_USER_STATUS_OPTION_XPATH}         xpath=//*[@class='oxd-select-option']
${SYSTEM_USER_STATUS_INDEX_TO_SELECT}    1

*** Keywords ***
Login
    Open Browser        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login          Chrome
#    Open Browser    https://www.facebook.com/reg/    Chrome
#    Wait Until Element Is Visible    //*[@id="day"]
#    Click Element    //*[@id="menu-item-3869"]/div/a
#    Sleep    3s
#    Select From List By Index  //*[@id="day"]  2
##    List Selection Should Be  //*[@id="menu-item-3456"]/a  Life at BSS
    Sleep    5s
##    Click Element    ${inputvariable}
#    Input Text    ${inputvariable}    ${value}
    Input Text          xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[1]/div[1]/div[2]/input[1]   Admin
#    Input Password          xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input    admin123
    Input Password          xpath=//*[@class='oxd-input oxd-input--active']        admin123
    Click Button            xpath=//button[@type='submit']
    Sleep    2s
    Element Should Be Visible   xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    #Title Should Be    OrangeHRM


Select Admin From Sidebar
    Sleep    3s
    Click Element    xpath=//*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    Sleep    5s


#   Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div
#    Select From List By Label    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[1]
#    List Selection Should Be    /html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[1]
#    Get Selected List Value    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[1]
#    Select From List By Value    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[1]
#    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[1]
#    Wait Until Element Contains    /html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div    --Select--
#    Select From List By Index  /html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div  1
#    List Selection Should Be  /html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div  Admin
##    Select From List By Value  *[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div  2
#    List Selection Should Be  *[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div  Option 2

Add User

    Click Button    xpath=//*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    Sleep    5s
    Element Should Contain    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/h6   Add User


# Try to select the option and catch any indexing errors
    ${USER_ROLE_status}    ${USER_ROLE_error}=    Run Keyword And Ignore Error    Div List    ${USER_ROLE_DROPDOWN_XPATH}    ${USER_ROLE_OPTION_XPATH}    ${USER_ROLE_INDEX_TO_SELECT}

    Run Keyword If    '${USER_ROLE_status}' == 'FAIL' and 'IndexError' in '${USER_ROLE_error}'
    ...    Log    IndexError: The specified index ${USER_ROLE_INDEX_TO_SELECT} is out of range.
    ...    ELSE
    ...    Log    Option selected successfully.

    Sleep    5s

    Click Element  ${INPUT_FIELD}
    Input Text  ${INPUT_FIELD}  ${TEXT}
    Sleep    5s
#    Wait Until Element Is Visible  ${DROPDOWN} timeout=20s
    Click Element    ${DROPDOWN}


# Status Selected Code

    ${Status_status}    ${Status_error}=    Run Keyword And Ignore Error    Div List    ${Status_DROPDOWN_XPATH}    ${Status_OPTION_XPATH}    ${Status_INDEX_TO_SELECT}

    Run Keyword If    '${Status_status}' == 'FAIL' and 'IndexError' in '${Status_error}'
    ...    Log    IndexError: The specified index ${Status_INDEX_TO_SELECT} is out of range.
    ...    ELSE
    ...    Log    Option selected successfully.
 
 
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    Test123
    Input Password    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[1]/div/div[2]/input    Test123
    Sleep    5s
    Input Password    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[2]/div/div[2]/input    Test123
    Sleep    5s
    Click button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[3]/button[2]
    Sleep    5s
    Wait Until Element Contains   xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[1]/div[1]/h5    System Users


Search System User

#   Enter Username
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    Test123
    Sleep    5s


# Select User Role
    ${SYSTEM_USER_ROLE_Status}    ${SYSTEM_USER_ROLE_Error}=    Run Keyword And Ignore Error    Div List    ${SYSTEM_USER_ROLE_DROPDOWN_XPATH}    ${USER_ROLE_OPTION_XPATH}    ${USER_ROLE_INDEX_TO_SELECT}

    Run Keyword If    '${SYSTEM_USER_ROLE_Status}' == 'FAIL' and 'IndexError' in '${SYSTEM_USER_ROLE_Error}'
    ...    Log    IndexError: The specified index ${SYSTEM_USER_ROLE_INDEX_TO_SELECT} is out of range.
    ...    ELSE
    ...    Log    Option selected successfully.

    Sleep    5s


#   Select Employee Name
    Click Element  ${INPUT_FIELD}
    Input Text  ${INPUT_FIELD}  ${TEXT}
    Sleep    5s
    Click Element    ${DROPDOWN}

    Sleep    5s


# Status Selected Code

    ${SYSTEM_USER_STATUS_status}    ${SYSTEM_USER_STATUS_error}=    Run Keyword And Ignore Error    Div List    ${SYSTEM_USER_STATUS_DROPDOWN_XPATH}    ${SYSTEM_USER_STATUS_OPTION_XPATH}    ${SYSTEM_USER_STATUS_INDEX_TO_SELECT}

    Run Keyword If    '${SYSTEM_USER_STATUS_status}' == 'FAIL' and 'IndexError' in '${SYSTEM_USER_STATUS_error}'
    ...    Log    IndexError: The specified index ${SYSTEM_USER_STATUS_INDEX_TO_SELECT} is out of range.
    ...    ELSE
    ...    Log    Option selected successfully.
    
    
    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    Sleep    10s
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div
    Sleep    10s


Delete System User

    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[1]
    Wait Until Element Is Visible    xpath=/html/body/div/div[3]/div/div/div/div[1]/p
    Click Button    xpath=/html/body/div/div[3]/div/div/div/div[3]/button[2]
    Wait Until Element Contains    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[2]/div/span    No Records Found
*** Test Cases ***

Testcase_1:
    Login

Testcase_2:
    Select Admin From Sidebar

Testcase_3:
    Add User

Testcase_4:
    Search System User

Testcase_5:
    Delete System User
