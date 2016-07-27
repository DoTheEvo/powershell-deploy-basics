echo "INSTALLING SUMATRA"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\SumatraPDF-3.1.1-install.exe" -ArgumentList '/s','/register' -Wait

echo "SUMATRA DONE"
echo "------------------------------------------------- "
