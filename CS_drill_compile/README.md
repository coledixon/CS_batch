# CS_drill_compile

-- simple batch file for reading .txt file(s) containing cs code, and compiling the script into CLI .exe


### INSTRUCTIONS:

1) place code from program.cs into program.txt (Ctrl+C, Ctrl+V)

   -- if multi-class project, copy/paste cs from class cs files into the class_%.txt files in 'multi-cs project' folder
    -- move associated classes to ROOT with program.txt

2) run cs_drill_compile.bat

3) if ERRORLEVEL 1 during compile .exe || run .exe, cmd will output error message

4) cmd line application (drill) will run if ERRORLEVEL 0

5) cmd line closes after application complete
