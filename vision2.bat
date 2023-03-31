@echo off
setlocal enabledelayedexpansion

set folder=%~dp0

for /f "delims=" %%a in ('dir /b /s "%folder%" ^| findstr /i /r "\([0-9]\)\."') do (
    set "filename=%%~na"
    set "extension=%%~xa"
    set "newname=!filename:~0,-3!!extension!"::newname不含（1）

    if exist "!newname!" (

        for /f "delims=" %%b in ('dir /b /a-d "%%a"') do (
                    set file1time=%%~ta
                )
        for /f "delims=" %%c in ('dir /b /a-d "!newname!"') do (
                    set file2time=%%~ta
                )

        if !file1time! lss !file2time! (
                     echo compared "%%a" and "!newname!"
                     echo deleting "%%a"...
                     del /f "%%a"
                ) else (
                     echo compared "%%a" and "!newname!"
                     echo deleting "!newname!"...
                     del /f "!newname!"
                     echo Renaming "%%a" to "!newname!"...
                     ren "%%a" "!newname!"
                )
    )
	
)
echo Done!
pause