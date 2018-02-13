# https://get.adobe.com/flashplayer/

echo 'FLASH v28.0.0.161 (2018-02-12)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\install_flash_player.exe" -ArgumentList '/install' -Wait

echo 'FLASH DONE'
echo '------------------------------------------------------------------------------'


