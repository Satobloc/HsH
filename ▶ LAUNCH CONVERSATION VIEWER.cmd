@echo off
setlocal
cd /d "%~dp0"

where py >nul 2>nul
if %errorlevel%==0 (
  start "HsH Conversation Viewer" /min py "tools\launch_conversation_viewer.py"
  exit /b 0
)

where python >nul 2>nul
if %errorlevel%==0 (
  start "HsH Conversation Viewer" /min python "tools\launch_conversation_viewer.py"
  exit /b 0
)

echo Python was not found on this computer.
echo The Conversation Viewer launcher requires Python 3.
pause
exit /b 1
