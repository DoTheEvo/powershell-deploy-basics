# https://github.com/cyanfish/naps2/releases

echo 'NAPS2 v6.1.2'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir naps*.msi | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/quiet /norestart'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo 'NAPS2 DONE'
echo '------------------------------------------------------------------------------'

