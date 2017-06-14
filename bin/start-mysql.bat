@echo off
set server_name=AmpOneMySQL
set mysql_root=%cd%\apps\mysql-5.7.17
set mysql_init_opts=--install %server_name% --defaults-file=%mysql_root%\my.ini

setlocal EnableDelayedExpansion

if exist %cd%\data (
    %mysql_init_opts% = %mysql_init_opts% --initialize-insecure
)

if %1==start (
    %mysql_root%\bin\mysqld %mysql_init_opts%
    net start %server_name%
    exit /b !ERRORLEVEL!
)

if %1==stop (
    net stop %server_name%
    sc delete %server_name%
    exit /b !ERRORLEVEL!
)