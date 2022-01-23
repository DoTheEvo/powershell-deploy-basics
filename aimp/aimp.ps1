# http://aimp.ru/index.php?do=download

echo 'AIMP v5.01, build 2358'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir aimp*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/silent /auto'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - testing if profile folder exists'

if (Test-Path -Path "$env:APPDATA\AIMP") {
    Rename-Item "$env:APPDATA\AIMP" "$env:APPDATA\AIMP.old"
}

echo ' - extracting aimp profile'
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\AIMP.zip" $parent_dir
} else {
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace("$parent_dir\AIMP.zip")
    $destinationFolder = $shellApplication.NameSpace($parent_dir)
    $destinationFolder.CopyHere($zipPackage.Items(), 20)
}
Start-Sleep -s 1

echo ' - copying aimp profile'
robocopy "$parent_dir\AIMP" "$env:APPDATA\AIMP" /E >> "$env:temp\robo_log.txt"
Remove-Item -Recurse -Force "$parent_dir\AIMP" -ErrorAction Continue >> "$env:temp\robo_log.txt"

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\AIMP.lnk' -ErrorAction SilentlyContinue

echo 'AIMP DONE'
echo '------------------------------------------------------------------------------'


