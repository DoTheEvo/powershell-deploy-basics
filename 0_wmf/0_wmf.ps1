# Windows Management Framework 5.1 update (powershell)

echo " - - - - - - - - - - - - - - - -"
echo "Windows version: $([System.Environment]::OSVersion.Version)"
echo "Architecture: $($env:PROCESSOR_ARCHITECTURE.ToString())"
echo ".NET framework version: $((Get-ItemProperty -Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full' -ErrorAction SilentlyContinue).Version)"
echo "PowerShell version: $($PSVersionTable.PSVersion.ToString())"
echo " - - - - - - - - - - - - - - - -"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

#quit if not 64bit OSVersion
if ($env:PROCESSOR_ARCHITECTURE.ToString() -ne "AMD64") {
    echo "only x64 windows OS supported"
    echo "Exiting..."
    echo "------------------------------------------------------------------------------"
    exit
}

#exit if already WMF version 5.1 or higher
if ([version]$PSVersionTable.PSVersion -ge [version]"5.1") {
    echo "WMF already at 5.1 or higher version"
    echo "Exiting..."
    echo "------------------------------------------------------------------------------"
    exit
}

#exit if not vista, win7, win8, win8.1
$windows_build_version = [System.Environment]::OSVersion.Version
if($windows_build_version.Major -ne 6) {
    echo "Windows 10 or Windows XP detected"
    echo "Exiting..."
    echo "------------------------------------------------------------------------------"
    exit
}

#exit if vista
$desired_minor_vers = 1,2,3
if(-not $desired_minor_vers -contains $windows_build_version.Minor) {
    echo "Windows Vista detected"
    echo "Exiting..."
    echo "------------------------------------------------------------------------------"
}

echo "Waiting 5 sec for user input..."
$a = new-object -comobject wscript.shell
#https://msdn.microsoft.com/en-us/library/x83z1d9f(v=vs.84).aspx
#intButton = object.Popup(strText,[nSecondsToWait],[strTitle],[nType])
$answer = $a.popup("Update WMF?",5,"powershell-deploy-basics",4)

if ($answer -eq 6) {
    echo "INSTALLING WMF 5.1(2017-01-31)"
    #check .net framework version, if less than 4.5 install framwework
    $net_version = (Get-ItemProperty -Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full' -ErrorAction SilentlyContinue).Version
    if ($net_version -lt [version]"4.5") {
        echo "Installing .NET framework 4.5.1"
        echo "Wait please..."
        Start-Process -FilePath "$parent_dir\NDP451-KB2858728-x86-x64-AllOS-ENU.exe" -ArgumentList '/q','/norestart' -Wait
    }

    #install WMF 5.1 for windows 7
    if ($windows_build_version.Minor -eq 1) {
        Start-Process -FilePath "$parent_dir\Win7AndW2K8R2-KB3191566-x64.msu" -ArgumentList "/quiet" -Wait
    #install WMF 5.1 for windows 8 or 8.1
    } ElseIf ($windows_build_version.Minor -eq 2 -Or $windows_build_version.Minor -eq 3) {
        Start-Process -FilePath "$parent_dir\Win8.1AndW2K12R2-KB3191564-x64.msu" -ArgumentList "/quiet" -Wait
    }
    echo "WMF 5.1 DONE"
} else {
echo "WMF 5.1 IGNORED"
}
echo "------------------------------------------------------------------------------"




