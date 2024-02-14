# http://www.irfanview.com/

echo 'IRFANVIEW'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir iview*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/silent /group=1 /allusers=1 /assoc=1 /ini=%APPDATA%\irfanview'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - copying config files'
$target_dir = "$env:ProgramW6432\IrfanView\Languages"
robocopy $parent_dir $target_dir IP_Slovak.lng >> "$env:temp\robo_log.txt"
robocopy $parent_dir $target_dir Slovak.dll >> "$env:temp\robo_log.txt"

$target_dir = "$env:APPDATA\irfanview"
robocopy $parent_dir $target_dir i_view64.ini >> "$env:temp\robo_log.txt"

echo ' - copying webp plugin'
$target_dir = "$env:ProgramW6432\IrfanView\Plugins"
robocopy $parent_dir $target_dir WebP.dll >> "$env:temp\robo_log.txt"

echo 'IRFANVIEW DONE'
echo '------------------------------------------------------------------------------'

