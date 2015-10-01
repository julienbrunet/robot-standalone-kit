*** Settings ***
Library    Selenium2Library
Library    Collections

*** Variables ***
${URL}    http://www.google.com

*** Test Cases ***
Chrome Browser Check
    [tags]    browser    chrome
    [Teardown]    Close All Browsers
    ${capabilities}=    Create Dictionary
    Set To Dictionary    ${capabilities}    binary    toto
    Open Browser    ${URL}    browserName=chrome    desiredCapabilities=${capabilities}
    Test Selenium On Google

PhantomJS Browser Check
    [tags]    browser    phantomjs
    [Teardown]    Close All Browsers
    Open Browser    ${URL}    browserName=phantomjs
    Test Selenium On Google

Firefox Browser Check
    [tags]    browser    firefox
    [Teardown]    Close All Browsers
    Open Browser    ${URL}    browserName=firefox
    Test Selenium On Google

Internet Explorer Browser Check
    [tags]    browser    ie
    [Teardown]    Close All Browsers
    Open Browser    ${URL}    browserName=ie
    Test Selenium On Google


*** Keywords ***
Test Selenium On Google
    Maximize Browser Window
    Sleep    5 seconds
    Page Should Contain    Google
    Input Text    //input[@title='Rechercher']    robotframework
    Wait Until Page Contains    robotframework.org    timeout=10 seconds
    Capture Page Screenshot
