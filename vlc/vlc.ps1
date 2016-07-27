echo "INSTALLING VLC"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\vlc-2.2.4-win64.exe" -ArgumentList '/S','/L=1051' -Wait

$target_dir = "$env:APPDATA\vlc"
robocopy $parent_dir $target_dir vlcrc
robocopy $parent_dir $target_dir vlc-qt-interface.ini 
echo "- config files copied"

Remove-Item "C:\Users\Public\Desktop\VLC media player.lnk" -ErrorAction SilentlyContinue
echo "- desktop link removed"

echo "VLC DONE"
echo "------------------------------------------------- "
