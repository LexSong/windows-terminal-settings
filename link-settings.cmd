@echo off
setlocal

set "TARGET_FILE=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "SOURCE_FILE=%~dp0settings.json"

echo This will replace your current Windows Terminal settings with a link to this folder.
set /p "confirm=Are you sure? (y/n): "
if /i "%confirm%" neq "y" exit /b

if exist "%TARGET_FILE%" del /f "%TARGET_FILE%"

echo Creating symbolic link...
mklink "%TARGET_FILE%" "%SOURCE_FILE%"

if errorlevel 1 (
    echo Failed. Run as Administrator?
) else (
    echo Done.
)