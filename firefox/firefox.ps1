# https://www.mozilla.org/en-US/firefox/all/#sk
# https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=sk

echo 'FIREFOX'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir firefox*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '-ms'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - testing if profile folder exists'

if (Test-Path -Path "$env:APPDATA\Mozilla") {
    echo ' - profile folder already exists, renaming'
    Rename-Item "$env:APPDATA\Mozilla" "$env:APPDATA\Mozilla.olddd"
}

echo ' - extracting user profile'
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\Mozilla.zip" $parent_dir
} else {
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace("$parent_dir\Mozilla.zip")
    $destinationFolder = $shellApplication.NameSpace($parent_dir)
    $destinationFolder.CopyHere($zipPackage.Items(), 20)
}
Start-Sleep -s 1

echo ' - copying user profile'
robocopy "$parent_dir\Mozilla" "$env:APPDATA\Mozilla" /E >> "$env:temp\robo_log.txt"

Remove-Item -Recurse -Force "$parent_dir\Mozilla" -ErrorAction Continue >> "$env:temp\robo_log.txt"

echo 'FIREFOX DONE'
echo '------------------------------------------------------------------------------'
