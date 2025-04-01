@echo off
:: Batch file to export and extract a solution from Dynamics 365 using PAC CLI with user selection

:: Define variables
set EXPORT_PATH=%~dp0

:: Ensure the export path exists
if not exist %EXPORT_PATH% (
    mkdir %EXPORT_PATH%
)


echo No authentication found. Proceeding with authentication...
pac auth create --url https://emcrdev.crm3.dynamics.com/
if %ERRORLEVEL% neq 0 (
    echo ERROR: Authentication failed. Please try again.
    pause
    exit /b
)

set /p SOLUTION_NAME="Please enter the solution name: "

:: Display selected solution
echo You have selected: %SOLUTION_NAME%

:: Export the unmanaged solution
echo Exporting unmanaged solution: %SOLUTION_NAME%...
set ZIP_FILE_UNMANAGED=%EXPORT_PATH%\%SOLUTION_NAME%\%SOLUTION_NAME%_unmanaged.zip
pac solution export --name "%SOLUTION_NAME%" --path %ZIP_FILE_UNMANAGED% --managed false -ow true


:: Export the managed solution
echo Exporting unmanaged solution: %SOLUTION_NAME%...
set ZIP_FILE_MANAGED=%EXPORT_PATH%\%SOLUTION_NAME%\%SOLUTION_NAME%.zip
pac solution export --name "%SOLUTION_NAME%" --path %ZIP_FILE_MANAGED% --managed true -ow true

:: Check if the unmanaged export was successful
if exist %ZIP_FILE_UNMANAGED% (
    echo Unmanaged solution exported successfully to: %ZIP_FILE_UNMANAGED%
) else (
    echo ERROR: Unmanaged solution export failed!
    pause
    exit /b
)

:: Extract the unmanaged solution
set EXTRACT_PATH_UNMANAGED=%EXPORT_PATH%\%SOLUTION_NAME%\Unmanaged
pac solution unpack --zipfile %ZIP_FILE_UNMANAGED% --folder %EXTRACT_PATH_UNMANAGED% --allowDelete true --allowWrite true

:: Check if extraction of unmanaged solution was successful
if exist %EXTRACT_PATH_UNMANAGED% (
    echo Unmanaged solution extracted successfully to: %EXTRACT_PATH_UNMANAGED%
) else (
    echo ERROR: Unmanaged solution extraction failed!
)

:: Extract the managed solution
echo Extracting managed solution...
set EXTRACT_PATH_MANAGED=%EXPORT_PATH%\%SOLUTION_NAME%\Managed
pac solution unpack --zipfile %ZIP_FILE_MANAGED% --folder %EXTRACT_PATH_MANAGED% --allowDelete true --allowWrite true --packagetype Managed

:: Check extraction success
if not exist "%EXTRACT_PATH_MANAGED%" (
    echo ERROR: Managed solution extraction failed!
    pause
    exit /b
)
echo Managed solution extracted successfully to: %EXTRACT_PATH_MANAGED%

:: Create deployment settings files using PAC CLI
setlocal enabledelayedexpansion
set ENVIRONMENTS=uat train prod

:: Generate a base deployment settings file
set BASE_SETTINGS_FILE=%SOLUTION_DIR%\base.deploymentsettings.json
pac solution create-settings --solution-zip "%EXPORT_PATH%\%SOLUTION_NAME%\%SOLUTION_NAME%".zip --settings-file "%EXPORT_PATH%\%SOLUTION_NAME%\%BASE_SETTINGS_FILE%"

@REM if not exist "%BASE_SETTINGS_FILE%" (
@REM     echo ERROR: Failed to create base deployment settings file!
@REM     pause
@REM     exit /b
@REM )
@REM echo Base deployment settings file created: %BASE_SETTINGS_FILE%

@REM :: Copy base settings to each environment-specific file
@REM for %%E in (%ENVIRONMENTS%) do (
@REM     set DEPLOYMENT_FILE=%SOLUTION_DIR%\%%E.deploymentsettings.json
@REM     copy /Y "%BASE_SETTINGS_FILE%" "!DEPLOYMENT_FILE!"
    
@REM     if exist "!DEPLOYMENT_FILE!" (
@REM         echo Deployment settings file created: !DEPLOYMENT_FILE!
@REM     ) else (
@REM         echo ERROR: Failed to create deployment settings file for %%E!
@REM     )
@REM )

echo Process completed successfully!
pause

