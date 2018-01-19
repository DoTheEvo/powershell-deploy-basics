echo "FLASH v28.0 (2018-01-18)"
# https://get.adobe.com/flashplayer/

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
echo ' - installation in progress...'
Start-Process -FilePath "$parent_dir\install_flash_player.exe" -ArgumentList "/install" -Wait

echo "FLASH DONE"
echo "------------------------------------------------------------------------------"


