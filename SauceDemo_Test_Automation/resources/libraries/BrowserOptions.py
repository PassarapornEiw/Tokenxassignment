from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service


class BrowserOptions:
    """Custom library for configuring browser options"""
    
    def get_chrome_options_with_disabled_popups(self):
        """Returns Chrome options with password manager and popups disabled"""
        options = Options()
        
        # Disable password manager and leak detection
        options.add_experimental_option("prefs", {
            "credentials_enable_service": False,
            "profile.password_manager_enabled": False,
            "profile.default_content_setting_values.notifications": 2,
            # Disable password leak detection to prevent Chrome security dialogs
            "profile.password_manager_leak_detection": False,
            "password_manager_leak_detection": False
        })
        
        # Disable save password prompts and browser features
        options.add_argument("--disable-blink-features=AutomationControlled")
        options.add_argument("--disable-extensions")
        options.add_argument("--disable-popup-blocking")
        options.add_argument("--disable-infobars")
        options.add_argument("--disable-save-password-bubble")
        
        return options

