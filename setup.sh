#!/bin/bash

# Audio Transcription App Setup Script

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3.8 or later."
    exit 1
fi

# Check Python version
python_version=$(python3 --version 2>&1 | awk '{print $2}')
python_major=$(echo $python_version | cut -d. -f1)
python_minor=$(echo $python_version | cut -d. -f2)

if [ "$python_major" -lt 3 ] || ([ "$python_major" -eq 3 ] && [ "$python_minor" -lt 8 ]); then
    echo "Python 3.8 or later is required. You have Python $python_version."
    exit 1
fi

if [ "$python_major" -eq 3 ] && [ "$python_minor" -ge 14 ]; then
    echo "Warning: This app has been tested with Python up to 3.13. You have Python $python_version."
    echo "Some packages may not work correctly with your Python version."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg is not installed, which is required for audio processing."
    echo "Please install FFmpeg before continuing:"
    echo "  macOS:   brew install ffmpeg"
    echo "  Ubuntu:  sudo apt update && sudo apt install ffmpeg"
    echo "  Windows: Download from https://ffmpeg.org/download.html"
    exit 1
fi

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate || (echo "Failed to activate virtual environment"; exit 1)

# Install requirements
echo "Installing required packages..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Setup complete! You can now run the app with: streamlit run app.py"
echo "Remember to activate the virtual environment before running the app:"
echo "  source venv/bin/activate  # On macOS/Linux"
echo "  venv\\Scripts\\activate    # On Windows" 