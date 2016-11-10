@echo off
pushd %~dp0 2>NUL
diskinfo32.exe /copyexit
find /i "caution" diskinfo.txt
if %errorlevel%==0 (
	rem echo %errorlevel%
	title SMART ALERT
	echo sumting wong
	pause
)
echo all good
pause