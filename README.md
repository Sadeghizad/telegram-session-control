# Telegram Session Control & Usage Logger

A complete, privacy-friendly system for **tracking, justifying, and time-limiting your Telegram Desktop usage** on Windows. Designed for productivity, mindfulness, and digital wellness.

---

## 🚩 Overview

Launching Telegram via this tool prompts you for a reason, logs your intention, then gives you exactly 3 minutes of usage with clear warnings before auto-closing the app. This workflow encourages conscious technology use and helps curb habitual scrolling.

- **All interaction is via popups—no console windows left open**
- **Only the data you enter and session times are stored**
- **Robust for all Windows setups (English/non-English, standard/Persian calendars, portable or installed apps)**

---

## ✨ Features

- **Reason Prompt:** You must supply a purpose before Telegram launches.
- **Session Logging:** Each usage is logged with time, date, and your own reason.
- **Time-Limited Session:** Telegram closes automatically after 3 minutes (with pop-up warnings at 2 and 2.5 minutes).
- **No lingering terminals:** `.vbs` launches the batch file hidden.
- **Portable and customizable:** Easy to adapt to any path or app.

---

## 📂 Files

- `Telegram.vbs` — VBScript for the popup reason prompt and logging. Starts the batch in the background.
- `Telegram.bat` — Batch script to launch Telegram, manage timing, give warnings, auto-close, and log session end.

---

## 🚀 How to Use

1. **Place both files in your Telegram folder (or anywhere you want).**
2. **Edit the paths** in both scripts for your username or preferred log location.
3. **Double-click `Telegram.vbs` to start.**
   - Popup asks for a reason.
   - Telegram opens.
   - Popups warn you before auto-close.
   - All activity is logged.
4. **Check your log file** (`AppUsageLogs\Telegram.log`) to review your session history.

---

## ⚙️ Configuration

### Telegram.vbs

Edit these lines if needed:
```vbscript
logDir = "C:\Users\YourUsername\Desktop\AppUsageLogs"
logFile = logDir & "\Telegram.log"
batch = ".\Telegram.bat"  ' Or a full path if not in the same folder
```
- Change `YourUsername` as appropriate.
- `batch` can be relative or full path.

### Telegram.bat

Edit these lines as needed:
```bat
set "logDir=C:\Users\YourUsername\Desktop\AppUsageLogs"
set "logFile=%logDir%\Telegram.log"
set "appName=Telegram.exe"           :: Actual exe name as shown in Task Manager > Details
set "processName=Telegram.exe"       :: Same as above
set "duration=180"                   :: 3 minutes (in seconds)
```
- If Telegram’s exe is called something else (e.g., `TelegramDesktop.exe`), use that.

---

## 🧪 Example Log Output

```
[2025-08-08 22:10:41] [START] Reason: Plan tomorrow’s study group
[2025-08-08 22:13:41] [END] Telegram closed after 180 seconds.
```

---

## 📝 Key Errors & Solutions (from real troubleshooting)

**1. “Invalid procedure call or argument” (Line 13, VBScript):**  
- **Cause:** Direct use of `Now` for timestamps fails with some non-English locales.
- **Fix:** Manually build an ASCII-only timestamp:
    ```vbscript
    t = Year(Now) & "-" & Right("0" & Month(Now),2) & "-" & Right("0" & Day(Now),2) & " " & _
        Right("0" & Hour(Now),2) & ":" & Right("0" & Minute(Now),2) & ":" & Right("0" & Second(Now),2)
    ```

**2. App not closing after timeout:**  
- **Cause:** Batch script had wrong process name.
- **Fix:** Use the *exact* process name as in Task Manager > Details (`Telegram.exe` or `TelegramDesktop.exe`).

**3. CMD window stays open:**  
- **Cause:** User ran `.bat` directly.
- **Fix:** Always run `.vbs`, which hides the batch window.

**4. Log file not written:**  
- **Cause:** Log folder missing or permission issue.
- **Fix:** Script now ensures folder exists before logging; use Desktop or `C:\Temp` for reliability.

---

## 🛡️ Privacy & Security

- **Only your reason and session times are stored.**
- **No internet access, no account data, and no telemetry.**
- **Logs are plaintext and easily reviewed or deleted by you.**

---

## 🧩 Customization

- **Change session duration:** Edit `duration` in the batch script.
- **Use with other apps:** Change `appName` and `processName` to your desired executable.
- **Log more details:** You can expand the logging format with user info or context as needed.

---

## 🆘 Troubleshooting

- **Still can’t close the app?** Try running the batch file as Administrator. Double-check the process name.
- **Popups don’t show?** Some security software blocks popups; try whitelisting scripts.
- **Test with Notepad:** Set `appName=notepad.exe` and `processName=notepad.exe` to debug.
- **Log error?** Set `logDir` to a simple folder (`C:\Temp`) to avoid permission issues.

---

## 🧠 Limitations

- **Must use the right process name for your app**
- **Requires permission to write to log directory**
- **Won’t work if VBS or PowerShell popups are blocked**

---

## 🔄 Version and Improvements

- **Current version:** August 2025 (v1.0, stable)
- **Ideas for improvement:**  
  - Allow more/fewer popups  
  - Add “extend session” prompt  
  - Accept app name as input  
  - Rewrite in PowerShell or Python

---

## 🙏 Acknowledgments

Special thanks to everyone who helped troubleshoot, especially for testing with different locales and calendar settings.  
Project created by Kian and ChatGPT after real-world error reports and fixes.

---

**Keep your digital habits mindful and intentional!**
