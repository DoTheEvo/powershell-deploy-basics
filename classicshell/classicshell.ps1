$major_vers = [Environment]::OSVersion.Version.Major
$minor_vers = [Environment]::OSVersion.Version.Minor
if ($major_vers -eq 6) {
    if ($minor_vers -eq 2 -Or $minor_vers -eq 3) {
        echo "WINDOWS 8 / 8.1 DETECTED - INSTALLING CLASSIC SHELL"
        New-Item -Path "HKLM:\Software\IvoSoft" -Name "ClassicStartMenu" -Force
        New-ItemProperty -Path "HKLM:\Software\IvoSoft\ClassicStartMenu" -name "MenuStyle_Default" -Value "Win7" -PropertyType String -Force | Out-Null
        $parent_dir = Split-Path $MyInvocation.MyCommand.Path
        Start-Process -FilePath "$parent_dir\ClassicShellSetup_4_3_0.exe" -ArgumentList "/qn ADDLOCAL=ClassicStartMenu" -Wait
        Start-Sleep -s 3
        Start-Process -FilePath "$env:programfiles\Classic Shell\ClassicStartMenu.exe" -ArgumentList "-xml","$parent_dir\settings.xml" -Wait
        echo "CLASSIC SHELL DONE"
        echo "------------------------------------------------------------------------------"
    }
}
