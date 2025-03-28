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

:: Check if extraction of managed solution was successful
if exist %EXTRACT_PATH_MANAGED% (
    echo Managed solution extracted successfully to: %EXTRACT_PATH_MANAGED%
) else (
    echo ERROR: Managed solution extraction failed!
)


echo Process completed.
pause
