@echo off
setlocal
set ENV_FILE=environment.env

call :CHECK_IS_ADMIN IS_ADMIN

if %IS_ADMIN%==true (
    cd docker
    echo.
    echo Stopping using the environment file: %ENV_FILE%
    docker compose --env-file ../%ENV_FILE% down
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
