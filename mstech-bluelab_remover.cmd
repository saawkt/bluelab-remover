@echo off
setlocal enabledelayedexpansion
:: I take no responsibility for the use of this script or for any damage caused by it.

:: taskkill
taskkill /f /im bluecore.exe /t 
taskkill /f /im bmon.exe /t 
taskkill /f /im nssm.exe /t 
taskkill /f /im powershell.exe /t 
taskkill /f /im BlueDashUser.exe /t 
taskkill /f /im winvnc.exe /t 
taskkill /f /im vncviewer.exe /t 
taskkill /f /im java.exe /t 
taskkill /f /im javaw.exe /t 
taskkill /f /im msagent.exe /t 
taskkill /f /im bgclient.exe /t 
taskkill /f /im wrapper-windows-x86-64.exe /t
taskkill /f /im vinculador.exe /t 
taskkill /f /im UnitBindWindow.exe /t 
:: google and edge (i added this to apply the removal of the extension) 
taskkill /f /im chrome.exe /t 
taskkill /f /im msedge.exe /t 
:: this is probably not from bluelab, but from where I got the files there was this running too
taskkill /f /im DefenderDaemon.exe /t
taskkill /f /im http2.exe /t 
taskkill /f /im http.exe /t  

:: main
rmdir /s /q "C:\mstech" >nul 2>&1
rmdir /s /q "C:\Program Files\BlueLab" >nul 2>&1
rmdir /s /q "C:\bluedu" >nul 2>&1

:: google and edge extensions
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google" /f 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /f 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\BLUEDU"

:: Services
sc stop KMDFHello
sc stop bluecore
sc stop R0bluecore
sc stop mstech-blueclient
sc stop mstech-client-update
sc stop mstech-client-v3
sc stop mstech-serial-binder
sc delete KMDFHello
sc delete bluecore
sc delete R0bluecore
sc delete mstech-blueclient
sc delete mstech-client-update
sc delete mstech-client-v3
sc delete mstech-serial-binder

powershell Invoke-WebRequest -Uri "https://github.com/saawkt/bluelab-remover/raw/refs/heads/main/disable.reg" -OutFile "C:\Windows\Temp\disable.reg"
cd /d C:\Windows\Temp >nul 2>&1
reg import "C:\Windows\Temp\Disable.reg"
timeout /t 1 /nobreak
del /f /q Disable.reg >nul 2>&1
start /b "" cmd /c del "%~f0"&exit /b