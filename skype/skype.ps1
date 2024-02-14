# http://www.skype.com/go/getskype-msi

echo 'SKYPE'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir Skype*.msi | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/quiet /norestart'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\Skype.lnk' -ErrorAction SilentlyContinue

echo ' - importing registry file turning off autostart on boot'
regedit /S "$parent_dir\skype_no_autostart.reg"

echo 'SKYPE DONE'
echo '------------------------------------------------------------------------------'
