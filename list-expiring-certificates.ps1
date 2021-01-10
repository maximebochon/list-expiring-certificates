# Description: PowerShell script to detect and list expiring machine and user certificates in Windows 10+.
# Repository: https://github.com/maximebochon/list-expiring-certificates

$days = 30

$expiringCertificates = Get-ChildItem -Path Cert:\LocalMachine\My,Cert:\CurrentUser\My -Recurse -ExpiringInDays $days

if ($expiringCertificates.Length -gt 0) {
	""
	"The following certificates will expire in less than $days day(s):"
	$expiringCertificates | select NotAfter, DnsNameList, Issuer | sort NotAfter | Out-Host
	"Press ENTER to quit..."
	$Host.UI.ReadLine()
}
