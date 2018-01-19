echo "SKYPE 7.40.0.104 (2017-10-30)"
# http://www.skype.com/go/getskype-msi
# https://support.skype.com/en/faq/FA34509/what-s-new-in-skype-for-windows-desktop

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo " - installation in progress ..."
Start-Process -FilePath "$parent_dir\SkypeSetup.msi" -ArgumentList '/qn','ALLUSERS=1','TRANSFORMS=:RemoveStartup.mst' -Wait
Start-Sleep -s 3

echo " - installing fix for Skypem - Visual C++ 2015 Redistributable Update 3 x86 ..."
Start-Process -FilePath "$parent_dir\vc_redist.x86.exe" -ArgumentList '/install','/passive','/quiet', '/norestart' -Wait

echo " - removing desktop link"
Remove-Item "C:\Users\Public\Desktop\Skype.lnk" -ErrorAction SilentlyContinue

echo "SKYPE DONE"
echo "------------------------------------------------------------------------------"
