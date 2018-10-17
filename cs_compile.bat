@echo off
title C# DRILL 18

rem nav to desktop
cd /d "%USERPROFILE%\Desktop"

rem if / else for root
IF EXIST "%USERPROFILE%\Desktop\cs_compile" (cd /d "%USERPROFILE%\Desktop\cs_compile") ELSE (mkdir "cs_compile")

rem nav to dir
SET _dir = "%CD%"
IF NOT _dir == "%USERPROFILE%\Desktop\cs_compile" (cd /d "%USERPROFILE%\Desktop\cs_compile")
echo DIRECTORY SET
PAUSE

rem delete file if exists
IF EXIST test.txt DEL /F test.txt

rem delete .exe if exists
IF EXIST test.exe DEL /F test.exe

rem delete .dll if exists
IF EXIST test.dll DEL /F test.dll
echo DELETE OLD OBJECTS COMPLETE
PAUSE

rem write cs file
@echo using System; > test.txt
@echo class Test  >> test.txt
@echo { >> test.txt
@echo 	static void Main()  >> test.txt
@echo 	{ >> test.txt 
@echo 		Console.WriteLine("Hello, World");  >> test.txt
@echo 		Console.ReadLine(); >> test.txt 
@echo 		Console.WriteLine("Automation saves lives.");  >> test.txt
@echo 		Console.ReadLine(); >> test.txt 
@echo 	} >> test.txt 
@echo } >> test.txt 
echo WRITE C# FILE COMPLETE
PAUSE

rem compile .exe file
cmd /C csc /target:exe test.txt
echo COMPILE .EXE COMPLETE
PAUSE

rem compile .dll file
cmd /C csc /target:library test.txt
echo COMPILE .DLL COMPLETE
PAUSE

rem run .exe
start test.exe
PAUSE

CLS
EXIT