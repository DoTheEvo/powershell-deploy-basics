echo "INSTALLING IRFANVIEW"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\iview442_x64_setup.exe" -ArgumentList '/silent','/group=1','/allusers=1','/assoc=1','/ini=%APPDATA%\irfanview' -Wait

echo "- copying config files"
$hush = @("/nfl","/ndl","/njh","/nc","/ns","/np")
$target_dir = "$env:ProgramW6432\IrfanView\Languages"
robocopy $parent_dir $target_dir IP_Slovak.lng $hush
robocopy $parent_dir $target_dir Slovak.dll $hush

$target_dir = "$env:APPDATA\irfanview"
robocopy $parent_dir $target_dir i_view64.ini $hush

echo "IRFANVIEW DONE"
echo "------------------------------------------------------------------------------"

