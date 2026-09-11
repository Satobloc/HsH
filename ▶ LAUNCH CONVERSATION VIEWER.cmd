@echo off
setlocal
cd /d "%~dp0"
set "PORT=8765"

where py >nul 2>nul
if %errorlevel%==0 (
  start "HsH Conversation Viewer Server" /min py -m http.server %PORT%
) else (
  where python >nul 2>nul
  if %errorlevel%==0 (
    start "HsH Conversation Viewer Server" /min python -m http.server %PORT%
  ) else (
    echo Python was not found on this computer.
    echo Install Python or launch manually with: python -m http.server %PORT%
    pause
    exit /b 1
  )
)

>nul 2>&1 timeout /t 1 /nobreak
start "" "http://127.0.0.1:%PORT%/CONVERSATION_VIEWER/"
exit /b 0
