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
echo [92m-- COMPLETE[0m

echo CLEAR EXISTING OBJECT(S) FROM ROOT
rem delete file if exists
IF EXIST test.txt DEL /F test.txt

rem delete .exe if exists
IF EXIST test.exe DEL /F test.exe

rem delete .dll if exists
IF EXIST test.dll DEL /F test.dll
TIMEOUT 1
echo [92m-- CLEAN-UP COMPLETE[0m

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
echo [92m-- WRITE COMPLETE[0m


echo COMPILE .EXE 
rem compile .exe file
cmd /C csc /target:exe test.txt
rem error handling
if ERRORLEVEL 1 (
  echo [91mERROR COMPILING TEST.EXE[0m
  PAUSE
  CLS
  EXIT
) else (echo [92m-- COMPLETE[0m)
TIMEOUT 2


echo COMPILE .DLL 
rem compile .dll file
cmd /C csc /target:library test.txt
rem error handling
if ERRORLEVEL 1 (
  echo [91mERROR COMPILING TEST.DLL[0m
  PAUSE
  CLS
  EXIT
) else (echo [92m-- COMPLETE[0m)
TIMEOUT 2


echo RUN .EXE
rem run .exe
start test.exe
rem error handling
if ERRORLEVEL 1 (
  echo [91mERROR RUNNING TEST.EXE[0m
  PAUSE
  CLS
  EXIT
) else (echo [92m-- COMPLETE[0m)
PAUSE

CLS
EXIT