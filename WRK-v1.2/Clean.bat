IF [%2] EQU [] goto setenv
set path=%2\tools\%1;%path%
set wrkarch=%1
goto dothejob
:setenv
call WRKEnv.bat %1
:dothejob
cd base\ntos\
nmake %wrkarch%= clean
cd ..\..

