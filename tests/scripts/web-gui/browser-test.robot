*** Settings ***
Library    Selenium2Library

*** Variables ***
${URL}    http://www.google.com

*** Test Cases ***
Chrome Browser Check
    [Teardown]    Close All Browsers
    Open Browser    ${URL}    browserName=chrome
    Test Selenium On Google

PhantomJS Browser Check
    [Teardown]    Close All Browsers
    Open Browser    ${URL}    browserName=phantomjs
    Test Selenium On Google

Firefox Browser Check
    [Teardown]    Close All Browsers
    Open Browser    ${URL}    browserName=firefox
    Test Selenium On Google

Internet Explorer Browser Check
    [Teardown]    Close All Browsers
    Open Browser    ${URL}    browserName=ie
    Test Selenium On Google


*** Keywords ***
Test Selenium On Google
    Maximize Browser Window
    Page Should Contain    Google
    Input Text    //input[@title='Rechercher']    robotframework
    Wait Until Page Contains    robotframework.org    timeout=10 seconds
    Capture Page Screenshot
