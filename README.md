# Audio Transcription App

A Streamlit-based web application that transcribes audio files using OpenAI's Whisper. The app supports various audio formats and handles large files by automatically segmenting them into smaller chunks.

## Features

- 🎙️ Transcribe audio files using OpenAI's Whisper
- 📊 Clean, responsive web interface built with Streamlit
- 🔄 Automatic handling of large audio files through segmentation
- 📝 Export transcriptions as PDF or DOCX
- 🎛️ Support for various audio formats (MP3, WAV, FLAC, M4A, etc.)
- ⚙️ Configurable model selection based on accuracy needs and available hardware

## Prerequisites

- Python 3.8 or later
- FFmpeg installed on your system

### Installing FFmpeg

- **macOS** (using Homebrew):
  ```
  brew install ffmpeg
  ```

- **Windows**:
  1. Download from [FFmpeg official website](https://ffmpeg.org/download.html)
  2. Add FFmpeg to your system PATH

- **Linux**:
  ```
  sudo apt update && sudo apt install ffmpeg
  ```

## Installation

1. Clone this repository or download the files
2. Install the required Python packages:

```bash
pip install -r requirements.txt
```

## Usage

1. Run the Streamlit app:

```bash
streamlit run app.py
```

2. Upload your audio file through the web interface
3. Select the Whisper model and configure any additional settings
4. Click "Transcribe Audio" to process the file
5. View the transcription results and download in your preferred format

## Whisper Models

The app provides different Whisper models to choose from, depending on your accuracy needs and hardware capabilities:

- **Tiny**: Fastest, lowest accuracy
- **Base**: Good balance of speed and accuracy for most use cases
- **Small**: Better accuracy, requires more processing power
- **Medium**: High accuracy, recommended with GPU
- **Large**: Highest accuracy, requires GPU with sufficient memory

Models will be automatically filtered based on your hardware capabilities.

## Technical Details

- Uses PyDub and FFmpeg for audio segmentation and processing
- Automatically handles files exceeding Whisper's input limitations
- Combines transcriptions from multiple segments into a coherent final transcript
- Provides export functionality in both PDF and DOCX formats

## License

This project is licensed under the MIT License.
