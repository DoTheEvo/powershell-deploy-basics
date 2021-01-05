$win_8_builds = @(9200,9600)
$this_pc_build = [Environment]::OSVersion.Version.Build

if (-Not($win_8_builds.Contains($this_pc_build))) {
    exit
}

echo 'WINDOWS 8 DETECTED'
echo ' - removing apps'

Get-AppxPackage *BingFinance* | Remove-AppxPackage
Get-AppxPackage *BingFoodAndDrink* | Remove-AppxPackage
Get-AppxPackage *BingHealthAndFitness* | Remove-AppxPackage
Get-AppxPackage *BingMaps* | Remove-AppxPackage
Get-AppxPackage *BingNews* | Remove-AppxPackage
Get-AppxPackage *BingSports* | Remove-AppxPackage
Get-AppxPackage *BingTravel* | Remove-AppxPackage
Get-AppxPackage *BingWeather* | Remove-AppxPackage
Get-AppxPackage *HelpAndTips* | Remove-AppxPackage
Get-AppxPackage *Office.OneNote* | Remove-AppxPackage
Get-AppxPackage *Reader* | Remove-AppxPackage
Get-AppxPackage *SkypeApp* | Remove-AppxPackage
Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage *WindowsCalculator* | Remove-AppxPackage
Get-AppxPackage *WindowsReadingList* | Remove-AppxPackage
Get-AppxPackage *ZuneMusic* | Remove-AppxPackage
Get-AppxPackage *ZuneVideo* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *XboxLIVEGames* | Remove-AppxPackage

echo ' - removing start screen links'

# REMOVE-ITEM "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows Store.lnk" -FORCE
# REMOVE-ITEM "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PhotosApp.lnk" -FORCE
# REMOVE-ITEM "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Camera.lnk" -FORCE
# REMOVE-ITEM "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\FileManager.lnk" -FORCE
# REMOVE-ITEM "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Immersive Control Panel.lnk" -FORCE


echo 'WINDOWS 8 DONE'
echo '------------------------------------------------------------------------------'
