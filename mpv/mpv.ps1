# https://sourceforge.net/projects/mpv-player-windows/files/64bit/

echo 'MPV'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - copying the mpv folder in to program files'
robocopy "$parent_dir\mpv" "$env:programfiles\mpv" /E >> "$env:temp\robo_log.txt"

echo ' - copying the config folder'
robocopy "$parent_dir\portable_config" "$env:programfiles\mpv\portable_config" /E >> "$env:temp\robo_log.txt"

echo ' - running bat file to associate video files ...'
Start-Process -FilePath "$env:programfiles\mpv\installer\mpv-install.bat" -ArgumentList '/u' -Wait

echo 'MPV DONE'
echo '------------------------------------------------------------------------------'
