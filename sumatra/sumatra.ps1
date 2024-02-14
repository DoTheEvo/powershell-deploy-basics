# http://www.sumatrapdfreader.org/download-free-pdf-viewer.html

echo 'SUMATRA v3.4.6'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir sumatra*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = '/s /register'
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait

echo ' - copying config files'
$target_dir = "$env:LOCALAPPDATA\SumatraPDF"
robocopy $parent_dir $target_dir SumatraPDF-settings.txt >> "$env:temp\robo_log.txt"

echo ' - removing desktop link'
Remove-Item "$home\Desktop\SumatraPDF.lnk" -ErrorAction SilentlyContinue

echo 'SUMATRA DONE'
echo '------------------------------------------------------------------------------'
