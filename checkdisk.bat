@echo off
pushd %~dp0 2>NUL

title Monthly scheduled disk check

:: Run a read-only scan and look for errors. Schedule a scan at next reboot if errors found
chkdsk.exe %SystemDrive%
rem errorlevel is 0 if its good i think
if /i not %ERRORLEVEL%==0 (
	echo.
	echo !  Errors found on %SystemDrive%. Scheduling full chkdsk at next reboot.
	fsutil dirty set %SystemDrive%
	echo.
	echo    It is recommended that you save your work and restart the computer to begin a disk check when you can.
	echo.
	echo    Press any key to close this message . . .
	pause>nul
) else (
	echo    No errors found on %SystemDrive%. Skipping full chkdsk at next reboot.
)
echo    Done.

rem things to look at
REM chkdsk /perf
REM pause