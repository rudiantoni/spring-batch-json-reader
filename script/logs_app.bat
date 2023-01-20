@echo off
setlocal
rem Reads local environment file and sets as local variabels in this script
set ENV_FILE=environment.env
for /F "tokens=*" %%i in ('type %ENV_FILE%') do set %%i

call :CHECK_IS_ADMIN IS_ADMIN

if %IS_ADMIN%==true (
    echo.
    echo Watching logs for %APPLICATION_CONTAINER_NAME% application container...
    docker logs -f --tail 500 %APPLICATION_CONTAINER_NAME%
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
