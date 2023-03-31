@echo off
setlocal enabledelayedexpansion

set folder=%~dp0

for /f "delims=" %%a in ('dir /b /s "%folder%" ^| findstr /i /r "\([0-9]\)\."') do (
    set "filename=%%~na"
    set "extension=%%~xa"
    set "newname=!filename:~0,-3!!extension!"
    if exist "!newname!" (
        for %%b in ("!newname!") do (
                set file1time=%%~ta
                set file2time=%%~tb
                if !file1time! lss !file2time! (
                            echo compared "%%a" and "!newname!"
                            echo "%%~ta" "%%~tb"
                            echo deleting "%%a"...
                            del /f "%%a"
                        ) else (
                            echo compared "%%a" "%%~ta" and "!newname!"
                            echo "%%~ta" "%%~tb"
                            echo deleting "!newname!"...
                            del /f "!newname!"
                            echo Renaming "%%a" to "!newname!"...
                            ren "%%a" "!newname!"
                        )
        )
    )
	
)
echo Done!
pause