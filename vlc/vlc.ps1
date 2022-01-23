# http://www.videolan.org/vlc/download-windows.html

echo 'VLC v3.0.16'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir vlc*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/S /L=1051'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - copying config file'
$target_dir = "$env:APPDATA\vlc"
robocopy $parent_dir $target_dir vlcrc >> "$env:temp\robo_log.txt"
robocopy $parent_dir $target_dir vlc-qt-interface.ini >> "$env:temp\robo_log.txt"

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\VLC media player.lnk' -ErrorAction SilentlyContinue

echo 'VLC DONE'
echo '------------------------------------------------------------------------------'
