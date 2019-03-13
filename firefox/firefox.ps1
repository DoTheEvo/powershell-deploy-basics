# https://www.mozilla.org/en-US/firefox/all/#sk
# https://www.mozilla.org/en-US/firefox/releases/

echo 'FIREFOX 65.0.2 (2019-02-28)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\Firefox Setup 65.0.2.exe" -ArgumentList '-ms' -Wait

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
