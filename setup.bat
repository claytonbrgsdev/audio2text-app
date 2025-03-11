@echo off
SETLOCAL

REM Audio Transcription App Setup Script for Windows

REM Check if Python is installed
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed or not in PATH. Please install Python 3.8 or later.
    exit /b 1
)

REM Check Python version
FOR /F "tokens=2" %%I IN ('python --version 2^>^&1') DO SET PY_VERSION=%%I
FOR /F "tokens=1,2 delims=." %%A IN ("%PY_VERSION%") DO (
    SET PY_MAJOR=%%A
    SET PY_MINOR=%%B
)

IF %PY_MAJOR% LSS 3 (
    echo Python 3.8 or later is required. You have Python %PY_VERSION%.
    exit /b 1
)

IF %PY_MAJOR% EQU 3 (
    IF %PY_MINOR% LSS 8 (
        echo Python 3.8 or later is required. You have Python %PY_VERSION%.
        exit /b 1
    )
)

IF %PY_MAJOR% EQU 3 (
    IF %PY_MINOR% GEQ 14 (
        echo Warning: This app has been tested with Python up to 3.13. You have Python %PY_VERSION%.
        echo Some packages may not work correctly with your Python version.
        set /p CONTINUE="Continue anyway? (y/n): "
        if /i "%CONTINUE%" NEQ "y" exit /b 1
    )
)

REM Check if FFmpeg is installed
ffmpeg -version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo FFmpeg is not installed or not in PATH, which is required for audio processing.
    echo Please install FFmpeg before continuing:
    echo Download from https://ffmpeg.org/download.html and add it to your system PATH
    exit /b 1
)

REM Create virtual environment
echo Creating virtual environment...
python -m venv venv
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to create virtual environment.
    exit /b 1
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to activate virtual environment.
    exit /b 1
)

REM Install requirements
echo Installing required packages...
pip install --upgrade pip
pip install -r requirements.txt

echo.
echo Setup complete! You can now run the app with: streamlit run app.py
echo Remember to activate the virtual environment before running the app with:
echo   venv\Scripts\activate

ENDLOCAL 