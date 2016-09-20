if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$programs_dirs = Get-ChildItem $parent_dir | ?{ $_.PSIsContainer } | Select-Object FullName

$programs_dirs | ForEach-Object {
    $sub_path = $_.FullName
    $script_name = Split-Path $_.FullName -Leaf
    & "$sub_path\$script_name.ps1"
    Start-Sleep -s 1
}

# IF WIN 10, REMOVE PREINSTALLED CRAPWARE
$win_vers = [Environment]::OSVersion.Version.Major
if ($win_vers -ge 10) {
    & "$parent_dir\win10_apps_removal.ps1"
}

# TWEAKS
& "$parent_dir\tweaks.ps1"

# COUNT ERROR OCCURANCIES IN ROBOCOPY LOG FILE
$robo = "${env:temp}\robo_log.txt"
If (Test-Path $robo){
    $FileContent = Get-Content $robo
    $Matches = Select-String -InputObject $FileContent -Pattern "error" -AllMatches
    $Total = $Matches.Matches.Count
    if ($Total -eq $null){ $Total = 0}
} Else {
    $Total = "No log file"
}

echo "Robocopy Error Count: $Total"
echo "------------------------------------------------------------------------------"

echo "*********************"
echo "      ALL DONE      "
echo "*********************"

echo "------------------------------------------------------------------------------"
cmd /c pause
