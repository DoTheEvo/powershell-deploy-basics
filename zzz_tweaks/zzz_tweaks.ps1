echo 'SYSTEM TWEAKS'

echo ' - password never expires'
wmic UserAccount set PasswordExpires=False

echo ' - enable numlock on boot'
$key = 'Registry::HKU\.DEFAULT\Control Panel\Keyboard'
Set-ItemProperty $key InitialKeyboardIndicators 2

echo ' - disable automatic drivers download'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching'
Set-ItemProperty $key SearchOrderConfig 0

echo ' - disable startup of windows media player network sharing service'
Set-Service 'WMPNetworkSvc' -startupType manual

echo ' - show file extensions, show system files'
$key = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
#Stop-Process -processname explorer

echo ' - remove local printer - Microsoft XPS Document Writer'
$a = get-wmiobject -query 'SELECT * FROM win32_printer WHERE name = "Microsoft XPS Document Writer"'
if ($a) { $a.delete() }

echo ' - remove local printer - Fax'
$a = get-wmiobject -query 'SELECT * FROM win32_printer WHERE name = "Fax"'
if ($a) { $a.delete() }

echo 'SYSTEM TWEAKS DONE'
echo '------------------------------------------------------------------------------'
