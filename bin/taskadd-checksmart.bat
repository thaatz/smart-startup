@echo off
cd /d "%~dp0"
cd ..
:: http://superuser.com/questions/243605/how-do-i-specify-run-with-highest-privileges-in-schtasks
setlocal
set runlevel=

REM Get OS version from registry
for /f "tokens=2*" %%i in ('reg.exe query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentVersion"') do set os_ver=%%j

REM Set run level (for Vista or later - version 6)
if /i "%os_ver:~,1%" GEQ "6" set runlevel=/rl HIGHEST

REM whoami>user
REM for /F "delims=" %%a in (user) do set "user=%%a"
REM del user

REM Execute SchTasks.exe
REM legacy option (for windows xp since /xml is vista+)
REM using the /IT switch here is optional, as it will default this way anway
REM SchTasks /Create /IT /SC DAILY /TN "smart-startup check smart" /TR "'%cd%\checksmart.bat'" /ST 14:00 /RU Users %runlevel%
SchTasks /Create /XML "%cd%\bin\checksmart task.xml" /TN "smart-startup check smart"
pause