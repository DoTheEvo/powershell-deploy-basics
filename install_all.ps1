if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#quit if not 64bit OSVersion
if ($env:PROCESSOR_ARCHITECTURE.ToString() -ne "AMD64") {
    echo "------------------------------------------------------------------------------"
    echo "only x64 windows OS supported"
    echo "Exiting..."
    echo "------------------------------------------------------------------------------"
    cmd /c pause
    exit
}

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$programs_dirs = Get-ChildItem $parent_dir | ?{ $_.PSIsContainer } | Select-Object FullName

$programs_dirs | ForEach-Object {
    $sub_path = $_.FullName
    $script_name = Split-Path $_.FullName -Leaf
    & "$sub_path\$script_name.ps1"
    Start-Sleep -s 1
}

echo "------------------------------------------------------------------------------"

echo "*********************"
echo "      ALL DONE       "
echo "*********************"

echo "------------------------------------------------------------------------------"
cmd /c pause
