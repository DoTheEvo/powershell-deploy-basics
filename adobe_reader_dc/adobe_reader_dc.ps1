# https://get.adobe.com/reader/enterprise/
# https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2200120169/AcroRdrDCx642200120169_sk_SK.exe

echo 'ADOBE READER DC v1900820071'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir Acro*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, TERMINATING INSTALLATION"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/sAll /msi /norestart DISABLEDESKTOPSHORTCUT=1 /quiet ALLUSERS=1 EULA_ACCEPT=YES'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments -Wait

echo ' - changing default zoom and panel behaviour'
regedit /S "$parent_dir\settings.reg"

# echo ' - removing desktop link'
# Remove-Item 'C:\Users\Public\Desktop\Acrobat Reader DC.lnk' -ErrorAction SilentlyContinue

echo 'ADOBE READER DC DONE'
echo '------------------------------------------------------------------------------'


