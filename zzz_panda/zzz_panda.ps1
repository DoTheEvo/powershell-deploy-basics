echo "INSTALLING PANDA"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
#Start-Process -FilePath "$parent_dir\FREEAV.exe" -ArgumentList '-s', '-sp"/quiet"' -Wait

Start-Process -FilePath "$parent_dir\FREEAV.exe"
#Remove-Item "C:\Users\Public\Desktop\Panda Free Antivirus.lnk" -ErrorAction SilentlyContinue

echo "PANDA DONE"
echo "------------------------------------------------------------------------------"
