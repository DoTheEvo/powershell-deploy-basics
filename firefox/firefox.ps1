echo "FIREFOX 57.0.4 (2018-01-04)"
# https://www.mozilla.org/en-US/firefox/all/#sk
# https://www.mozilla.org/en-US/firefox/releases/

echo " - installation in progress ..."
$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Firefox Setup 57.0.4.exe" -ArgumentList '-ms' -Wait

echo " - extracting user profile"
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\Mozilla.zip" "$parent_dir"
} else {
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace("$parent_dir\Mozilla.zip")
    $destinationFolder = $shellApplication.NameSpace($parent_dir)
    $destinationFolder.CopyHere($zipPackage.Items(), 20)
}
Start-Sleep -s 1

echo " - copying user profile"
robocopy "$parent_dir\Mozilla" "$env:APPDATA\Mozilla" /E >> "$env:temp\robo_log.txt"

Remove-Item -Recurse -Force "$parent_dir\Mozilla" -ErrorAction SilentlyContinue

echo "FIREFOX DONE"
echo "------------------------------------------------------------------------------"
