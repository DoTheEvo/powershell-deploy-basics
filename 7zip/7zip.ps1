# http://www.7-zip.org/download.html

echo '7ZIP v18.05 (2018-04-30)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\7z1805-x64.msi" -ArgumentList '/q',"INSTALLDIR=`"${env:ProgramFiles}\7-Zip`"",'/norestart','TRANSFORMS=associations.mst' -Wait

echo ' - importing registry file with the settings'
regedit /S "$parent_dir\7zip.reg"

echo '7ZIP DONE'
echo '------------------------------------------------------------------------------'
