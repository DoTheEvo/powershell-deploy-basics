echo "INSTALLING PANDA"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo "- extracting the zip file"

# if ($PSVersionTable.PSVersion.Major -ge 5) {
#     Expand-Archive "$parent_dir\panda.zip" "$parent_dir"
# } else {
#     $shellApplication = new-object -com shell.application
#     $zipPackage = $shellApplication.NameSpace("$parent_dir\panda.zip")
#     $destinationFolder = $shellApplication.NameSpace($parent_dir)
#     $destinationFolder.CopyHere($zipPackage.Items(), 20)
# }

# Start-Sleep -s 1

# Start-Process -FilePath "$parent_dir\panda\setup.exe" -ArgumentList '/quiet' -Wait
# Remove-Item "C:\Users\Public\Desktop\Panda Free Antivirus.lnk" -ErrorAction SilentlyContinue

# Remove-Item -Recurse -Force "$parent_dir\Panda Free Antivirus 17.0.1" -ErrorAction SilentlyContinue

echo "PANDA DONE"
echo "------------------------------------------------------------------------------"
