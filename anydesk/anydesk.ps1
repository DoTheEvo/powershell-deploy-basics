echo "INSTALLING ANYDESK"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\AnyDesk.exe" -ArgumentList '--install "C:\Program Files (x86)\AnyDesk"',"--silent","--create-shortcuts" -Wait

echo "- copying config file"
$hush = @("/nfl","/ndl","/njh","/nc","/ns","/np")
$targetdirectory = "$env:APPDATA\AnyDesk"
robocopy $parent_dir $targetdirectory user.conf $hush

Set-Service "AnyDesk" -startupType manual
echo "- anydesk service set to manual startup"

echo "ANYDESK DONE"
echo "------------------------------------------------------------------------------"
