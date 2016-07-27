echo "INSTALLING THUNDERBIRD"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Thunderbird Setup 45.2.0.exe" -ArgumentList '-ms' -Wait

Remove-Item "C:\Users\Public\Desktop\Mozilla Thunderbird.lnk" -ErrorAction SilentlyContinue

echo "THUNDERBIRD DONE"
echo "------------------------------------------------- "
