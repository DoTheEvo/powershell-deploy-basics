echo "INSTALLING IRFANVIEW v4.42 (2016-03-10)"
# http://www.irfanview.com/

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\iview442_x64_setup.exe" -ArgumentList '/silent','/group=1','/allusers=1','/assoc=1','/ini=%APPDATA%\irfanview' -Wait

echo "- copying config files"
$target_dir = "$env:ProgramW6432\IrfanView\Languages"
robocopy $parent_dir $target_dir IP_Slovak.lng >> "$env:temp\robo_log.txt"
robocopy $parent_dir $target_dir Slovak.dll >> "$env:temp\robo_log.txt"

$target_dir = "$env:APPDATA\irfanview"
robocopy $parent_dir $target_dir i_view64.ini >> "$env:temp\robo_log.txt"

echo "IRFANVIEW DONE"
echo "------------------------------------------------------------------------------"

