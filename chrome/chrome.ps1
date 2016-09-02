echo "INSTALLING CHROME"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\ChromeStandaloneSetup64.exe" -ArgumentList '/silent','/install' -Wait

echo "- extracting user profile zip file"
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\User Data.zip" "$parent_dir"
} else {
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace("$parent_dir\User Data.zip")
    $destinationFolder = $shellApplication.NameSpace($parent_dir)
    $destinationFolder.CopyHere($zipPackage.Items(), 20)
}
Start-Sleep -s 1

echo "- copying user profile"
$hush = @("/nfl","/ndl","/njh","/nc","/ns","/np")
$target_dir = "$env:LOCALAPPDATA\Google\Chrome\User Data"
robocopy "$parent_dir\User Data" $target_dir /E $hush

Remove-Item -Recurse -Force "$parent_dir\User Data" -ErrorAction SilentlyContinue

echo "CHROME DONE"
echo "------------------------------------------------------------------------------"
