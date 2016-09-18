echo "INSTALLING THUNDERBIRD v45.3.0 (2016-08-30)"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Thunderbird Setup 45.3.0.exe" -ArgumentList '-ms' -Wait

Remove-Item "C:\Users\Public\Desktop\Mozilla Thunderbird.lnk" -ErrorAction SilentlyContinue

echo "THUNDERBIRD DONE"
echo "------------------------------------------------------------------------------"
