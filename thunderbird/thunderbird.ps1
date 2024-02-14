# https://www.mozilla.org/en-US/thunderbird/all/#sk

echo 'THUNDERBIRD'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir thunderbird*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '-ms'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\Thunderbird.lnk' -ErrorAction SilentlyContinue

echo 'THUNDERBIRD DONE'
echo '------------------------------------------------------------------------------'
