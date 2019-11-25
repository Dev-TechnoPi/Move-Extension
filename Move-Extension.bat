:: Move-Extension [--Extension "File Extension"] [--Folder "Folder Name"] [--Help]
@if defined show_commands (@echo on) else (@echo off) & setlocal enableextensions enabledelayedexpansion
@echo !time! : [INFO] : Retriving passed command line arguments^.^.^.
:get_arguments
if not "%~1" == "" (
    if /i "%~1" == "--Help" goto display_help
	if /i "%~1" == "--Extension" set "file_extension=%~2"
	if /i "%~1" == "--Folder" set "folder_name=%~2"
	if /i "%~3" == "--Extension" set "file_extension=%~4"
	if /i "%~3" == "--Folder" set "folder_name=%~4"
	if not defined file_extension (
	    echo !time! : [TRIP] : The specified file extension is invalid^.
		set "show_commands="
		endlocal && exit /b 1
	    )
	if not defined folder_name (
	    echo !time! : [TRIP] : The specified folder name is invalid^.
		set "show_commands="
		endlocal && exit /b 1
	    )
	echo !file_extension! | find /i "." >nul 2>nul || (
	    echo !time! : [TRIP] : The file extension name is invalid^.
		set "show_commands="
		endlocal && exit /b 1
	    )
	if not exist *!file_extension! (
	    echo !time! : [TRIP] : No files exist with the specified file extension^.
		set "show_commands="
		endlocal && exit /b 1
	    )
	if exist !folder_name! (
	    echo !time! : [TRIP] : A folder already exists with the specified name^.
		set "show_commands="
		endlocal && exit /b 1
	    )
	echo !file_extension! | find /i "*" >nul 2>nul || (
	    echo !time! : [TRIP] : The file extension name is invalid^.
        set "show_commands="
		endlocal && exit /b 1
	    )
    )
if not exist !folder_name! mkdir "!folder_name!" && move "!file_extension!" "!folder_name!" >nul 2>nul
echo !time! : [DONE] : Moved the file extension !file_extension! to !folder_name!^.
set "show_commands="
endlocal && exit /b 0
:display_help
echo Syntax :
echo %~n0 ^<--Extension "File Extension"^> ^<--Folder "Folder Name"^> [--Help]
echo.
echo --Extension      : The switch that specifies that "File Extension" is after^.
echo "File Extension" : The extensions which the files that are moved end with^.
echo --Folder         : The switch that specifies that "Folder Name" is after^.
echo "Folder Name"    : The folder that the files will be moved to^.
echo --Help           : Displays this help message^.
echo.
echo Remarks :
echo + Do NOT use ^<^> and [] in the arguments. ^<^> means required, and [] means optional^.
echo + If the specified folder does not exist, a new folder with the same name will be created^.
echo + If you have any problems with this, email me at kylevuvn2010@gmail.com^.
endlocal && exit /b 0