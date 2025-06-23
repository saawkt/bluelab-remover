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

:: Services and Drivers
sc stop uvnc_service
sc stop KMDFHello
sc stop bluecore
sc stop R0bluecore
sc stop mstech-blueclient
sc stop mstech-client-update
sc stop mstech-client-v3
sc stop mstech-serial-binder

:: main
mkdir "%userprofile%\loser"
mkdir "%userprofile%\loser\loser2"
mkdir "%userprofile%\loser\reg"
move "C:\mstech\Blues\bluemonitor\client\service\bin" "%userprofile%\loser" >nul 2>&1
move "C:\mstech\Blues\bluemonitor\client\var" "%userprofile%\loser" >nul 2>&1
move "C:\mstech\Blues\bluelab" "%userprofile%\loser" >nul 2>&1
move "C:\mstech\BGINFO" "%userprofile%\loser" >nul 2>&1
move "C:\mstech\fire" "%userprofile%\loser" >nul 2>&1
move "C:\Program Files\BlueLab\resources" "%userprofile%\loser" >nul 2>&1
move "C:\Program Files\BlueLab\BlueLab.exe" "%userprofile%\loser" >nul 2>&1
move "C:\Program Files\BlueLab\resources\BlueLab_VNC\x64\UVncVirtualDisplay64\UVncVirtualDisplay.dll" "%userprofile%\loser" >nul 2>&1
move "C:\Program Files\BlueLab\resources\BlueLab_VNC\x64\winvnc.exe" "%userprofile%\loser" >nul 2>&1
move "C:\Program Files\BlueLab\resources\BlueLab_VNC\x64\vncviewer.exe" "%userprofile%\loser" >nul 2>&1
move "C:\bluedu\blues\bluecore\bluecoreUser.exe" "%userprofile%\loser" >nul 2>&1 
move "C:\bluedu\blues\bluecore\integrity.cmd" "%userprofile%\loser" >nul 2>&1
:: sc delete uvnc_service
:: del /f /q C:\Program Files\BlueLab\resources\app.asar >nul 2>&1

:: this is probably not from bluelab, but from where I got the files there was this running too 2
move "C:\mstech\Blues\bluedash\BlueDashUser.exe" "%userprofile%\loser\loser2" >nul 2>&1
move "C:\mstech\Blues\bluedash\http2.exe" "%userprofile%\loser\loser2" >nul 2>&1
move "C:\mstech\Blues\bluedash\nssm.exe" "%userprofile%\loser\loser2" >nul 2>&1
move "C:\mstech\BlueChoco.ps1" "%userprofile%\loser\loser2" >nul 2>&1
move "C:\mstech\BlueClean.ps1" "%userprofile%\loser\loser2" >nul 2>&1

:: reg saves
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google" "%userprofile%\loser\reg\glg.reg" /y 
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" "%userprofile%\loser\reg\edge.reg" /y 

start /b "" cmd /c del "%~f0"&exit /b


