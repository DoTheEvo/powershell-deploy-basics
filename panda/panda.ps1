echo "INSTALLING PANDA"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Panda Free Antivirus 16.1.3\setup.exe" -ArgumentList '-s', '-sp"/quiet"' -Wait

Remove-Item "C:\Users\Public\Desktop\Panda Free Antivirus.lnk" -ErrorAction SilentlyContinue

echo "PANDA DONE"
echo "------------------------------------------------- "
