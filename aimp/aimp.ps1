echo "INSTALLING AIMP"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\aimp_4.10.1831.exe" -ArgumentList "/silent","/auto" -Wait

echo "- copying config files"
$hush = @("/nfl","/ndl","/njh","/nc","/ns","/np")
$targetdirectory = "$env:APPDATA\AIMP"
robocopy "$parent_dir" "$targetdirectory" AIMP.ini $hush
robocopy "$parent_dir" "$targetdirectory\Skins" Default.ini $hush

Remove-Item "C:\Users\Public\Desktop\AIMP.lnk" -ErrorAction SilentlyContinue

echo "AIMP DONE"
echo "------------------------------------------------------------------------------"
