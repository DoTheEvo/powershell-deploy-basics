echo "INSTALLING THUNDERBIRD"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Thunderbird Setup 45.2.0.exe" -ArgumentList '-ms' -Wait

Remove-Item "C:\Users\Public\Desktop\Mozilla Thunderbird.lnk" -ErrorAction SilentlyContinue

echo "THUNDERBIRD DONE"
echo "------------------------------------------------------------------------------"
