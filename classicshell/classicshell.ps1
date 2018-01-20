# http://www.classicshell.net/downloads/

$major_vers = [Environment]::OSVersion.Version.Major
$minor_vers = [Environment]::OSVersion.Version.Minor
if ($major_vers -eq 6) {
    if ($minor_vers -eq 2 -Or $minor_vers -eq 3) {

        echo 'CLASSIC SHELL v4.3.1 (2017-08)'

        New-Item -Path 'HKLM:\Software\IvoSoft' -Name 'ClassicStartMenu' -Force >> "$env:temp\robo_log.txt"
        New-ItemProperty -Path 'HKLM:\Software\IvoSoft\ClassicStartMenu' -name 'MenuStyle_Default' -Value 'Win7' -PropertyType String -Force >> "$env:temp\robo_log.txt"

        $parent_dir = Split-Path $MyInvocation.MyCommand.Path

        echo ' - installation in progress ...'
        Start-Process -FilePath "$parent_dir\ClassicShellSetup_4_3_1.exe" -ArgumentList '/qn ADDLOCAL=ClassicStartMenu' -Wait
        Start-Sleep -s 3
        Start-Process -FilePath "$env:programfiles\Classic Shell\ClassicStartMenu.exe" -ArgumentList '-xml',"$parent_dir\settings.xml" -Wait
        echo 'CLASSIC SHELL DONE'
        echo '------------------------------------------------------------------------------'

    }
}
