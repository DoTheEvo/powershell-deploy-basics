# https://www.mozilla.org/en-US/thunderbird/all/#sk
# https://www.mozilla.org/en-US/thunderbird/releases/

echo 'THUNDERBIRD v52.7.0 (2018-03-23)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\Thunderbird Setup 52.7.0.exe" -ArgumentList '-ms' -Wait

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\Mozilla Thunderbird.lnk' -ErrorAction SilentlyContinue

echo 'THUNDERBIRD DONE'
echo '------------------------------------------------------------------------------'
