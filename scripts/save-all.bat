@echo off
REM =============================================================================
REM save-all.bat — Commit all client data to Git
REM =============================================================================
REM Usage: scripts\save-all.bat [commit-message]
REM Example: scripts\save-all.bat "Daily operations complete for acme-corp"
REM
REM If no commit message is provided, a default timestamped message is used.
REM =============================================================================

setlocal enabledelayedexpansion

REM --- Set commit message ---
if "%~1"=="" (
    for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set "TODAY=%%c-%%a-%%b"
    for /f "tokens=1-2 delims=: " %%a in ('time /t') do set "NOW=%%a:%%b"
    set "COMMIT_MSG=Auto-save: !TODAY! !NOW!"
) else (
    set "COMMIT_MSG=%~1"
)

echo =============================================
echo   Saving all client data to Git
echo =============================================
echo.

REM --- Stage all changes ---
echo [1/3] Staging changes...
git add -A
echo   + All changes staged

REM --- Show status ---
echo [2/3] Changes to commit:
git status --short
echo.

REM --- Commit ---
echo [3/3] Committing...
git commit -m "%COMMIT_MSG%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo =============================================
    echo   Changes committed successfully!
    echo =============================================
    echo   Message: %COMMIT_MSG%
) else (
    echo.
    echo   No changes to commit (working tree clean)
)

endlocal
