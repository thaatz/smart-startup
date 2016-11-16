@echo off
pushd %~dp0 2>NUL
REM diskinfo32.exe /copyexit
REM find "Caution" diskinfo.txt 
REM findstr /i "caution bad" "%~dp0%DiskInfo.txt"
:: for some reason, findstr gets really buggy if I tell it to read the file on its own, so I pipe it with type here instead
:: http://ss64.com/nt/findstr.html
type diskinfo.txt | findstr "Caution Bad"
REM echo %errorlevel%
if %errorlevel%==0 (
	:: A SMART error was dectected
	:error
	title S.M.A.R.T. ALERT
	cls
	echo.
	REM echo Disk health status: CAUTION
	type diskinfo.txt | findstr "Caution Bad"
	echo    Your drive is failing
	pause>nul
	goto :error
)
echo all good
pause