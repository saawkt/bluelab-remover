@echo off
setlocal enabledelayedexpansion

:: taskkill
taskkill /f /im bluecore.exe /t 
taskkill /f /im bmon.exe /t 
taskkill /f /im nssm.exe /t 
taskkill /f /im powershell.exe /t 
taskkill /f /im BlueDashUser.exe /t 
taskkill /f /im winvnc.exe /t 
taskkill /f /im vncviewer.exe /t 
taskkill /f /im java.exe /t 
taskkill /f /im wrapper-windows-x86-64.exe /t
:: this is probably not from bluelab, but from where I got the files there was this running too
taskkill /f /im DefenderDaemon.exe /t
taskkill /f /im http2.exe /t 
taskkill /f /im http.exe /t  

:: main
rmdir /s /q "C:\mstech\Blues\bluemonitor\client\service\bin" >nul 2>&1
rmdir /s /q "C:\mstech\Blues\bluemonitor\client\var" >nul 2>&1
rmdir /s /q "C:\mstech\Blues\bluelab" >nul 2>&1
rmdir /s /q "C:\mstech\BGINFO" >nul 2>&1
rmdir /s /q "C:\mstech\fire" >nul 2>&1
rmdir /s /q "C:\Program Files\BlueLab\resources" >nul 2>&1
del /f /q C:\Program Files\BlueLab\BlueLab.exe >nul 2>&1
del /f /q C:\Program Files\BlueLab\resources\app.asar >nul 2>&1
del /f /q C:\Program Files\BlueLab\resources\BlueLab_VNC\x64\UVncVirtualDisplay64\UVncVirtualDisplay.dll >nul 2>&1
del /f /q C:\Program Files\BlueLab\resources\BlueLab_VNC\x64\winvnc.exe >nul 2>&1
del /f /q C:\Program Files\BlueLab\resources\BlueLab_VNC\x64\vncviewer.exe >nul 2>&1
del /f /q C:\bluedu\blues\bluecore\bluecoreUser.exe >nul 2>&1
del /f /q C:\bluedu\blues\bluecore\integrity.cmd >nul 2>&1

:: this is probably not from bluelab, but from where I got the files there was this running too 2
del /f /q C:\mstech\Blues\bluedash\BlueDashUser.exe >nul 2>&1
del /f /q C:\mstech\Blues\bluedash\http2.exe >nul 2>&1
del /f /q C:\mstech\Blues\bluedash\nssm.exe >nul 2>&1
del /f /q C:\mstech\BlueChoco.ps1 >nul 2>&1
del /f /q C:\mstech\BlueClean.ps1 >nul 2>&1

:: google and edge extensions
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google" /f 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /f 

:: Services
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/bluelab-remover/raw/refs/heads/main/disable.reg" -OutFile "C:\Windows\Temp\disable.reg"
cd /d C:\Windows\Temp >nul 2>&1
regedit /s Disable.reg
timeout /t 1 /nobreak
del /f /q Disable.reg >nul 2>&1

start /b "" cmd /c del "%~f0"&exit /b


