if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$programs_dirs = Get-ChildItem $parent_dir | ?{ $_.PSIsContainer } | Select-Object FullName

$programs_dirs | ForEach-Object {
    $sub_path = $_.FullName
    $script_name = Split-Path $_.FullName -Leaf
    & "$sub_path\$script_name.ps1"
}

$win_vers = [Environment]::OSVersion.Version.Major
if ($win_vers -ge 10) {
    echo "Win10 - removing preinstalled apps"
    & "$parent_dir\win10.ps1"
}

echo "ALL DONE"
echo "ALL DONE"
echo "ALL DONE"
echo "Panda - turn off panda news, turn off usb scan recommendation"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
