# xpsfc
script that runs crystaldiskinfo in cmd and then reports when there is an issue
for best results turn on the alerts in the crystaldiskinfo interface

##wat do
**checksmart.bat** - put this in the startup folder. Optionally set to run once per day or once every two days
this will quickly check the SMART status of the drive (watches SMART 5, 197, 198)
this can be configured to send an email to someone or alert the user

**checkdisk.bat** - schedule this to run once a month
this will run chkdsk in read-only mode and if it finds an error, schedule a fix next time the computer reboots
