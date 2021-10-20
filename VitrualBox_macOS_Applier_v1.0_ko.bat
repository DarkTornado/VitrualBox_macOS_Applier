@echo off
color 0f
title VitrualBox macOS ����� (v 1.0)

:MAIN
cls
echo ========== [ VitrualBox macOS ����� (v 1.0) ] ==========
echo �� 2021 Dark Tornado, All rights reserved.
echo.
echo ���Ḧ ���Ѵٸ� 0��, ��� �����ϱ⸦ ���Ѵٸ� �ƹ��ų� �Է����ּ���.
set /p input=�Է�: 
if %input% == 0 exit

echo.
echo === [ ���� �ӽ� �̸� �Է� ] ===
set /p name=�Է�: 
echo %name%(��)�� ���õǾ����.
timeout 2

:SUB_MAIN
cls
cd "C:\Program Files\Oracle\VirtualBox"
title VitrualBox macOS ����� (v 1.0) - %name%
echo ========== [ VitrualBox macOS ����� (v 1.0) ] ==========
echo �� 2021 Dark Tornado, All rights reserved.
echo.
echo === [ �޴� (%name%) ] ===
echo 1. VitrualBox���� macOS�� ����ϱ� ���� ExtraData ����.
echo 2. ���� �ӽ� �ػ� ����.
echo 3. �ڷΰ���
echo 0. ����
set /p input=�Է�: 
if %input% == 0 exit
if %input% == 1 goto :SET_EXTRA
if %input% == 2 goto :SET_DISPLAY
if %input% == 3 goto :MAIN
goto :SUB_MAIN

:SET_EXTRA
echo === [ %name%�� ExtraData �߰� ] ===
VBoxManage.exe modifyvm "%name%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%name%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
echo %name%�� ExtraData�� ���������� �߰��Ǿ����.
timeout 3
goto :SUB_MAIN

:SET_DISPLAY
echo === [ %name%�� �ػ� ���� ] ===
set /p width="���� �Է�: "
set /p height="���� �Է�: "
VBoxManage setextradata "%name%" VBoxInternal2/EfiGraphicsResolution %width%x%height%
echo �ػ󵵰� %width% �� %height%�� ����Ǿ����.
timeout 2
goto :SUB_MAIN
