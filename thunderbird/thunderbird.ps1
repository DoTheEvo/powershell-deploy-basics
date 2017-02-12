echo "INSTALLING THUNDERBIRD v45.6.0 (2017-02-07)"
# https://www.mozilla.org/en-US/thunderbird/all/#sk
# https://www.mozilla.org/en-US/thunderbird/releases/

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Thunderbird Setup 45.7.1.exe" -ArgumentList '-ms' -Wait

Remove-Item "C:\Users\Public\Desktop\Mozilla Thunderbird.lnk" -ErrorAction SilentlyContinue

echo "THUNDERBIRD DONE"
echo "------------------------------------------------------------------------------"
