# https://get.adobe.com/flashplayer/

echo 'FLASH for Firefox v32.0.0.156 (2019-03-25)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\install_flash_player.exe" -ArgumentList '/install','-au 0' -Wait

echo 'FLASH DONE'
echo '------------------------------------------------------------------------------'


