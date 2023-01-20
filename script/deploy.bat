@echo off

call :CHECK_IS_ADMIN IS_ADMIN

if %IS_ADMIN%==true (
    rem Build application container image
    call script/build_docker_image.bat

    rem Stop/remove previous execution services (if any)
    call script/stop.bat

    rem Start services
    call script/start.bat

    rem Clean all untagged and dangling docker images
    call script/clean_images.bat

    rem Watch logs for application container...
    call script/logs_app.bat

    echo.
    echo Finished successfully.
) else (
    echo.
    echo WARNING: THIS SCRIPT MUST BE EXECUTED WITH ADMINISTRATOR PRIVILEGES, EXITING.
    echo.
)

exit /B %ERRORLEVEL%

:CHECK_IS_ADMIN
net session >nul 2>&1
    if %errorLevel% == 0 (
        set %~1=true
    ) else (
        set %~1=false
    )
exit /B 0

