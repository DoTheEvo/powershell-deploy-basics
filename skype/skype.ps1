# http://www.skype.com/go/getskype-msi
# https://support.skype.com/en/faq/FA34509/what-s-new-in-skype-for-windows-desktop

echo 'SKYPE 8.45.0.41 (2019-05-14)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\Skype-8.45.0.41.msi" -ArgumentList '/qn','ALLUSERS=1','TRANSFORMS=:RemoveStartup.mst' -Wait
# Start-Sleep -s 3

# echo ' - installing fix, Visual C++ 2015 Redistr Upd 3 x86 ...'
# Start-Process -FilePath "$parent_dir\vc_redist.x86.exe" -ArgumentList '/install','/passive','/quiet', '/norestart' -Wait

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\Skype.lnk' -ErrorAction SilentlyContinue

echo 'SKYPE DONE'
echo '------------------------------------------------------------------------------'
