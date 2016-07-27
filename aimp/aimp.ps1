echo "INSTALLING AIMP"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\aimp_4.02.1725.exe" -ArgumentList '/silent','/auto' -Wait

$targetdirectory = "$env:APPDATA\AIMP"
robocopy "$parent_dir" "$targetdirectory" AIMP.ini
robocopy "$parent_dir" "$targetdirectory\Skins" Default.ini
echo "- ini files copied"

Remove-Item "C:\Users\Public\Desktop\AIMP.lnk" -ErrorAction SilentlyContinue

echo "AIMP DONE"
echo "------------------------------------------------- "
