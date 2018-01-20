# https://www.oo-software.com/en/shutup10/update

$major_vers = [Environment]::OSVersion.Version.Major

if ($major_vers -eq 10) {
    echo 'WINDOWS 10 DETECTED - RUNNING ShutUp10 v1.6.1395 (2017-12-21)'
    echo ' - apply it manually'

    $parent_dir = Split-Path $MyInvocation.MyCommand.Path
    Start-Process -FilePath "$parent_dir\OOSU10.exe"

    echo 'WINDOWS 10 DONE'
    echo '------------------------------------------------------------------------------'
}
