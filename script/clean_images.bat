@echo off
setlocal

call :CHECK_IS_ADMIN IS_ADMIN

if %IS_ADMIN%==true (
    echo.
    echo Cleaning all untagged and dangling docker images
    for /F "tokens=*" %%n in ('docker images -q -f "dangling=true"') do @(docker rmi -f %%n)
) else (
    echo.
    echo WARNING: THIS SCRIPT MUST BE EXECUTED WITH ADMINISTRATOR PRIVILEGES, EXITING.
    echo.
)
endlocal

exit /B %ERRORLEVEL%

:CHECK_IS_ADMIN
net session >nul 2>&1
    if %errorLevel% == 0 (
        set %~1=true
    ) else (
        set %~1=false
    )
exit /B 0
