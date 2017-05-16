echo "INSTALLING TEAMVIEWER v9 (2013)"
# http://www.sumatrapdfreader.org/download-free-pdf-viewer.html

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo "- copying exe file"

$target_dir = "$env:programfiles"
robocopy "$parent_dir" "$target_dir" teamviewer.exe >> "$env:temp\robo_log.txt"

echo "TEAMVIEWER DONE"
echo "------------------------------------------------------------------------------"
