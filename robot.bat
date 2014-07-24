@REM ----------------------------------------------------------------------------
@REM
@REM RobotFramework tests launcnher
@REM
@REM Usage: launcher.bat
@REM ----------------------------------------------------------------------------

@echo off
set RBF_MAIN_CLASS=org.robotframework.RobotFramework

set RBF_CORE_DIR=./robotframework-core
set RBF_LIB_DIR=%RBF_CORE_DIR%/libs
set PYTHON_LIB_DIR=%RBF_LIB_DIR%/python
set TESTS_DIR=./tests/scripts
set OUTPUT_DIR=./reports

cls
echo ===============================================================================
echo ==                            ROBOT FRAMEWORK                                ==
echo ===============================================================================

setLocal EnableDelayedExpansion

set RBF_CLASSPATH="
for /R %RBF_CORE_DIR% %%i in (*.jar) do (
  set RBF_CLASSPATH=!RBF_CLASSPATH!;%%i
)
set RBF_CLASSPATH=!RBF_CLASSPATH!%"

echo [ INFO ] Test Folder : %TESTS_DIR%
echo [ INFO ] Report Folder : %OUTPUT_DIR%
echo [ INFO ] Found Java Libraries:
for /R %RBF_CORE_DIR% %%i in (*.jar) do (
    echo [ INFO ]       %%i
)
echo ===============================================================================

echo [ INFO ] Starting RobotFramework Tests...

java -Xmx512M -cp %RBF_CLASSPATH% %RBF_MAIN_CLASS% -K off -W 79 --pythonpath %PYTHON_LIB_DIR% --outputdir %OUTPUT_DIR% %TESTS_DIR%
pause