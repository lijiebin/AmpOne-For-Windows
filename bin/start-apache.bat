@echo off
set server_name=AmpOneApache 
set apache_root=%cd%\apps\Apache24
set apache_init_opts=-k install -n %server_name% -f %apache_root%\conf\httpd.conf

setlocal EnableDelayedExpansion

if %1==start (
    %apache_root%\bin\httpd %apache_init_opts%
    net start %server_name%
    exit /b !ERRORLEVEL!
)

if %1==stop (
    net stop %server_name%
    sc delete %server_name%
    exit /b !ERRORLEVEL!
)
