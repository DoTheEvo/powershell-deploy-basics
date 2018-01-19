echo "SUMATRA v3.1.2 (2016-08-14)"
# http://www.sumatrapdfreader.org/download-free-pdf-viewer.html

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo " - installation in progress ..."
Start-Process -FilePath "$parent_dir\SumatraPDF-3.1.2-64-install.exe" -ArgumentList '/s','/register' -Wait

echo "SUMATRA DONE"
echo "------------------------------------------------------------------------------"
