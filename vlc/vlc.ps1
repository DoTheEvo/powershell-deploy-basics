echo "INSTALLING VLC v2.2.4 (2016-06-05)"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\vlc-2.2.4-win64.exe" -ArgumentList '/S','/L=1051' -Wait

echo "- copying config file"
$target_dir = "$env:APPDATA\vlc"
robocopy $parent_dir $target_dir vlcrc >> "$env:temp\robo_log.txt"
robocopy $parent_dir $target_dir vlc-qt-interface.ini >> "$env:temp\robo_log.txt"

Remove-Item "C:\Users\Public\Desktop\VLC media player.lnk" -ErrorAction SilentlyContinue
echo "- desktop link removed"

echo "VLC DONE"
echo "------------------------------------------------------------------------------"
