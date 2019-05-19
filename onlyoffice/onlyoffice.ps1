# https://github.com/ONLYOFFICE/DesktopEditors/releases/download/ONLYOFFICE-DesktopEditors-4.8.0/DesktopEditors_x64.exe
# https://helpcenter.onlyoffice.com/desktop/documents/allplatforms/desktop-editors-changelog.aspx

echo 'ONLYOFFICE 5.2.8 (2019-05-14)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
echo ' - installation in progress ...'

Start-Process -FilePath "$parent_dir\DesktopEditors_x64.exe" -ArgumentList '/VERYSILENT' -Wait


echo 'ONLYOFFICE DONE'
echo '------------------------------------------------------------------------------'


