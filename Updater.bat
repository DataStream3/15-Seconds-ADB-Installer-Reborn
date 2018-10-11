@echo off
REM Datastream 2018, All rights reserved.
REM 15 Seconds ADB Installer Updater V1.0
set root=%cd%

cd %root%
start /min "" "15 Seconds ADB Installer.bat"
TIMEOUT /T 2 >nul
taskkill /F /FI "WINDOWTITLE eq 15 Seconds ADB Installer V1.0" /T
cd %root%\Updater\bin
(
  Set /p InstallerCurrent=
  Set /p ADBCurrent=
  Set /p DriversCurrent=
) <CurrentVersion.txt
DEL CurrentVersion.txt
wget.exe -O UpdateVersion.txt --no-check-certificate "https://drive.google.com/uc?export=download&id=15E-3UmShGcHGB1CEtzpw_hdhdOgy6z6e"
(
  Set /p InstallerUpdate=
  Set /p ADBUpdate=
  Set /p DriversUpdate=
) <UpdateVersion.txt

if %InstallerUpdate% GTR %InstallerCurrent% GOTO UpdatesFound
if %ADBUpdate% GTR %ADBCurrent% GOTO UpdatesFound
if %DriversUpdate% GTR %DriversCurrent% GOTO UpdatesFound
GOTO NoUpdates

:UpdatesFound
cls
echo ________________________________________________________________________________________________________________________
echo.
echo Installer:
echo.
echo The Current Version of the installer is: %InstallerCurrent%, and the update version on the server is: %InstallerUpdate%.
echo.
echo ________________________________________________________________________________________________________________________
echo.
echo ADB/Fastboot:
echo.
echo The current version of ADB/Fastboot is: %ADBCurrent%, and the update found on the server is: %ADBUpdate%.
echo.
echo ________________________________________________________________________________________________________________________
echo.
echo Google Drivers:
echo.
echo The current version of Google Drivers is: %DriversCurrent%, and the update found on the server is: %DriversUpdate%.
echo.
echo ________________________________________________________________________________________________________________________
echo.
if %InstallerUpdate% GTR %InstallerCurrent% echo Installer will be updated from %InstallerCurrent% to %InstallerUpdate%.
echo.
if %ADBUpdate% GTR %ADBCurrent% echo ADB will be updated from %ADBCurrent% to %ADBUpdate%.
echo.
if %DriversUpdate% GTR %DriversCurrent% echo Drivers will be updated from %DriversCurrent% to %DriversUpdate%.
echo.
echo Press "any" key to begin updating.
pause >nul

if %InstallerUpdate% GTR %InstallerCurrent% GOTO InstallUpdatetoInstaller
set Installer=No Update.
GOTO CheckADB

:InstallUpdatetoInstaller
set Installer=Version %InstallerUpdate% found.
wget.exe -O "15 Seconds ADB Installer.bat" --no-check-certificate "https://drive.google.com/uc?export=download&id=11X1LfZQPJtnqEWT7bUc2rOi1Qswg4MC_"
MOVE "15 Seconds ADB Installer.bat" "%root%"
GOTO CheckADB

:CheckADB
if %ADBUpdate% GTR %ADBCurrent% GOTO InstallUpdatetoADB
set ADB=No Update.
GOTO CheckDrivers


:InstallUpdatetoADB
set ADB=Version %ADBUpdate% found.
wget.exe -O "ADBUpdate.exe" --no-check-certificate "https://drive.google.com/uc?export=download&id=1YLJd8GTH2Y2dL08CWG0WVP9edRJ6Hnue"
start /wait "" "ADBUpdate.exe"
DEL ADBUpdate.exe
GOTO CheckDrivers


:CheckDrivers
if %DriversUpdate% GTR %DriversCurrent% GOTO InstallUpdatetoDrivers
set Drivers=No Update.
GOTO Cleanup

:InstallUpdatetoDrivers
set Drivers=Version %DriversUpdate% found.
wget.exe -O "DriversUpdate.exe" --no-check-certificate "https://drive.google.com/uc?export=download&id=14tzTesX7why643dcKH-7SEymwWlwaitc"
start /wait "" "DriversUpdate.exe"
DEL DriversUpdate.exe
GOTO Cleanup

:Cleanup
cls
echo.
echo Updates finished.
TIMEOUT /T 2 >nul
echo.
echo Starting the 15 Seconds ADB Installer...
del CurrentVersion.txt >nul
TIMEOUT /T 2 >nul
cd %root%
start "" "15 Seconds ADB Installer.bat"
exit


:NoUpdates
cls
echo. 
echo It appears there are no available updates at the moment.
echo.
echo Which means you have the latest drivers, installer, and ADB/fastboot installed. AWESOME!
echo.
echo Press "any" key to start the 15 Seconds ADB Installer.
pause >nul
del CurrentVersion.txt >nul
cd %root%
start "" "15 Seconds ADB Installer.bat"
exit
