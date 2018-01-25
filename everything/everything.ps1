# https://www.voidtools.com/downloads/

echo 'EVERYTHING v1.4.1.877 (2017-06-07)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\Everything-1.4.1.877.x64-Setup" -ArgumentList '/S' -Wait

$target_exe = "$env:ProgramFiles\Everything\Everything.exe"
Start-Process -FilePath $target_exe -ArgumentList '-disable-run-as-admin','-install-service' -Wait

echo ' - copying config files'
$target_dir = "$env:APPDATA\Everything"
robocopy $parent_dir $target_dir Everything.ini >> "$env:temp\robo_log.txt"

echo 'EVERYTHING DONE'
echo '------------------------------------------------------------------------------'


