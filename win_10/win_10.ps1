
# IF WIN 10, REMOVE PREINSTALLED CRAPWARE
$major_vers = [Environment]::OSVersion.Version.Major
# https://www.oo-software.com/en/shutup10/update

if ($major_vers -eq 10) {
    echo "WINDOWS 10 DETECTED - RUNNING ShutUp10 v1.5.1390 (2017-05-09)"
    echo "- APPLY IT MANUALLY"

    $parent_dir = Split-Path $MyInvocation.MyCommand.Path
    Start-Process -FilePath "$parent_dir\OOSU10.exe"

    echo "------------------------------------------------------------------------------"
}
