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

set TESTS_DIR=./tests/scripts
set OUTPUT_DIR=./reports

@REM Web Drivers settings

set IE_WEBDRIVER_PATH=%RBF_CORE_DIR%/web-drivers/ie-64
set IE_WEBDRIVER=%IE_WEBDRIVER_PATH%/IEDriverServer.exe

set CHROME_WEBDRIVER_PATH=%RBF_CORE_DIR%/web-drivers/chrome
set CHROME_WEBDRIVER=%CHROME_WEBDRIVER_PATH%/chromedriver.exe


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

java -Xmx512M -Dwebdriver.ie.driver="%IE_WEBDRIVER%" -Dwebdriver.chrome.driver="%CHROME_WEBDRIVER%" -cp %RBF_CLASSPATH% %RBF_MAIN_CLASS% -K off -W 79 --pythonpath %PYTHON_LIB_DIR% --outputdir %OUTPUT_DIR% %TESTS_DIR%
pause