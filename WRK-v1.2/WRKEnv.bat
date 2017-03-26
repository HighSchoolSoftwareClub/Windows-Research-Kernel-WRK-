@echo off
rem
rem This batch file sets the following WRK build and debug environment variables:
rem    wrkarch - the target architecture, "x86" or "amd64"; 1st parameter of the batch file; default is x86
rem    path - the search path, modified to include the tools for respective target architecture
rem           and Windows Debugger (WinDbg)
rem    windbgargs - the arguments for WinDbg
rem    _NT_SYMBOL_PATH - symbol path for WinDbg
rem
rem Usage: copy this file to your hard drive and edit it to reflect your installation;
rem        open a console window and run this batch file;
rem        run command "set" to make sure the environment is set properly;
rem        now you can build WRK and run Windbg from this console window.
rem
IF DEFINED wrkarch goto finish
SET wrkarch=x86
IF NOT [%1] EQU [] SET wrkarch=%1
SET path=%cd%\tools\%wrkarch%;%path%;C:\Program Files\Debugging Tools for Windows
SET windbgargs=-k com:pipe,port=\\.\pipe\debug,resets=0,reconnect
SET _NT_SYMBOL_PATH="%cd%\base\ntos\build\exe;%cd%\WS03SP1HALS\x86\halacpim"
@title WRK %wrkarch%
:finish


