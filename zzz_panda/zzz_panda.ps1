echo "INSTALLING PANDA v17.0.1 (~2016-08-19)"
# https://www.google.com/search?q=panda+offline+installer&ie=utf-8&oe=utf-8

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
#Start-Process -FilePath "$parent_dir\FREEAV.exe" -ArgumentList '-s', '-sp"/quiet"' -Wait

Start-Process -FilePath "$parent_dir\FREEAV.exe"
#Remove-Item "C:\Users\Public\Desktop\Panda Free Antivirus.lnk" -ErrorAction SilentlyContinue

echo "PANDA DONE"
echo "- finish the installation manually "
echo "------------------------------------------------------------------------------"
