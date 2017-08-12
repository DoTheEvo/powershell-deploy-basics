echo "SYSTEM TWEAKS"

echo "- disable automatic startup of the windows media player network sharing service"
Set-Service "WMPNetworkSvc" -startupType manual

echo "- disable tcp auto-tuning"
netsh int tcp set global autotuninglevel=disabled

echo "- show file extensions, show system files"
$key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
Stop-Process -processname explorer

echo "SYSTEM TWEAKS DONE"
echo "------------------------------------------------------------------------------"
