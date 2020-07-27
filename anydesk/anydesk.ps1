# https://anydesk.com/platforms/windows

echo 'ANYDESK v6.0.5'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir anydesk*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, TERMINATING INSTALLATION"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = "--install `"${env:ProgramFiles}\AnyDesk`" --silent --remove-first --create-shortcuts"
Start-Process -FilePath "$parent_dir\AnyDesk.exe" -ArgumentList $arguments -Wait

echo ' - copying config file'
$targetdirectory = "$env:APPDATA\AnyDesk"
robocopy $parent_dir $targetdirectory user.conf >> "$env:temp\robo_log.txt"

Set-Service 'AnyDesk' -startupType manual
echo ' - anydesk service set to manual startup'

echo 'ANYDESK DONE'
echo '------------------------------------------------------------------------------'
