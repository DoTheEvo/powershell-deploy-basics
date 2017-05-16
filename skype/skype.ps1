echo "INSTALLING SKYPE v7.36 (2017-05-09)"
# http://www.skype.com/go/getskype-msi
# https://support.skype.com/en/faq/FA34509/what-s-new-in-skype-for-windows-desktop

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\SkypeSetup.msi" -ArgumentList '/qn','ALLUSERS=1','TRANSFORMS=:RemoveStartup.mst' -Wait

Remove-Item "C:\Users\Public\Desktop\Skype.lnk" -ErrorAction SilentlyContinue

echo "SKYPE DONE"
echo "------------------------------------------------------------------------------"
