echo "INSTALLING THUNDERBIRD v52.2.1 (2017-06-23)"
# https://www.mozilla.org/en-US/thunderbird/all/#sk
# https://www.mozilla.org/en-US/thunderbird/releases/

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\Thunderbird Setup 52.2.1.exe" -ArgumentList '-ms' -Wait

Remove-Item "C:\Users\Public\Desktop\Mozilla Thunderbird.lnk" -ErrorAction SilentlyContinue

echo "THUNDERBIRD DONE"
echo "------------------------------------------------------------------------------"
