echo "INSTALLING ANYDESK"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\AnyDesk.exe" -ArgumentList '--install "C:\Program Files (x86)\AnyDesk"','--silent','--create-shortcuts' -Wait

$targetdirectory = "$env:APPDATA\AnyDesk"
robocopy $parent_dir $targetdirectory user.conf
echo "- config files copied"

Set-Service "AnyDesk" -startupType manual
echo "- anydesk service set to manual startup"

echo "ANYDESK DONE"
echo "------------------------------------------------- "
