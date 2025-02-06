@echo off
setlocal

:: Define source and destination directories
set "source_dir=\\awsgisfs1\arcgis_shared_directories\portal\content\items"
set "dest_dir=C:\backup\content\items"

:: Ensure the destination directory exists
if not exist "%dest_dir%" (
    mkdir "%dest_dir%"
)

:: Iterate through all .txt files in the source directory
for /r "%source_dir%" %%f in (*.pbf) do (
    :: Get the relative path of the file from the source directory
    set "file_path=%%f"
    set "relative_path=%%f"
    setlocal enabledelayedexpansion
    set "relative_path=!relative_path:%source_dir%=!"
    
    :: Construct the destination directory path
    set "dest_file_path=%dest_dir%!relative_path!"
    set "dest_file_dir=!dest_file_path!\..\"
    
    :: Ensure the destination directory exists
    if not exist "!dest_file_dir!" (
        mkdir "!dest_file_dir!"
    )

    :: Move the file
    copy "%%f" "!dest_file_path!"

    endlocal
)

echo All text files have been moved from "%source_dir%" to "%dest_dir%" with folder structure preserved.
pause
