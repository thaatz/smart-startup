# S.M.A.R.T. Startup
script that runs crystaldiskinfo in cmd and then reports when there is an issue
for best results turn on the alerts in the crystaldiskinfo interface

Normally you can just install crystaldiskinfo and have it run on startup and you will know. You can also use resident, but this script just runs in the background instead. Makes it easy for managing computers for people.

## wat do
**checksmart.bat** - put this in the startup folder. Optionally set to run once per day or once every two days
this will quickly check the SMART status of the drive (watches SMART 5, 197, 198)
this can be configured to send an email to someone or alert the user

**checkdisk.bat** - schedule this to run once a month
this will run chkdsk in read-only mode and if it finds an error, schedule a fix next time the computer reboots

## Usage
```
run.bat [smart | chkdsk] [addtask | removetask]
```
WIP...

### other programs
* in general, just use crystaldiskinfo with startup and resident
* speedfan is alright and gives a subjective fitness and performance report
* gmsartcontrol is good if you want more granularity and want have custom alarms for all the other attributes (no one does this, its pointless)
