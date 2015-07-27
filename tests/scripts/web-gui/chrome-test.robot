*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Web Test
    Open Browser    http://www.google.fr    browserName=chrome
    Maximize Browser Window
    Page Should Contain    Google
    Capture Page Screenshot
    Close All Browsers
