# http://www.classicshell.net/downloads/

echo 'CLASSIC SHELL v4.3.1 (2017-08)'

$major_vers = [Environment]::OSVersion.Version.Major
$minor_vers = [Environment]::OSVersion.Version.Minor

$win_version = [System.Environment]::OSVersion.Version
if ($win_version.Build -eq 9200 -Or $win_version.Build -eq 9600) {

    echo ' - editing registry'
    New-Item -Path 'HKLM:\Software\IvoSoft' -Name 'ClassicStartMenu' -Force >> "$env:temp\robo_log.txt"
    New-ItemProperty -Path 'HKLM:\Software\IvoSoft\ClassicStartMenu' -name 'MenuStyle_Default' -Value 'Win7' -PropertyType String -Force >> "$env:temp\robo_log.txt"

    $parent_dir = Split-Path $MyInvocation.MyCommand.Path

    echo ' - installation in progress ...'
    Start-Process -FilePath "$parent_dir\ClassicShellSetup_4_3_1.exe" -ArgumentList '/qn ADDLOCAL=ClassicStartMenu' -Wait
    Start-Sleep -s 3

    echo ' - importing settings using xml file'
    Start-Process -FilePath "$env:programfiles\Classic Shell\ClassicStartMenu.exe" -ArgumentList '-xml',"$parent_dir\settings.xml" -Wait

} else {

    echo ' - not windows 8 or 8.1, skipping classic shell'

}

echo 'CLASSIC SHELL DONE'
echo '------------------------------------------------------------------------------'


