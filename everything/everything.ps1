# https://www.voidtools.com/downloads/

echo 'EVERYTHING LITE v1.4.1.1015'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir everything*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/S -install-options "-install-service -disable-run-as-admin -appdata"'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - copying config files'
$target_dir = "$env:APPDATA\Everything"
robocopy $parent_dir $target_dir Everything.ini >> "$env:temp\robo_log.txt"

echo 'EVERYTHING DONE'
echo '------------------------------------------------------------------------------'


