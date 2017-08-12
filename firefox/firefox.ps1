echo "INSTALLING FIREFOX 55.0.1 (2017-08-10)"
# https://www.mozilla.org/en-US/firefox/all/#sk
# https://www.mozilla.org/en-US/firefox/releases/

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Firefox Setup 55.0.1.exe" -ArgumentList '-ms' -Wait

echo "- extracting user profile"
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\Mozilla.zip" "$parent_dir"
} else {
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace("$parent_dir\Mozilla.zip")
    $destinationFolder = $shellApplication.NameSpace($parent_dir)
    $destinationFolder.CopyHere($zipPackage.Items(), 20)
}
Start-Sleep -s 1

echo "- copying user profile"
robocopy "$parent_dir\Mozilla" "$env:APPDATA\Mozilla" /E >> "$env:temp\robo_log.txt"

Remove-Item -Recurse -Force "$parent_dir\Mozilla" -ErrorAction SilentlyContinue

echo "FIREFOX DONE"
echo "------------------------------------------------------------------------------"
