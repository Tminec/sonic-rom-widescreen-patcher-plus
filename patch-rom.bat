@echo off
title Sonic ROM Widescreen Patcher v2.3
echo Sonic ROM Widescreen Patcher v2.3
cd bin
if exist log.txt goto :already else (echo Starting...)

:7zcheck
echo Checking for files...
echo Searching for 7za.exe...
if exist 7za.exe (echo 7za.exe found) else goto :error7za
echo Searching for wide.data...
if exist wide.data (echo wide.data found) else goto :errordata
:start
echo Press enter after patching your rom
	7za e wide.data data.html -r -aoa > nul
start data.html
pause>nul

echo Extracting executables
	7za e wide.data widescreen-rom-hack.exe -r -aoa > nul
	7za e wide.data gamecontrollerdb.txt -r -aoa > nul
	7za e wide.data config.json -r -aoa > nul
echo Succes
echo Please copy your patched rom into the "bin" folder and press enter.
pause>nul

:checkmd
if exist *.md (ren *.md rom.bin) else goto :checkgen
:checkgen
if exist *.gen (ren *.gen rom.bin) else goto :bin

:bin
	ren *.bin rom.bin
echo Succes!
start widescreen-rom-hack.exe

del 7za.exe
del data.html
del wide.data
:log
(echo Succes, Extracted files completely.)>log.txt
echo Press any key to exit.
pause>nul
exit

:error7za
echo 7za.exe cannot found.
echo Please make your you extracted all the files correctly.
echo Press any key to exit.
pause>nul
exit


:errordata
echo wide.data cannot found.
echo Please make your you extracted all the files correctly.
echo Press any key to exit.
pause>nul
exit

:already
echo A ROM has been patched before
echo Press any key to exit.
pause>nul
exit

:Exit
