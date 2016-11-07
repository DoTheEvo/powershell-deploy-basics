echo "INSTALLING CHROME v54.0.2840.87 (2016-11-01)"
# https://www.google.com/intl/sk/chrome/browser/desktop/index.html?standalone=1

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$target_dir = "${env:ProgramFiles(x86)}\Google\Chrome\Application"
robocopy "$parent_dir" "$target_dir" master_preferences >> "$env:temp\robo_log.txt"
echo "- master_preferences file copied"

Start-Process -FilePath "$parent_dir\ChromeStandaloneSetup64.exe" -ArgumentList '/silent','/install' -Wait

echo "CHROME DONE"
echo "------------------------------------------------------------------------------"
