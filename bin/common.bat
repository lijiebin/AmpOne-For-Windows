@echo off
sc query %1 | find "RUNNING"
if %errorlevel% == 0 (
    exit /b 1
)