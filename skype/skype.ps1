echo "INSTALLING SKYPE v7.27 (2016-08-18)"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\SkypeSetup.msi" -ArgumentList '/qn','ALLUSERS=1','TRANSFORMS=:RemoveStartup.mst' -Wait

Remove-Item "C:\Users\Public\Desktop\Skype.lnk" -ErrorAction SilentlyContinue

echo "SKYPE DONE"
echo "------------------------------------------------------------------------------"
