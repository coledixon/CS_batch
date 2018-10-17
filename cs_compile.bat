@echo off
title C# DRILL 18

rem nav to dir
cd /d "C:\Users\Cole Dixon\Desktop\CS_18"

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
@echo 		Console.WriteLine("This is a stupid drill.");  >> test.txt
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