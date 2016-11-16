@echo off
pushd %~dp0 2>NUL
echo sending report . . .
SwithMail.exe /s /x "fostatek.xml" /a "DiskInfo.txt"
REM echo debug %errorlevel%
if %errorlevel%==1 (
	echo could not connect to the mail server
	echo.
	pause
	exit
)
pause