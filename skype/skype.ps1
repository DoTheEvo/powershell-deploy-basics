echo "INSTALLING SKYPE v7.28 (2016-09-26)"
# http://www.skype.com/go/getskype-msi

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\SkypeSetup.msi" -ArgumentList '/qn','ALLUSERS=1','TRANSFORMS=:RemoveStartup.mst' -Wait

Remove-Item "C:\Users\Public\Desktop\Skype.lnk" -ErrorAction SilentlyContinue

echo "SKYPE DONE"
echo "------------------------------------------------------------------------------"
