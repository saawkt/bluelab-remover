@echo off
:menu
::warning
echo I take no responsibility for the use of this script or for any damage caused by it.
echo.
echo [1] Enable BlueDash/Core/Monitor etc... (requires restart)
echo [2] Disable BlueDash/Core/Monitor etc...
echo [3] Delete BlueDash/Core/Monitor etc... (be careful when using this option in windows 11, I've seen cases where explorer may not start anymore)
echo.
set /p input=":"
if "%input%"=="1" (
    goto enable
) else if "%input%"=="2" (
    goto disable
) else if "%input%"=="3" (
    goto delete
) else (
    echo invalid choice. try again.
    pause
    goto menu
)

:enable
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/files/raw/refs/heads/main/PowerRun.exe" -OutFile "C:\Windows\Temp\powerrun.exe"
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/bluelab-remover/raw/refs/heads/main/mstech-bluelab_enable.cmd" -OutFile "C:\Windows\Temp\mstech-bluelab_enable.cmd"
cd /d C:\Windows\Temp >nul 2>&1 
powerrun.exe /SW:0 mstech-bluelab_enable.cmd
goto done


:disable
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/files/raw/refs/heads/main/PowerRun.exe" -OutFile "C:\Windows\Temp\powerrun.exe"
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/bluelab-remover/raw/refs/heads/main/mstech-bluelab_disable.cmd" -OutFile "C:\Windows\Temp\mstech-bluelab_disable.cmd"
cd /d C:\Windows\Temp >nul 2>&1 
powerrun.exe /SW:0 mstech-bluelab_disable.cmd
goto done

:delete
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/files/raw/refs/heads/main/PowerRun.exe" -OutFile "C:\Windows\Temp\powerrun.exe"
powershell Invoke-WebRequest -Uri "https://github.com/saawkt/bluelab-remover/raw/refs/heads/main/mstech-bluelab_remover.cmd" -OutFile "C:\Windows\Temp\mstech-bluelab_remover.cmd"
cd /d C:\Windows\Temp >nul 2>&1 
powerrun.exe /SW:0 mstech-bluelab_remover.cmd
goto done

:done
del /f /q powerrun.exe >nul 2>&1
start /b "" cmd /c del "%~f0"&exit /b
