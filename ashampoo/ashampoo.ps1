# do not go to higher version

echo 'ASHAMPOO v6.84 (2013-05-29)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - importing registry file with the settings'
regedit /S "$parent_dir\ashampoo.reg"

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\ashampoo_burning_studio_6_free_6.84_13471.exe" -ArgumentList '/VERYSILENT','/NORESTART','/SUPPRESSMSGBOXES'

echo ' - waiting for ashampoo to start'
$val = 120
Do {
    $running = Get-Process 'burningstudio' -ErrorAction SilentlyContinue
    Start-Sleep -s 1
    $val--
    if ($val -eq 0) {break}
} while ($running -eq $null)

echo ' - ashampoo process detected, killing it in 5 seconds'
Start-Sleep -s 5
kill -processname 'burningstudio' -ErrorAction SilentlyContinue

echo ' - uninstalling your software deals'
$unins = 'C:\ProgramData\Ashampoo\unins000.exe'
If (Test-Path $unins){
    Start-Process -FilePath $unins -ArgumentList '/verysilent /norestart' -Wait
}

echo ' - removing desktop icons'
Remove-Item 'C:\Users\Public\Desktop\Your Software Deals.url' -ErrorAction SilentlyContinue
Remove-Item 'C:\Users\Public\Desktop\Ashampoo Burning Studio 6 FREE.lnk' -ErrorAction SilentlyContinue

echo 'ASHAMPOO DONE'
echo '------------------------------------------------------------------------------'
