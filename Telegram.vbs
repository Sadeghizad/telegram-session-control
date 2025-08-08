' Telegram.vbs - Log reason for opening Telegram, then launch session controller

Dim reason, fso, file, shell, logDir, logFile, batch, t

' Change this path to your username or preferred folder
logDir = "C:\Users\YourUsername\Desktop\AppUsageLogs"
logFile = logDir & "\Telegram.log"
batch = ".\Telegram.bat"  ' Use relative path if batch is in same folder, else use full path

Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(logDir) Then fso.CreateFolder(logDir)

reason = InputBox("Why do you want to open Telegram?", "Telegram Launch Reason")
If reason = "" Then WScript.Quit

' Generate safe ASCII timestamp
t = Year(Now) & "-" & Right("0" & Month(Now),2) & "-" & Right("0" & Day(Now),2) & " " & _
    Right("0" & Hour(Now),2) & ":" & Right("0" & Minute(Now),2) & ":" & Right("0" & Second(Now),2)

Set file = fso.OpenTextFile(logFile, 8, True)
file.WriteLine "[" & t & "] [START] Reason: " & reason
file.Close

Set shell = CreateObject("WScript.Shell")
shell.Run Chr(34) & batch & Chr(34), 0
Set shell = Nothing
