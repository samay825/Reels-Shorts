<div align="center">

# 🤖 Instagram Telegram Bot

<img src="https://i.imgur.com/YourBotImage.png" alt="Instagram Telegram Bot" width="200" height="200" style="border-radius: 50%;">

[![Python](https://img.shields.io/badge/Python-3.13.3+-blue.svg)](https://www.python.org/downloads/)
[![Telegram Bot API](https://img.shields.io/badge/Telegram%20Bot%20API-4.15.4-blue.svg)](https://core.telegram.org/bots/api)
[![License](https://img.shields.io/badge/License-Educational-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)](README.md)

**A powerful Telegram bot that allows users to download content from Instagram and YouTube platforms with ease.**

*This bot provides a user-friendly interface with inline keyboards and supports various content types including reels, posts, stories, profile photos, and YouTube videos/audio.*

---

</div>

## ✨ Features

### 📷 Instagram Downloader
- **🎞️ Reels**: Download Instagram reels in high quality
- **📸 Posts**: Download Instagram posts (single/multiple images)
- **📖 Stories**: Download Instagram stories
- **👤 Profile Photos**: Download profile pictures in full resolution
- **📊 Analytics**: Get detailed profile analytics and download statistics

### 🎥 YouTube Downloader
- **🔗 Video Links**: Generate download links for YouTube videos
- **📹 Video Files**: Download YouTube videos and shorts directly (up to 50MB)
- **🎵 Audio Only**: Extract and download audio from YouTube videos
- **📊 Analytics**: Track download statistics

### 🔧 Additional Features
- **📊 Real-time Statistics**: Track usage and download counts
- **🔗 URL Shortening**: Automatic URL shortening and masking
- **⚡ Background Mode**: Run bot 24/7 in background
- **🛡️ Error Handling**: Robust error handling and user feedback
- **📱 Responsive UI**: Clean inline keyboard interface

## 🚀 Installation

### Prerequisites
- Python 3.13.3 or higher
- Windows OS (for batch file management)
- Telegram Bot Token (from [@BotFather](https://t.me/BotFather))

### Quick Setup

1. **Clone or Download** the project to your local machine

2. **Navigate** to the project directory:
  

3. **Run the Bot Manager**:
   ```batch
   Reels-Shorts.bat
   ```

4. **Configure Bot Token**:
   - Select option `[4] Configure Bot Token`
   - Enter your Telegram Bot Token from @BotFather
   - The token will be automatically saved to `telegram_config.json`

5. **Start the Bot**:
   - Select option `[1] Start Bot 24/7 (Background Mode)`
   - The bot will automatically install dependencies and start running

### Manual Installation

If you prefer manual setup:

1. **Install Python Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Configure Bot Token**:
   Create `telegram_config.json` with your bot token:
   ```json
   {"token": "YOUR_BOT_TOKEN_HERE"}
   ```

3. **Run the Bot**:
   ```bash
   double click on bat file 
   ```

## 📋 Dependencies

The bot uses the following Python packages:

```
pyTelegramBotAPI==4.15.4    # Telegram Bot API
requests==2.31.0            # HTTP requests
pytube==15.0.0              # YouTube downloader
instaloader==4.10.2         # Instagram content loader
instagrapi>=2.1.0           # Instagram API
yt-dlp>=2023.12.30          # YouTube/media downloader
httpx>=0.25.0               # Async HTTP client
pyshorteners>=1.0.1         # URL shortening
```

## 🎮 Usage

### Getting Started
1. Start a conversation with your bot on Telegram
2. Send `/start` to see the main menu


### Supported Link Formats

**Instagram:**
- `https://www.instagram.com/p/xxx/` (Posts)
- `https://www.instagram.com/reel/xxx/` (Reels)
- `https://www.instagram.com/stories/username/xxx/` (Stories)
- `@username` or `https://www.instagram.com/username/` (Profile)

**YouTube:**
- `https://youtube.com/watch?v=xxx`
- `https://youtu.be/xxx`
- `https://m.youtube.com/watch?v=xxx`

## 🛠️ Bot Management

The project includes a comprehensive bot management system:

### Bot Manager (`Reels-Shorts.bat`)
- **Start Bot**: Launch bot in background mode
- **Stop Bot**: Safely stop the running bot
- **Check Status**: View current bot status
- **Configure Token**: Set up or update bot token
- **Exit**: Close the manager

### Background Scripts
- `start_bot_background.bat`: Start bot in background mode
- `stop_bot.bat`: Stop the running bot
- `check_bot.bat`: Check if bot is running

## 📁 Project Structure

```
📦 Instagram Telegram Bot
├── 📄 main.py                          # Main bot application
├── 📄 requirements.txt                 # Python dependencies
├── 📄 telegram_config.json             # Bot token configuration
├── 📄 bot_manager.bat                  # Bot management interface
├── 📂 bot_scripts/                     # Bot management scripts
│   ├── 📄 start_bot_background.bat
│   ├── 📄 stop_bot.bat
│   └── 📄 check_bot.bat
├── 📂 configuration/                   # Bot modules
│   ├── 📄 __init__.py                  # Configuration loader
│   ├── 📄 stats.py                     # Statistics management
│   ├── 📄 instagram_reel.py            # Instagram reels handler
│   ├── 📄 instagram_post.py            # Instagram posts handler
│   ├── 📄 instagram_stories.py         # Instagram stories handler
│   ├── 📄 instagram_profile_photo.py   # Profile photo handler
│   ├── 📄 instagram_profile_analytics.py # Profile analytics
│   ├── 📄 instagram_caption.py         # Caption extraction
│   ├── 📄 youtube_video.py             # YouTube video handler
│   ├── 📄 youtube_music.py             # YouTube audio handler
│   ├── 📄 session_id.json              # Session management
│   └── 📄 stats.json                   # Usage statistics
└── 📄 README.md                        # This file
```

## ⚙️ Configuration

### Environment Setup
The bot automatically handles most configuration, but you can customize:

1. **API Settings**: Edit `configuration/__init__.py` for API endpoints
2. **Download Paths**: Modify download directories in respective modules
3. **Rate Limits**: Adjust request delays in configuration files
4. **Statistics**: Configure tracking in `configuration/stats.py`

### Session Management
- Instagram sessions are managed automatically
- Session data is stored in `configuration/session_id.json`
- Sessions are refreshed as needed to maintain functionality

## 🔧 Troubleshooting

### Common Issues

**Bot Token Error:**
- Ensure your token is correctly configured in `telegram_config.json`
- Verify the token is active and valid from @BotFather

**Download Failures:**
- Check if the content is public and accessible
- Verify the URL format is correct
- Some private content may not be downloadable

**Python Not Found:**
- Ensure Python 3.13.3+ is installed and added to PATH
- Try running `python --version` in command prompt

**Dependencies Issues:**
- Run `pip install -r requirements.txt` manually
- Check for any error messages during installation

### Performance Tips
- Run bot in background mode for 24/7 operation
- Monitor system resources for heavy usage
- Regular restart recommended for optimal performance



## 🛡️ Security & Privacy

- Bot tokens are stored locally and encrypted
- No user data is permanently stored
- Download links are automatically shortened and masked
- Session data is managed securely



## 📝 License

This project is for educational purposes. Please respect platform terms of service and copyright laws when using this bot.

## 📞 Support

For issues or questions:
- Check the troubleshooting section
- Review error messages carefully
- Ensure all dependencies are properly installed
- Verify bot token configuration

---

**⚡ Quick Start**: Run `bot_manager.bat` → Configure Token → Start Bot → Enjoy! 🎉
