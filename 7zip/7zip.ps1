# http://www.7-zip.org/download.html

echo '7ZIP v21.07'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir 7z*.msi | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, TERMINATING INSTALLATION"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = "/q INSTALLDIR=`"${env:ProgramFiles}\7-Zip`" /norestart TRANSFORMS=associations.mst"
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments -Wait

echo ' - importing registry file with the settings'
regedit /S "$parent_dir\7zip.reg"

echo '7ZIP DONE'
echo '------------------------------------------------------------------------------'
