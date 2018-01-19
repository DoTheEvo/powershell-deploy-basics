# Windows Management Framework 5.1 update (powershell)

echo "WINDOWS MANAGEMENT FRAMEWORK 5.1 (2016-08-02)"
echo " - windows version: $([System.Environment]::OSVersion.Version)"
echo " - architecture: $($env:PROCESSOR_ARCHITECTURE.ToString())"
echo " - .NET framework version: $((Get-ItemProperty -Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full' -ErrorAction SilentlyContinue).Version)"
echo " - powershell version: $($PSVersionTable.PSVersion.ToString())"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

#quit if not 64bit OSVersion
if ($env:PROCESSOR_ARCHITECTURE.ToString() -ne "AMD64") {
    exit
}

#exit if already WMF version 5.1 or higher
if ([version]$PSVersionTable.PSVersion -ge [version]"5.1") {
    echo " - WMF UPDATE NOT NEEDED"
    echo " ------------------------------------------------------------------------------"
    exit
}

#exit if not vista, win7, win8, win8.1
$windows_build_version = [System.Environment]::OSVersion.Version
if($windows_build_version.Major -ne 6) {
    exit
}

#exit if vista
$desired_minor_vers = 1,2,3
if(-not $desired_minor_vers -contains $windows_build_version.Minor) {
    exit
}

echo " - waiting 10 sec for user input ..."
$a = new-object -comobject wscript.shell
#https://msdn.microsoft.com/en-us/library/x83z1d9f(v=vs.84).aspx
#intButton = object.Popup(strText,[nSecondsToWait],[strTitle],[nType])
$answer = $a.popup("Update WMF? THIS WILL RESTART THE PC WITHIN FEW MINUTES!!!",10,"powershell-deploy-basics",4)

if ($answer -eq 6) {
    #check .net framework version, if less than 4.5 install framwework
    $net_version = (Get-ItemProperty -Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full' -ErrorAction SilentlyContinue).Version
    if ($net_version -lt [version]"4.5") {
        echo " - installing .NET framework 4.5.1 ..."
        Start-Process -FilePath "$parent_dir\NDP471-KB4033342-x86-x64-AllOS-ENU.exe" -ArgumentList '/q','/norestart' -Wait
    }

    #install WMF 5.1 for windows 7
    echo " - installing WMF 5.1 ..."
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
echo " ------------------------------------------------------------------------------"




