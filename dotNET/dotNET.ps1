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

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

$info_NetFx3 = Dism /online /Get-featureinfo /featurename:NetFx3
if ($info_NetFx3 -contains 'State : Enabled') {
    echo ' - .NET 3.5 already enabled'
} else {

    $win_version = [System.Environment]::OSVersion.Version

    if ($win_version.Major -eq 10) {
        echo ' - win 10 detected'
        echo ' - installation in progress ...'
        DISM /Online /NoRestart /Enable-Feature /FeatureName:NetFx3 /Source:$parent_dir >> "$env:temp\robo_log.txt"
    }

    if ($win_version.Build -eq 9200 -Or $win_version.Build -eq 9600) {
        echo ' - win 8 or 8.1 detected'
        echo ' - extracting \source\sxs from installation dvd'
        if ($PSVersionTable.PSVersion.Major -ge 5) {
            Expand-Archive "$parent_dir\sxs.zip" $parent_dir
        } else {
            $shellApplication = new-object -com shell.application
            $zipPackage = $shellApplication.NameSpace("$parent_dir\sxs.zip")
            $destinationFolder = $shellApplication.NameSpace($parent_dir)
            $destinationFolder.CopyHere($zipPackage.Items(), 20)
        }
        Start-Sleep -s 1

        echo ' - installation in progress ...'
        DISM /Online /NoRestart /Enable-Feature /FeatureName:NetFx3 /Source:$parent_dir\sxs >> "$env:temp\robo_log.txt"
    }

    if ($win_version.Build -eq 7600 -Or $win_version.Build -eq 7601) {
        echo ' - shockingly, win 7 detected'
        echo ' - online installation in progress ...'
        DISM /Online /NoRestart /Enable-Feature /FeatureName:NetFx3
    }

}
echo '.NET Framework 3.5 DONE'
echo '------------------------------------------------------------------------------'
