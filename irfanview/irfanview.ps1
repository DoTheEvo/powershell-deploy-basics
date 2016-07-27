echo "INSTALLING IRFANVIEW"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\iview442_x64_setup.exe" -ArgumentList '/silent','/group=1','/allusers=1','/assoc=1','/ini=%APPDATA%\irfanview' -Wait

$target_dir = "$env:ProgramW6432\IrfanView\Languages"
robocopy $parent_dir $target_dir IP_Slovak.lng
robocopy $parent_dir $target_dir Slovak.dll
echo "- language files copied"

$target_dir = "$env:APPDATA\irfanview"
robocopy $parent_dir $target_dir i_view64.ini
echo "- ini file copied"

echo "IRFANVIEW DONE"
echo "------------------------------------------------- "
