echo 'ASSOCIATIONS'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - use SetUserFTA.exe to change associations'

$arguments = "$parent_dir\assoc_config.txt"
Start-Process -Wait -FilePath "$parent_dir\SetUserFTA.exe" -ArgumentList $arguments

echo ' - importing registry file preventing association popup'
regedit /S "$parent_dir\no_popup_dialogue.reg"

echo 'ASSOCIATIONS DONE'
echo '------------------------------------------------------------------------------'
