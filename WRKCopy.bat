@echo off
echo.
echo.
SET _PARAM=%1

IF [%_PARAM%] EQU [] (
     echo.
     echo ATTENTION! Windows Research Kernel will be installed
     echo in directory C:\WRK-v1.2 
     echo.
     echo If you want to use different installation settings,
     echo press Ctrl+C to abort the run of this command file,
     echo open console window and run this command file with
     echo option /w WRK_destination_dir
     echo.
     echo To install WRK using default settings,
     echo press any key other than Ctrl+C.
     pause 
)

rem Initialize user defined variables
SET _WRKINSTDIR=1
SET _SRCROOT=%CD%

rem Retrieve command line arguments
:startcommandline

SET _PARAM=%1
SET _VALUE=%2
shift
shift

IF [%_PARAM%] EQU [] (
     goto endcommandline

) ELSE IF [%_PARAM%] EQU [/?] (
     goto usage

) ELSE IF [%_PARAM%] EQU [/w] (
     
     IF /I %_WRKINSTDIR% EQU 1 (
          IF DEFINED _VALUE (
               SET _WRKINSTDIR=%_VALUE%
          ) ELSE (
               goto usage
          )
     )

) ELSE ( goto usage )

goto startcommandline
:endcommandline

rem Define environment and directory default values
SET _ARCH=x86
SET _WRKSRCDIR=%_SRCROOT%\WRK-v1.2

rem Define a destination directory if not specified on the command line
IF %_WRKINSTDIR%    EQU 1 SET _WRKINSTDIR=c:\WRK-v1.2

rem Create the WRK install directory if it does not already exist
IF /I NOT EXIST "%_WRKINSTDIR%" (
     MKDIR "%_WRKINSTDIR%" || ( echo Error: could not create directory: %_WRKINSTDIR% & goto end )
     echo Creating the WRK installation directory: 
     echo %_WRKINSTDIR% 
     echo.
)

echo Copying the WRK sources from directory:
echo %_WRKSRCDIR% 
echo to directory:
echo %_WRKINSTDIR%
xcopy /crehkdqy "%_WRKSRCDIR%" "%_WRKINSTDIR%"  || ( echo Error: could not copy the WRK sources to directory: %_WRKINSTDIR% & goto end )
echo.

goto :end

:usage
echo.
echo.
echo Usage: 
echo      WRKInstall.bat [/?] [/w directory]
echo.
echo Description:
echo      Copies the Windows Research Kernel (WRK) and samples
echo      to local disk, and configures new user 
echo      level environment variables for building and debugging the WRK.
echo.
echo Parameters:
echo      ?                   Displays this help message
echo.
echo      w     directory     Specifies the WRK and documentation installation directory.
echo.     
echo Note:
cho      The default installation directory for the WRK and documentation is: 
echo         c:\WRK-v1.2
echo. 
:end