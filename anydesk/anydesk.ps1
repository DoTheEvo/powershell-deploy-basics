echo "INSTALLING ANYDESK v3.2.3 (2017-05-09)"
# http://anydesk.com/platforms
# http://download.anydesk.com/changelog.txt

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\AnyDesk.exe" -ArgumentList '--install "C:\Program Files (x86)\AnyDesk"',"--silent","--create-shortcuts" -Wait

echo "- copying config file"
$targetdirectory = "$env:APPDATA\AnyDesk"
robocopy $parent_dir $targetdirectory user.conf >> "$env:temp\robo_log.txt"

Set-Service "AnyDesk" -startupType manual
echo "- anydesk service set to manual startup"

echo "ANYDESK DONE"
echo "------------------------------------------------------------------------------"
