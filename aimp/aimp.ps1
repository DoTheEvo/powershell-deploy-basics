echo "INSTALLING AIMP"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\aimp_4.10.1831.exe" -ArgumentList "/silent","/auto" -Wait

echo "- copying config files"
$target_dir = "$env:APPDATA\AIMP"
robocopy "$parent_dir" "$target_dir" AIMP.ini >> "$env:temp\robo_log.txt"
robocopy "$parent_dir" "$target_dir\Skins" Default.ini >> "$env:temp\robo_log.txt"

echo "- removing desktop link"
Remove-Item "C:\Users\Public\Desktop\AIMP.lnk" -ErrorAction SilentlyContinue

echo "AIMP DONE"
echo "------------------------------------------------------------------------------"


