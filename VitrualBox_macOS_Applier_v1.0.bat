@echo off
color 0f
title VitrualBox macOS Applier (v 1.0)

:MAIN
cls
echo ========== [ VitrualBox macOS Applier (v 1.0) ] ==========
echo Input 0 to quit or input any number to start.
set /p input=input: 
if %input% == 0 exit

echo.
echo === [ Input your Vitrual Machine's Name ] ===
set /p name=input: 
echo %name% is selected.
timeout 2

:SUB_MAIN
cls
cd "C:\Program Files\Oracle\VirtualBox"
title VitrualBox macOS Applier (v 1.0) - %name%
echo ========== [ VitrualBox macOS Applier (v 1.0) ] ==========
echo.
echo === [ Select Action (%name%) ] ===
echo 1. Add ExtraData to Vitrual Machine for using macOS on VitrualBox.
echo 2. Change Vitrual Machine's Resolution.
echo 3. Go Back
echo 0. Quit
set /p input=input: 
if %input% == 0 exit
if %input% == 1 goto :SET_EXTRA
if %input% == 2 goto :SET_DISPLAY
if %input% == 3 goto :MAIN
goto :SUB_MAIN

:SET_EXTRA
echo === [ Adding ExtraData to (%name%) ] ===
VBoxManage.exe modifyvm "%name%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
echo ExtraData is added to %name%.
timeout 3
goto :SUB_MAIN

:SET_DISPLAY
echo === [ Setting Resolution (%name%) ] ===
set /p width="input width: "
set /p height="input height: "
VBoxManage setextradata "%name%" VBoxInternal2/EfiGraphicsResolution %width%x%height%
echo Resolution is changed to %width% ¡¿ %height%.
timeout 2
goto :SUB_MAIN
