import json
import os

def load_config():
    """Load configuration from JSON file"""
    try:
        with open('telegram_config.json', 'r') as config_file:
            config = json.load(config_file)
        return config
    except Exception as e:
        print(f"Error loading configuration: {e}")
        return None

CONFIG = load_config()

# Export common settings
TOKEN = CONFIG.get('token') if CONFIG else None
API_BASE_URL = CONFIG.get('api_base_url', 'https://api.mediadownloader.example') if CONFIG else 'https://api.mediadownloader.example'
API_TOKEN = CONFIG.get('api_token', '') if CONFIG else '' 