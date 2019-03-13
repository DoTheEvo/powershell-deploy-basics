# http://www.sumatrapdfreader.org/download-free-pdf-viewer.html

echo 'SUMATRA v3.1.2 (2016-08-14)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\SumatraPDF-3.1.2-64-install.exe" -ArgumentList '/s','/register' -Wait

echo ' - setting default zoom to 100% ...'
$target = "$env:APPDATA\SumatraPDF\SumatraPDF-settings.txt"
$file_content = Get-Content -Path $target | Out-String
$edited_content = $file_content -replace 'DefaultZoom = fit page','DefaultZoom = 100'
$edited_content | Set-Content -Path $target

echo 'SUMATRA DONE'
echo '------------------------------------------------------------------------------'
