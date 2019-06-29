# https://github.com/cyanfish/naps2/releases

echo 'NAPS2 v6.1.1 (2019-06-29)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\naps2-6.1.1-setup.msi" -ArgumentList '/quiet','/norestart' -Wait

echo 'NAPS2 DONE'
echo '------------------------------------------------------------------------------'

