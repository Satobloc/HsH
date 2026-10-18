@echo off
setlocal
cd /d "%~dp0"
title MERSEARCH - Glass Archive Search
echo.
echo ==========================================
echo             MERSEARCH
echo          THE GLASS ARCHIVE
echo ==========================================
echo.
echo Launching the local three-archive research interface...
echo This server runs ONLY on your computer.
echo Close this window or press Ctrl+C to stop it.
echo.
where py >nul 2>nul
if not errorlevel 1 (
    py -3 tools\serve_mersearch_ui.py --profile research
    goto :done
)
where python >nul 2>nul
if not errorlevel 1 (
    python tools\serve_mersearch_ui.py --profile research
    goto :done
)
echo Python 3 was not found.
echo Install Python 3 or add it to PATH and run this file again.
:done
echo.
echo Mersearch has stopped. Press any key to close.
pause >nul
endlocal
