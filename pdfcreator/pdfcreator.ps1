echo 'PDFCREATOR v2.5.3 (2017-07-04)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - importing registry file with the settings'
regedit /S "$parent_dir\settings.reg"

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\PDFCreator_v2.5.3.exe" -ArgumentList '/SILENT','/NORESTART',"/LOADINF=$parent_dir\pdfcreator.inf" -Wait


echo 'PDFCREATOR DONE'
echo '------------------------------------------------------------------------------'


