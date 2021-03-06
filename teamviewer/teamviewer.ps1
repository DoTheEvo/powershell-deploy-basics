# https://www.teamviewer.com/en/info/quicksupport/

echo 'TEAMVIEWER'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - placing the exe file'

$target_dir = "$env:programfiles"
robocopy $parent_dir $target_dir TeamViewerQS.exe >> "$env:temp\robo_log.txt"

echo 'TEAMVIEWER DONE'
echo '------------------------------------------------------------------------------'
