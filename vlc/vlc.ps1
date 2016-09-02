echo "INSTALLING VLC"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\vlc-2.2.4-win64.exe" -ArgumentList '/S','/L=1051' -Wait

echo "- copying config file"
$hush = @("/nfl","/ndl","/njh","/nc","/ns","/np")
$target_dir = "$env:APPDATA\vlc"
robocopy $parent_dir $target_dir vlcrc $hush
robocopy $parent_dir $target_dir vlc-qt-interface.ini $hush

Remove-Item "C:\Users\Public\Desktop\VLC media player.lnk" -ErrorAction SilentlyContinue
echo "- desktop link removed"

echo "VLC DONE"
echo "------------------------------------------------------------------------------"
