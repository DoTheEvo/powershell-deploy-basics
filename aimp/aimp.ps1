# http://aimp.ru/index.php?do=download

echo 'AIMP v4.70, build 2222'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir aimp*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/silent /auto'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - copying config files'
$target_dir = "$env:APPDATA\AIMP"
robocopy $parent_dir $target_dir AIMP.ini >> "$env:temp\robo_log.txt"
robocopy $parent_dir $target_dir\Skins Default.ini >> "$env:temp\robo_log.txt"
robocopy $parent_dir $target_dir\PLS Radia.aimppl4 >> "$env:temp\robo_log.txt"

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\AIMP.lnk' -ErrorAction SilentlyContinue

echo 'AIMP DONE'
echo '------------------------------------------------------------------------------'


