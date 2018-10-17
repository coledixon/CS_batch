@echo off
title C# DRILL 18

rem nav to desktop
cd /d "%USERPROFILE%\Desktop"

rem if / else for root
IF EXIST "%USERPROFILE%\Desktop\cs_compile" (cd /d "%USERPROFILE%\Desktop\cs_compile") ELSE (mkdir "cs_compile")
echo ROOT DIRECTORY SET

rem nav to dir (if not set in if / else)
SET _currdir = "%CD%"
IF NOT _currdir == "%USERPROFILE%\Desktop\cs_compile" (cd /d "%USERPROFILE%\Desktop\cs_compile")
TIMEOUT 1
echo -- COMPLETE
PAUSE

echo CLEAR EXISTING OBJECT(S) FROM ROOT
rem delete file if exists
IF EXIST test.txt DEL /F test.txt

rem delete .exe if exists
IF EXIST test.exe DEL /F test.exe

rem delete .dll if exists
IF EXIST test.dll DEL /F test.dll
TIMEOUT 1
echo -- COMPLETE
PAUSE

echo WRITE C# FILE 
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
TIMEOUT 1 
echo -- COMPLETE
PAUSE

echo COMPILE .EXE 
rem compile .exe file
cmd /C csc /target:exe test.txt
TIMEOUT 1
echo -- COMPLETE
PAUSE

echo COMPILE .DLL 
rem compile .dll file
cmd /C csc /target:library test.txt
TIMEOUT 1
echo -- COMPLETE
PAUSE

echo RUN .EXE
rem run .exe
start test.exe
TIMEOUT 1
echo -- COMPLETE
PAUSE

CLS
EXIT