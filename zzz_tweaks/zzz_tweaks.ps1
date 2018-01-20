echo 'SYSTEM TWEAKS'

echo ' - disable startup of windows media player network sharing service'
Set-Service 'WMPNetworkSvc' -startupType manual

echo ' - disable tcp auto-tuning'
netsh int tcp set global autotuninglevel=disabled >> "$env:temp\robo_log.txt"

echo ' - show file extensions, show system files'
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
#Stop-Process -processname explorer

echo ' - remove local printer - Microsoft XPS Document Writer'
$a = get-wmiobject -query 'SELECT * FROM win32_printer WHERE name = "Microsoft XPS Document Writer"'
$a.delete()

echo ' - remove local printer - Fax'
$a = get-wmiobject -query 'SELECT * FROM win32_printer WHERE name = "Fax"'
$a.delete()

echo 'SYSTEM TWEAKS DONE'
echo '------------------------------------------------------------------------------'
