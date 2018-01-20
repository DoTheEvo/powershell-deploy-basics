echo '.NET Framework 4.7.1 (2018-01-19)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

# check NET framework version
$NET_info = Get-ItemProperty -Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full' -ErrorAction SilentlyContinue
echo " - current version: $($NET_info.Version)"
if ($NET_info.Release -lt 461308) {
    echo ' - installation in progress ...'
    Start-Process -FilePath "$parent_dir\NDP471-KB4033342-x86-x64-AllOS-ENU.exe" -ArgumentList '/q','/norestart' -Wait
} else {
    ' - NET framework is up to date'
}

echo '.NET Framework 4.7.1 DONE'
echo '------------------------------------------------------------------------------'

echo '.NET Framework 3.5 (2017-12-01)'

$info_NetFx3 = Dism /online /Get-featureinfo /featurename:NetFx3

if ($info_NetFx3 -contains 'State : Enabled') {
    echo ' - .NET 3.5 already enabled'
} else {
    echo ' - installation in progress ...'
    DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /NoRestart /Source:$parent_dir /LimitAccess >> "$env:temp\robo_log.txt"
}
echo '.NET Framework 3.5 DONE'
echo '------------------------------------------------------------------------------'
