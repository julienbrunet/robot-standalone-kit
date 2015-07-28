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
set FIREFOX_BINARY=%STANDALONE_BROWSER_DIR%/firefox/9.0/FirefoxPortable.exe

cls
echo ===============================================================================
echo ==                                                                           ==
echo ==                      ROBOT FRAMEWORK TEST LAUNCHER                        ==
echo ==                                                                           ==
echo ===============================================================================
echo.	
echo   Test Folder : 	%TESTS_DIR%
echo   Report Folder : 	%OUTPUT_DIR%

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

java -Xmx512M -Dwebdriver.firefox.bin="%FIREFOX_BINARY%" -Dwebdriver.ie.driver="%IE_WEBDRIVER%" -Dwebdriver.chrome.driver="%CHROME_WEBDRIVER%" -Dphantomjs.binary.path="%PHANTOMJS_BINARY%" -cp %RBF_CLASSPATH% %RBF_MAIN_CLASS% -K off -W 79 --pythonpath %PYTHON_LIB_DIR% --outputdir %OUTPUT_DIR% %TESTS_DIR%
pause