echo 'WALLPAPERS'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - copying wallpapers in to pictures...'
robocopy "$parent_dir\wallpapers" "$env:USERPROFILE\Pictures\wallpapers" /E >> "$env:temp\robo_log.txt"



echo 'WALLPAPERS DONE'
echo '------------------------------------------------------------------------------'


