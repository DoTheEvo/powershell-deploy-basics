#Get-AppxPackage | Select-Object -Property Name
echo "WINDOWS 10 DETECTED"

echo "- removing bloat"
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *windowscamera* | Remove-AppxPackage
Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *zunevideo* | Remove-AppxPackage
Get-AppxPackage *zunemusic* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-AppxPackage *bingfinance* | Remove-AppxPackage
Get-AppxPackage *zunevideo* | Remove-AppxPackage
Get-AppxPackage *bingnews* | Remove-AppxPackage
Get-AppxPackage *onenote* | Remove-AppxPackage
Get-AppxPackage *people* | Remove-AppxPackage
Get-AppxPackage *windowsphone* | Remove-AppxPackage
Get-AppxPackage *photos* | Remove-AppxPackage
Get-AppxPackage *bingsports* | Remove-AppxPackage
Get-AppxPackage *xboxapp* | Remove-AppxPackage
Get-AppxPackage *Sway* | Remove-AppxPackage
Get-AppxPackage *messaging* | Remove-AppxPackage
Get-AppxPackage *connectivitystore* | Remove-AppxPackage
Get-AppxPackage *appconnector* | Remove-AppxPackage
Get-AppxPackage *tuneinradio* | Remove-AppxPackage
Get-AppxPackage *bingnews* | Remove-AppxPackage
Get-AppxPackage *windowsfeedbackhub* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *netflix* | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage *oneconnect* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage

function set_or_create_reg($RegKey, $key, $type, $value){
    if (-Not(Test-Path "$RegKey")) {
        New-Item -Path "$($RegKey.TrimEnd($RegKey.Split('\')[-1]))" -Name "$($RegKey.Split('\')[-1])" -Force | Out-Null
    }
    Set-ItemProperty -Path "$RegKey" -Name "$key" -Type "$type" -Value "$value"
}

echo "- turning off p2p windows updates"
set_or_create_reg "HKLM:SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" "DODownloadMode" "Dword" 0
echo "- turning off ads in startmenu"
set_or_create_reg "HKLM:SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" "Dword" 1

echo "- starting SHUTUP10 v1.4.1383 (2016-08-16)"
echo "- apply it manually"
$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\OOSU10.exe"
echo "WINDOWS 10 SPECIFIC TWEAKS DONE"
echo "------------------------------------------------------------------------------"
