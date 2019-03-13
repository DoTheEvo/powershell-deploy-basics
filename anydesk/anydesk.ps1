# https://anydesk.com/platforms/windows
# https://anydesk.com/platforms/windows#updates

echo 'ANYDESK v4.3.0 (2018-12-14)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\AnyDesk.exe" -ArgumentList '--install "C:\Program Files (x86)\AnyDesk"','--silent','--create-shortcuts' -Wait

echo ' - copying config file'
$targetdirectory = "$env:APPDATA\AnyDesk"
robocopy $parent_dir $targetdirectory user.conf >> "$env:temp\robo_log.txt"

Set-Service 'AnyDesk' -startupType manual
echo ' - anydesk service set to manual startup'

echo 'ANYDESK DONE'
echo '------------------------------------------------------------------------------'
