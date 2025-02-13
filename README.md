# Stealth Chrome
<img src="https://github.com/user-attachments/assets/35794d47-f1ab-43d1-a27d-874a05b01906" width="220" height="220">


## Stealth Chrome – Take control of your privacy.
This PowerShell script provides an easy-to-use GUI for modifying Google Chrome policies via Windows Registry to enhance Chrome’s functionality.

### Features  
<details>  
<summary> Click Here </summary>

- **Enable Hardware Acceleration**  
   Uses GPU acceleration to improve performance.

- **Disable Network Prediction**  
   Prevents Chrome from preloading pages and DNS queries to save bandwidth and enhance privacy.

- **Disable Tab Freezing**  
   Prevents inactive tabs from being automatically suspended to save memory.

- **Disable Memory Saver Mode**  
   Keeps all tabs active instead of reducing memory usage by suspending unused ones.

- **Disable Chrome Cleanup Tool**  
   Disables Chrome’s built-in tool for scanning and removing harmful software.

- **Disable Safe Browsing**  
   Turns off Google’s phishing and malware protection.

- **Disable Content Suggestions on New Tab Page**  
   Stops Chrome from showing recommended articles.

- **Disable Metrics and Data Collection**  
   Prevents Chrome from sending anonymized data and usage statistics to Google.

- **Disable Password Leak Detection**  
   Stops Chrome from alerting you about compromised passwords.

- **Disable Cloud Reporting**  
   Prevents device event reports from being sent to Google.

- **Disable Third-Party Cookies**  
   Blocks websites from using third-party cookies for tracking.

- **Enable Do Not Track**  
   Sends a request to websites asking them not to track your browsing.

- **Disable Device Activity and System Reporting**  
   Prevents Chrome from logging and reporting device information, such as network events, system status, app usage, and more.

- **Set DNS Over HTTPS Mode**  
   Ensures secure DNS queries for private browsing.

- **Disable Sync and Sign-in Features**  
   Turns off Chrome's sync feature and disables sign-in to prevent tracking of your browsing activity.

- **Disable Autofill and Password Manager**  
   Disables Chrome’s autofill and password manager features for enhanced privacy.

- **Disable Geolocation and Sensors**  
   Blocks websites from accessing your device's location and sensors (like accelerometer, gyroscope).

- **Disable Screen and Audio/Video Capture**  
   Prevents websites from capturing your screen, audio, or video.

- **Disable Translation and Spell Checking**  
   Turns off Chrome's translation service and spell check to prevent sending your data to Google.

- **Block WebSQL and Contextual Search**  
   Disables WebSQL database usage and contextual search to prevent tracking and unwanted data collection.

- **Prevent Browser Data Collection on Exit**  
   Ensures that Chrome doesn't collect browsing data on exit.

- **Enable Https-Only Mode**  
   Forces Chrome to load only secure HTTPS connections.

</details>

---

# 🚀 How to Run the Script

1. **Open PowerShell and paste the command below**  
```ps1
iwr "https://raw.githubusercontent.com/ltx0101/StealthChrome/main/StealthChrome.ps1" -OutFile "StealthChrome.ps1"; .\StealthChrome.ps1
```
2. **Configure Policies**  
   Once the script runs, you will see a graphical interface with options for configuring general Chrome policies and privacy settings.

3. **Apply Policies**  
   Select the desired policies and click on the "Apply Selected Policies" button. The script will automatically configure the Chrome policies in the registry.

4. **Reset to Default**  
   If you want to reset all policies to their default values, click on the "Reset to Default" button. This will remove the custom policies from the registry.

---

### ❗Error: "Running Scripts is Disabled on this System"❗ 
<details>  
<summary> Click Here </summary>

If you encounter the error **"Running Scripts is Disabled on this System"**, it means that PowerShell's execution policy is preventing scripts from running for security reasons.

To resolve this, follow these steps:

1. **Open PowerShell as Administrator**  
   
2. **Change the Execution Policy**  
   Run the following command in the PowerShell window to allow locally-created scripts to run:

   ```ps1
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
   ```
</details>

---

### Privacy and Security

This script is designed to enhance privacy and security by disabling certain tracking and data-collection features of Google Chrome. Use it to lock down Chrome's settings for a more private browsing experience. Be cautious when running this on a shared machine or environment, as it modifies system-wide registry keys.
