echo "INSTALLING FIREFOX"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Firefox Setup 48.0.2.exe" -ArgumentList '-ms' -Wait

echo "- extracting user profile"
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\Firefox.zip" "$parent_dir"
} else {
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace("$parent_dir\Firefox.zip")
    $destinationFolder = $shellApplication.NameSpace($parent_dir)
    $destinationFolder.CopyHere($zipPackage.Items(), 20)
}
Start-Sleep -s 1

echo "- copying user profile"
$target_dir = "$env:APPDATA\Mozilla\Firefox"
robocopy "$parent_dir\Firefox" $target_dir /E 1>> "$env:temp\robo_log.txt"

Remove-Item -Recurse -Force "$parent_dir\Firefox" -ErrorAction SilentlyContinue

echo "FIREFOX DONE"
echo "------------------------------------------------------------------------------"
