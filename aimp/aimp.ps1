echo "INSTALLING AIMP v4.13 build 1897 (2017-06-25)"
# http://aimp.ru/index.php?do=download

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\aimp_4.13.1897.exe" -ArgumentList "/silent","/auto" -Wait

echo "- copying config files"
$target_dir = "$env:APPDATA\AIMP"
robocopy "$parent_dir" "$target_dir" AIMP.ini >> "$env:temp\robo_log.txt"
robocopy "$parent_dir" "$target_dir\Skins" Default.ini >> "$env:temp\robo_log.txt"

echo "- removing desktop link"
Remove-Item "C:\Users\Public\Desktop\AIMP.lnk" -ErrorAction SilentlyContinue

echo "AIMP DONE"
echo "------------------------------------------------------------------------------"


