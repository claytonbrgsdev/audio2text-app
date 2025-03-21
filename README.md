# Audio Transcription App

A Streamlit-based web application that transcribes audio files using OpenAI's Whisper. The app supports various audio formats and handles large files by automatically segmenting them into smaller chunks. It also features speaker diarization capabilities using pyannote.audio.

![App Screenshot](https://github.com/claytonbrgsdev/audio2text-app/raw/master/docs/images/app-screenshot.png)

## Features

- 🎙️ Transcribe audio files using OpenAI's Whisper
- 👥 Speaker diarization with pyannote.audio 3.1
- 📊 Clean, responsive web interface built with Streamlit
- 🔄 Automatic handling of large audio files through segmentation
- 📝 Export transcriptions as PDF or DOCX
- 🎛️ Support for various audio formats (MP3, WAV, FLAC, M4A, etc.)
- ⚙️ Configurable model selection based on accuracy needs and available hardware
- 🌐 Multilingual interface (English and Portuguese)

## Prerequisites

- Python 3.8 or later (tested up to Python 3.13)
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

### Method 1: Using setup scripts (Recommended)

#### For macOS/Linux:
```bash
./setup.sh
```

#### For Windows:
```bash
setup.bat
```

### Method 2: Manual installation

1. Clone this repository:
   ```bash
   git clone https://github.com/claytonbrgsdev/audio2text-app.git
   cd audio2text-app
   ```

2. Create and activate a virtual environment:
   ```bash
   python -m venv venv
   # On macOS/Linux
   source venv/bin/activate
   # On Windows
   venv\Scripts\activate
   ```

3. Install the required Python packages:
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

## Usage

1. Activate the virtual environment (if not already activated):
   ```bash
   # On macOS/Linux
   source venv/bin/activate
   # On Windows
   venv\Scripts\activate
   ```

2. Run the Streamlit app:
   ```bash
   streamlit run app.py
   ```

3. Open your browser and navigate to http://localhost:8501

4. Upload your audio file through the web interface

5. Select the Whisper model and configure any additional settings

6. Toggle speaker diarization if needed (requires HuggingFace access to pyannote/speaker-diarization-3.1)

7. Click "Transcribe Audio" to process the file

8. View the transcription results and download in your preferred format

## Speaker Diarization

To use the speaker diarization feature:

1. Create a HuggingFace account at [huggingface.co](https://huggingface.co)
2. Request access to the [pyannote/speaker-diarization-3.1](https://huggingface.co/pyannote/speaker-diarization-3.1) model
3. Install the HuggingFace CLI and login:
   ```bash
   pip install -U "huggingface_hub[cli]"
   huggingface-cli login
   ```

## Whisper Models

The app provides different Whisper models to choose from, depending on your accuracy needs and hardware capabilities:

- **Tiny**: Fastest, lowest accuracy (~1GB RAM)
- **Base**: Good balance of speed and accuracy for most use cases (~1GB RAM)
- **Small**: Better accuracy, requires more processing power (~2GB RAM)
- **Medium**: High accuracy, recommended with GPU (~5GB RAM/VRAM)
- **Large-v2**: Highest accuracy, requires GPU with sufficient memory (~10GB VRAM)

Models will be automatically filtered based on your hardware capabilities.

## Technical Details

- Uses FFmpeg for audio segmentation and processing
- Automatically handles files exceeding Whisper's input limitations
- Combines transcriptions from multiple segments into a coherent final transcript
- Provides export functionality in both PDF and DOCX formats
- Speaker diarization powered by pyannote.audio 3.1

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
