@echo off
Title 15 Seconds ADB Installer V1.0
mode con:cols=80 lines=25

:Splashscreen
color 97
cls
echo.�����������������������������������������������������������������������������ͻ
echo.�"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""�
echo.�"                                                                           "�
echo.�"                                                                           "�
echo.�"                                                                           "�
echo �"         ____  ____  _____  ____  ____  _____  ____  _____ ____  _         "�
echo �"        /  _ \/  _ \/__ __\/  _ \/ ___\/__ __\/  __\/  __//  _ \/ \__/|    "�
echo �"        | | \|| / \|  / \  | / \||    \  / \  |  \/||  \  | / \|| |\/||    "�
echo �"        | |_/|| |-||  | |  | |-||\___ |  | |  |    /|  /_ | |-||| |  ||    "�
echo �"        \____/\_/ \|  \_/  \_/ \|\____/  \_/  \_/\_\\____\\_/ \|\_/  \|    "�
echo �"                                                                           "�
echo.�"                                                                           "�
echo �"                   _     _  _      _  _____  _____ ____                    "�
echo �"                  / \   / \/ \__/|/ \/__ __\/  __//  _ \                   "�
echo �"                  | |   | || |\/||| |  / \  |  \  | | \|                   "�
echo �"                  | |_/\| || |  ||| |  | |  |  /_ | |_/|                   "�
echo �"                  \____/\_/\_/  \|\_/  \_/  \____\\____/                   "�
echo �"                                                                           "�
echo �"                                                                           "�
echo �"                                                                           "�
echo �"                                                                           "�
echo �"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""�
echo.�����������������������������������������������������������������������������ͼ
TIMEOUT /T 3 >nul

:SetRoot
set root=%cd%
del CurrentVersion.txt
cd %root%\Updater\bin
echo 1.0>>CurrentVersion.txt
echo 1.0.40>>CurrentVersion.txt
echo 11.0.0000.00000>>CurrentVersion.txt

:MainMenu
cd %root%
mode con:cols=80 lines=25
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                           15 Seconds ADB Installer                          �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                   Welcome to the 15 seconds ADB installer!                  �
echo.�                                                                             �
echo.� This tool is designed to install ADB, and fastboot automatically. Based off �
echo.� the orignial tool by Snoop05. What's different about this tool is it has a  �
echo.� very unique UI with clickable buttons, a built in updater that assures you  �
echo.� with the latest drivers and adb updates, and is completely open source!     �
echo.�                                                                             �
echo.� Adb/Fastboot Version: 1.0.40                                                �
echo.�                                                                             �
echo.� Google Drivers Version: 11.0.0000.00000                                     �
echo.�                                                                             �
echo.�                   What are we waiting for? Let's begin!                     �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 70 20 97 "Exit" 1 20 97 "XDA Forum" 35 20 97 "Next >" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL% EQU 1 exit
IF %ERRORLEVEL% EQU 2 GOTO XDA
IF %ERRORLEVEL% EQU 3 GOTO InstallADB

:XDA
start "" "www.BLANK.com"
GOTO MainMenu

:InstallADB
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                           15 Seconds ADB Installer                          �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                                                                             �
echo.�                         Install ADB system-wide?                            �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�    If you would like to install ADB for all users, choose yes.              �
echo.�                                                                             �
echo.�    If you would like to install ADB for you only, choose no.                �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 72 20 97 "No" 1 20 97 "Yes" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL%==2 GOTO AddSytemWide
IF %ERRORLEVEL%==1 GOTO AddUserOnly

:AddSytemWide
cd %SYSTEMDRIVE%
if exist adb rd /s /q adb
MKDIR adb
cd %root%\adb
XCOPY /q /c /i "%root%\adb\*.*" "%SYSTEMDRIVE%\adb" >Nul
TIMEOUT /T 1 >nul
SETX PATH "%PATH%;%SYSTEMDRIVE%\adb" /m
set ADB=System-Wide.
GOTO InstallDrivers

:AddUserOnly
cd %SYSTEMDRIVE%\Users\%USERNAME%\
if exist adb rd /s /q adb
mkdir adb
XCOPY /q /c /i "%root%\adb\*.*" "%SYSTEMDRIVE%\Users\%USERNAME%\adb" >Nul
TIMEOUT /T 1 >nul
SETX PATH "%PATH%;%SYSTEMDRIVE%\Users\%USERNAME%\adb" /m
set ADB=User Only.
GOTO InstallDrivers


:InstallDrivers
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                           15 Seconds ADB Installer                          �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                                                                             �
echo.�                          Install Google Drivers?                            �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�    If you do not install Google Drivers you will have to download the       �
echo.�                                                                             �
echo.�    drivers for your device from the device's manufature website. It is      �
echo.�                                                                             �
echo.�    recommended that you install Google Drivers for your device.             �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 72 20 97 "No" 1 20 97 "Yes" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL% EQU 1 GOTO NoDrivers
IF %ERRORLEVEL% EQU 2 GOTO GetOSType

:GetOSType
IF EXIST "C:\Program Files (x86)" (
GOTO Install64
) ELSE (
GOTO Install32
)

:Install32
cd %root%\driver
start /wait "" "DPInst_x86.exe"
set GoogleDrivers=Installed (x32)
GOTO Done

:Install64
cd %root%\driver
start /wait "" "DPInst_x64.exe"
set GoogleDrivers=Installed (x64)
GOTO Done

:NoDrivers
set GoogleDrivers=Not Installed.
GOTO Done

:Done
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                           15 Seconds ADB Installer                          �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                                                                             �
echo.�                        Here is what we accomplished:                        �
echo.�                                                                             �
echo.�                  ����������������������������������������ͻ                 �
echo.�                  �                                        �                 �
echo.�                  �  ADB/Fastboot:                         �                 �
echo.�                  �                                        �                 �
echo.�                  ����������������������������������������ͼ                 �
echo.�                  ����������������������������������������ͻ                 �
echo.�                  �                                        �                 �
echo.�                  �  Google Drivers:                       �                 �
echo.�                  �                                        �                 �
echo.�                  ����������������������������������������ͼ                 �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 39 15 97 "%GoogleDrivers%" 40 10 97 "%ADB%" 70 20 97 "Done" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL% EQU 1 GOTO InstallDrivers
IF %ERRORLEVEL% EQU 2 GOTO InstallADB
IF %ERRORLEVEL% EQU 3 exit
