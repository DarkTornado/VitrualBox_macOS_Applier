@echo off
color 0f
title VitrualBox macOS 적용기 (v 1.0)

:MAIN
cls
echo ========== [ VitrualBox macOS 적용기 (v 1.0) ] ==========
echo ⓒ 2021 Dark Tornado, All rights reserved.
echo.
echo 종료를 원한다면 0을, 계속 실행하기를 원한다면 아무거나 입력해주세요.
set /p input=입력: 
if %input% == 0 exit

echo.
echo === [ 가상 머신 이름 입력 ] ===
set /p name=입력: 
echo %name%(이)가 선택되었어요.
timeout 2

:SUB_MAIN
cls
cd "C:\Program Files\Oracle\VirtualBox"
title VitrualBox macOS 적용기 (v 1.0) - %name%
echo ========== [ VitrualBox macOS 적용기 (v 1.0) ] ==========
echo ⓒ 2021 Dark Tornado, All rights reserved.
echo.
echo === [ 메뉴 (%name%) ] ===
echo 1. VitrualBox에서 macOS를 사용하기 위한 ExtraData 설정.
echo 2. 가상 머신 해상도 설정.
echo 3. 뒤로가기
echo 0. 종료
set /p input=입력: 
if %input% == 0 exit
if %input% == 1 goto :SET_EXTRA
if %input% == 2 goto :SET_DISPLAY
if %input% == 3 goto :MAIN
goto :SUB_MAIN

:SET_EXTRA
echo === [ %name%에 ExtraData 추가 ] ===
VBoxManage.exe modifyvm "%name%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
echo %name%에 ExtraData가 정상적으로 추가되었어요.
timeout 3
goto :SUB_MAIN

:SET_DISPLAY
echo === [ %name%의 해상도 설정 ] ===
set /p width="가로 입력: "
set /p height="세로 입력: "
VBoxManage setextradata "%name%" VBoxInternal2/EfiGraphicsResolution %width%x%height%
echo 해상도가 %width% × %height%로 변경되었어요.
timeout 2
goto :SUB_MAIN
