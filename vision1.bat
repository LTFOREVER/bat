@echo off
setlocal enabledelayedexpansion

set folder=%~dp0

for /f "delims=" %%a in ('dir /b /s "%folder%" ^| findstr /i /r "\([0-9]\)\."') do (
    set "filename=%%~na"
    set "extension=%%~xa"
    set "newname=!filename:~0,-3!!extension!"

    if exist "!newname!" (
        echo deleting "!newname!"...
        del /f "!newname!"
        echo rename "%%a" to new name:"!newname!"
        ren "%%a" "!newname!"
    ) else (
        echo Renaming "%%a" to "!newname!"...
        ren "%%a" "!newname!"
    )
)

echo Done!
pause