*** Settings ***
Library    org.robot.database.keywords.DatabaseLibrary

*** Variables ***
${DB_DRIVER}      org.h2.Driver
${DB_URL}         jdbc:h2:C:/BUSDATA/git/robot-training/exercices/tools/h2/robot-test;AUTO_SERVER=true
${DB_USER}        robot
${DB_PASSWORD}    robot

*** Test Cases ***
Test Derby Database
    [tags]    database
    Connect To Database    ${DB_DRIVER}    ${DB_URL}    ${DB_USER}    ${DB_PASSWORD}
    Execute SQL from File    tests/scripts/myFile.sql