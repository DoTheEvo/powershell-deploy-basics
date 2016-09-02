echo "INSTALLING SKYPE"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\SkypeSetup.msi" -ArgumentList '/qn','ALLUSERS=1','TRANSFORMS=:RemoveStartup.mst' -Wait

Remove-Item "C:\Users\Public\Desktop\Skype.lnk" -ErrorAction SilentlyContinue

echo "SKYPE DONE"
echo "------------------------------------------------------------------------------"
