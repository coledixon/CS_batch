@echo off
rem BUILT BY: COLE DIXON 2018
title compile single .cs drill

echo CLEAR EXISTING OBJECT(S) FROM ROOT
rem delete .exe if exists
IF EXIST cs.exe DEL /F cs.exe

echo WRITE C# FILE 
rem write cs file
for /f "tokens=*" %%a in (cs.txt) do (
  echo %%a
  rem set /a N+=1 REMOVED
  rem echo %%a >> cs.txt REMOVED
)
TIMEOUT 1
echo [92m-- WRITE COMPLETE[0m


echo COMPILE .EXE 
rem compile .exe file
cmd /C csc /target:exe cs.txt
rem error handling
if ERRORLEVEL 1 (
  echo [91mERROR COMPILING CS.EXE; REVIEW CODE IN VS[0m
  PAUSE
  CLS
  EXIT
) else (echo [92m-- COMPLETE[0m)
TIMEOUT 2


echo RUN .EXE
rem run .exe
start cs.exe
rem error handling
if ERRORLEVEL 1 (
  echo [91mERROR RUNNING CS.EXE; REVIEW CODE IN VS[0m
  PAUSE
  CLS
  EXIT
) else (echo [92m-- COMPLETE[0m)
PAUSE


CLS
EXIT

