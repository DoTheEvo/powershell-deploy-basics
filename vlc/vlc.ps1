echo "VLC v2.2.8 (2017-12-05)"
# http://www.videolan.org/vlc/download-windows.html
# http://www.videolan.org/news.html

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo " - installation in progress ..."
Start-Process -FilePath "$parent_dir\vlc-2.2.8-win64.exe" -ArgumentList '/S','/L=1051' -Wait

echo " - copying config file"
$target_dir = "$env:APPDATA\vlc"
robocopy $parent_dir $target_dir vlcrc >> "$env:temp\robo_log.txt"
robocopy $parent_dir $target_dir vlc-qt-interface.ini >> "$env:temp\robo_log.txt"

echo " - removing desktop link"
Remove-Item "C:\Users\Public\Desktop\VLC media player.lnk" -ErrorAction SilentlyContinue

echo "VLC DONE"
echo "------------------------------------------------------------------------------"
