# https://get.adobe.com/reader/otherversions/

echo 'ADOBE READER DC v19.008.20071 (2018-10-17)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\AcroRdrDC1900820071_sk_SK.exe" -ArgumentList '/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES' -Wait

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\Acrobat Reader DC.lnk' -ErrorAction SilentlyContinue

echo 'ADOBE READER DC DONE'
echo '------------------------------------------------------------------------------'


