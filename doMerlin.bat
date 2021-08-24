@echo off
if %errorlevel% neq 0 exit /b %errorlevel%
echo --------------- Variables ---------------
Set PRG=qs
Set ProjectFolder=.

Set MyAppleFolder=F:\Bruno\Dev\AppleWin
Set APPLEWIN=%MyAppleFolder%\AppleWin\Applewin.exe
Set MERLIN32ROOT=%MyAppleFolder%\Merlin32_v1.0
Set MERLIN32LIBS=%MELIN32ROOT%\Library
Set MERLIN32WIN=%MERLIN32ROOT%\Windows
Set MERLIN32EXE=%MERLIN32WIN%\merlin32.exe
Set APPLECOMMANDER=%MyAppleFolder%\Utilitaires\AppleCommander-win64-1.6.0.jar
rem Set ACJAR=java.exe -jar %APPLECOMMANDER%    ; avec ""
Set ACJAR=java.exe -jar %APPLECOMMANDER%
rem echo %ACJAR%

echo --------------- debut Merlin ---------------
%MERLIN32EXE% -V %MERLIN32LIBS% %ProjectFolder%\%PRG%.s
echo %MERLIN32EXE% -V %MERLIN32LIBS% %ProjectFolder%\%PRG%.s
if exist %ProjectFolder%\error_output.txt exit
echo --------------- fin Merlin ---------------

copy /Y %MyAppleFolder%\A.po %ProjectFolder%\%PRG%.po

echo --------------- Debut Applecommander ---------------
rem add binary program to image disk
%ACJAR% -p %PRG%.po %PRG% bin 32768 < %PRG%
rem %ACJAR% -p %PRG%.po %PRG% bin 768 < %PRG%
rem add DUMMYFILE to image disk
rem %ACJAR% -p %PRG%.po DUMMYFILE txt 0 < DUMMYFILE 
rem %ACJAR% -p %PRG%.po A.DHGR bin 8192 < A.DHGR

echo ----------- fin Applecommander ---------------
echo --------------- Debut Applewin ---------------
%APPLEWIN% -d1 %PRG%.po
echo --------------- Fin Applewin ---------------
