# Detect and list expiring certificates
> PowerShell script to detect and list expiring machine and user certificates in Windows 10.

## Configuration

There is only one parameter: the _detection period_, expressed in days, with a default value of 60.

Thus, you will be notified, a certain number of days in advance, of the expiration of some certificates.

This parameter can be edited directly in `list-expiring-certificates.ps1`:

```powershell
$days = 60
```

## Manual usage

This script can be used manually without elevated privilege.

To do so, from the file explorer:
  - right-click on `list-expiring-certificates.ps1`
  - choose _Run with PowerShell_

If expiring certificates are detected, they are displayed as follows:

```
The following certificates will expire in less than 60 day(s):

NotAfter            DnsNameList                Issuer
--------            -----------                ------
19/04/2021 20:06:10 {BOCHON Maxime}            E=root@bochon.net, CN=AC 2018 BOCHON Development, OU=01 22600, O=Bochon, C=FR
28/06/2021 14:06:23 {maxime.bochon@bochon.net} CN=Communications Server


Press ENTER to quit...
```

Otherwise, the terminal closes in a blink.

## Startup usage

This script is intended to be used at startup to notify the user about expiring certificates.

To do so, using a standard user in a Windows 10 session:
- run (`CTRL`+`R`) `shell:Startup` to open the user's startup directory
- create a shortcut pointing to `startup.cmd`
- set its _Start in_ property to the directory containing `list-expiring-certificates.ps1`
