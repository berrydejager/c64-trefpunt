@echo off
cls
java -jar .\Prerequisites\KickAssembler\KickAss.jar ..\SourceBin\main.src -showmem 
if %errorlevel%==0 .\Prerequisites\WinVICE\x64mm.exe +VICIIdsize -VICIIborders 2 +confirmexit ..\SourceBin\main.prg
if not %errorlevel%==0 pause
.\compile.cmd
pause

