# https://sourceforge.net/projects/mpv-player-windows/files/64bit/

echo 'MPV'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - copying the mpv folder in to program files'
robocopy "$parent_dir\mpv" "$env:programfiles\mpv" /E >> "$env:temp\robo_log.txt"

echo ' - copying the config folder'
robocopy "$parent_dir\portable_config" "$env:programfiles\mpv\portable_config" /E >> "$env:temp\robo_log.txt"

echo ' - running bat file to associate video files ...'
Start-Process -FilePath "$env:programfiles\mpv\installer\mpv-install.bat" -ArgumentList '/u' -Wait

# subtitles download with subliminal stopped working since opensubtitles changed API
# so no point anymore

# echo ' - install chocolatey '
# Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# echo ' - install python and ffmpeg using choco'
# choco upgrade python311 -y
# choco upgrade ffmpeg -y

# echo ' - refresh env variables'
# $Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# echo ' - install subliminal using pythons pip'
# pip install subliminal

echo 'MPV DONE'
echo '------------------------------------------------------------------------------'
