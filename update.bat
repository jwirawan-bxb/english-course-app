@echo off
cd /d "%~dp0"
git add -A
git commit -m "update via Claude"
git push
echo.
echo Done! Press any key to close.
pause >nul
