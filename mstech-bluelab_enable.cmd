@echo off
setlocal enabledelayedexpansion
:: I take no responsibility for the use of this script or for any damage caused by it.

:: Services and Drivers
sc start uvnc_service
sc start KMDFHello
sc start bluecore
sc start R0bluecore
sc start mstech-blueclient
sc start mstech-client-update
sc start mstech-client-v3
sc start mstech-serial-binder

:: main
move "C:\loser\bin" "C:\mstech\Blues\bluemonitor\client\service" >nul 2>&1
move "C:\loser\var" "C:\mstech\Blues\bluemonitor\client" >nul 2>&1
move "C:\loser\bluelab" "C:\mstech\Blues" >nul 2>&1
move "C:\loser\BGINFO" "C:\mstech" >nul 2>&1
move "C:\loser\fire" "C:\mstech" >nul 2>&1
move "C:\loser\resources" "C:\Program Files\BlueLab" >nul 2>&1 
move "C:\loser\BlueLab.exe" "C:\Program Files\BlueLab" >nul 2>&1 
move "C:\loser\UVncVirtualDisplay64\UVncVirtualDisplay.dll" "C:\Program Files\BlueLab\resources\BlueLab_VNC\x64" >nul 2>&1
move "C:\loser\winvnc.exe" "C:\Program Files\BlueLab\resources\BlueLab_VNC\x64" >nul 2>&1
move "C:\loser\vncviewer.exe" "C:\Program Files\BlueLab\resources\BlueLab_VNC\x64" >nul 2>&1
move "C:\loser\bluecoreUser.exe" "C:\bluedu\blues\bluecore" >nul 2>&1
move "C:\loser\integrity.cmd" "C:\bluedu\blues\bluecore" >nul 2>&1

:: this is probably not from bluelab, but from where I got the files there was this running too 2
move "C:\loser\loser2\BlueDashUser.exe" "C:\mstech\Blues\bluedash" >nul 2>&1
move "C:\loser\loser2\http2.exe" "C:\mstech\Blues\bluedash" >nul 2>&1
move "C:\loser\loser2\nssm.exe" "C:\mstech\Blues\bluedash" >nul 2>&1
move "C:\loser\loser2\BlueChoco.ps1" "C:\mstech" >nul 2>&1
move "C:\loser\loser2\BlueClean.ps1" "C:\mstech" >nul 2>&1

:: reg import
reg import "C:\loser\reg\glg.reg" 
reg import "C:\loser\reg\edge.reg" 

:: clean
rmdir "C:\loser"
start /b "" cmd /c del "%~f0"&exit /b


