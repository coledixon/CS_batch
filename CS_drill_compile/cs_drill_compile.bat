@echo off
rem BUILT BY: COLE DIXON 2018
title compile single .cs drill

echo CLEAR EXISTING OBJECT(S) FROM ROOT
rem delete .exe if exists
IF EXIST cs.exe DEL /F cs.exe

echo WRITE C# FILE 
rem write cs file
for /f "tokens=*" %%a in (*.txt) do (
  echo %%a
  rem set /a N+=1 REMOVED
  rem echo %%a >> cs.txt REMOVED
)
TIMEOUT 1
echo [92m-- WRITE COMPLETE[0m

rem check number of .txt files in DIR
set count=0
set pattern=*.txt
for /f %%i in ('dir /b /a-d %pattern% ^| find /c /v ""') do @call set count=%%i

echo %count% .txt files found
echo [92m-- FILE COUNT COMPLETE[0m
TIMEOUT 1

echo COMPILE .EXE 
rem compile .exe file
IF %count% == 1 (
  rem compile single .cs project
  cmd /C csc /target:exe cs.txt
  rem error handling
  IF ERRORLEVEL 1 (
    echo [91mERROR COMPILING CS.EXE; REVIEW CODE IN VS[0m
    PAUSE
    CLS
    EXIT
  ) ELSE (echo [92m-- COMPLETE[0m)
) ELSE (
  rem compile multi-class .cs project
  cmd /C csc -define:DEBUG -optimize -out:cs.exe *.txt
  rem error handling
  IF ERRORLEVEL 1 (
    echo [91mERROR COMPILING CS.EXE; REVIEW CODE IN VS[0m
    PAUSE
    CLS
    EXIT
  ) ELSE (echo [92m-- COMPLETE[0m)
)
TIMEOUT 2


echo RUN .EXE
rem run .exe
start cs.exe
rem error handling
IF ERRORLEVEL 1 (
  echo [91mERROR RUNNING CS.EXE; REVIEW CODE IN VS[0m
  PAUSE
  CLS
  EXIT
) ELSE (echo [92m-- COMPLETE[0m)
PAUSE


CLS
EXIT

