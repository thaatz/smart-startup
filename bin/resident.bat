@echo off
tasklist /fi "IMAGENAME eq explorer.exe" | find /i "explorer.exe"
if %errorlevel%==1 (
	:: no one is logged in
	exit
)

REM answer from BlueBearr
REM http://stackoverflow.com/questions/1607271/how-do-you-find-the-current-user-in-a-windows-environment
for /f "TOKENS=1,2,*" %%a in ('tasklist /FI "IMAGENAME eq explorer.exe" /FO LIST /V') do if /i "%%a %%b"=="User Name:" set _currdomain_user=%%c
REM for /f "TOKENS=1,2 DELIMS=\" %%a in ("%_currdomain_user%") do set _currdomain=%%a & set _curruser=%%b
REM echo %_currdomain%\%_curruser%>user.txt
SchTasks /Create /f /IT /SC MONTHLY /D 1 /TN "smart-startup check disk" /TR "'%cd%\checkdisk.bat'" /ST 14:00 /RU %_currdomain_user% %runlevel%
SchTasks /Create /f /IT /SC DAILY /TN "smart-startup check smart" /TR "'%cd%\checksmart.bat'" /ST 14:00 /RU %_currdomain_user% %runlevel%
pause