# StealthChrome
![stealth](https://github.com/user-attachments/assets/3c09bc61-aa3a-40f3-9644-6d6519001a7d)

## StealthChrome – Browse Freely, Stay Invisible. Take control of your privacy.
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
</details>

---

# How to Run


### Run the command below in PowerShell:
```ps1
iwr "https://raw.githubusercontent.com/ltx0101/StealthChrome/main/StealthChrome.ps1" -OutFile "StealthChrome.ps1"; .\StealthChrome.ps1
```

---

### Error "Running Scripts is Disabled on this System"
<details>
<summary> Click Here </summary>

### Run this command in PowerShell:

```ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
</details>

