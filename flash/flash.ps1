# https://get.adobe.com/flashplayer/

echo 'FLASH v30.0.0.113 (2018-06-17)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\install_flash_player.exe" -ArgumentList '/install' -Wait

echo 'FLASH DONE'
echo '------------------------------------------------------------------------------'


