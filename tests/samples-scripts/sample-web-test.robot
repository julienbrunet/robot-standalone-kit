*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Web Test
    Open Browser    http://www.google.fr
    Page Should Contain    Google
    Close All Browsers
