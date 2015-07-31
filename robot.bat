@REM ----------------------------------------------------------------------------
@REM
@REM RobotFramework tests launncher
@REM
@REM Usage: robot.bat
@REM ----------------------------------------------------------------------------

@echo off

set RBF_MAIN_CLASS=org.robotframework.RobotFramework
set RBF_CORE_DIR=./robotframework-core
set RBF_LIB_DIR=%RBF_CORE_DIR%/libs
set PYTHON_LIB_DIR=%RBF_LIB_DIR%/python
set STANDALONE_BROWSER_DIR=%RBF_CORE_DIR%/standalone-browsers

set TESTS_DIR=./tests/scripts
set OUTPUT_DIR=./reports

@REM ----------------------------------------------------------------------------
@REM Web Drivers settings
@REM ----------------------------------------------------------------------------
set IE_WEBDRIVER_PATH=%RBF_CORE_DIR%/web-drivers/ie-64
set IE_WEBDRIVER=%IE_WEBDRIVER_PATH%/IEDriverServer.exe

set CHROME_WEBDRIVER_PATH=%RBF_CORE_DIR%/web-drivers/chrome
set CHROME_WEBDRIVER=%CHROME_WEBDRIVER_PATH%/chromedriver.exe

@REM ----------------------------------------------------------------------------
@REM Standalone Browsers settings
@REM ----------------------------------------------------------------------------
set PHANTOMJS_BINARY=%STANDALONE_BROWSER_DIR%/phantomjs/phantomjs-2.0.0-windows/phantomjs.exe
set FIREFOX_BINARY=%STANDALONE_BROWSER_DIR%/firefox/32.0.3/FirefoxPortable.exe
set CHROME_BINARY=%STANDALONE_BROWSER_DIR%/chrome/44.0/GoogleChromePortable.exe

@REM ----------------------------------------------------------------------------
@REM Manage Parameters
@REM ----------------------------------------------------------------------------
set INCLUDE=
set EXCLUDE=--exclude not_ready
set ENV=--variable ENV:local
@ECHO OFF
:Loop
IF "%1"=="" GOTO Continue
IF "%1"=="--include" set INCLUDE=--include %2
IF "%1"=="--exclude" set EXCLUDE=--include %2 not_ready
IF "%1"=="--env" set ENV=--variable ENV:%2
SHIFT
GOTO Loop
:Continue

cls
echo ===============================================================================
echo ==                                                                           ==
echo ==                      ROBOT FRAMEWORK TEST LAUNCHER                        ==
echo ==                                                                           ==
echo ===============================================================================
echo.	
echo   Test Folder : 	%TESTS_DIR%
echo   Report Folder : 	%OUTPUT_DIR%
echo   Env :			%ENV%
echo   Include :		%INCLUDE%
echo   Exclude :		%EXCLUDE%

setLocal EnableDelayedExpansion

set RBF_CLASSPATH="
for /R %RBF_LIB_DIR% %%i in (*.jar) do (
  set RBF_CLASSPATH=!RBF_CLASSPATH!;%%i
)
set RBF_CLASSPATH=!RBF_CLASSPATH!%"


echo   Found Java Libraries:
for /R %RBF_lib_DIR% %%i in (*.jar) do echo 	%%~nxi
echo.	
echo ===============================================================================
echo.	  
echo                    LAUNCHING ROBOTFRAMEWORK TEST SCRIPTS...
echo.

java -Xmx512M -Dwebdriver.firefox.bin="%FIREFOX_BINARY%" -Dwebdriver.ie.driver="%IE_WEBDRIVER%" -Dwebdriver.chrome.bin="%CHROME_BINARY%" -Dwebdriver.chrome.driver="%CHROME_WEBDRIVER%" -Dphantomjs.binary.path="%PHANTOMJS_BINARY%" -cp %RBF_CLASSPATH% %RBF_MAIN_CLASS% -K off -W 79 --pythonpath %PYTHON_LIB_DIR% --outputdir %OUTPUT_DIR% --variable CHROME_BINARY:"%CHROME_BINARY%" %ENV% %EXCLUDE% %INCLUDE% %TESTS_DIR%
pause