echo "INSTALLING SUMATRA"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\SumatraPDF-3.1.2-64-install.exe" -ArgumentList '/s','/register' -Wait

echo "SUMATRA DONE"
echo "------------------------------------------------------------------------------"
