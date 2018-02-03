#http://wincdemu.sysprogs.org/

echo 'WINCDEMU v4.1 (2018-01-24)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$major_vers = [Environment]::OSVersion.Version.Major

if ($major_vers -ge 10) {

    echo ' - windows 10 or higher detected, skipping winCDemu'

} else {

    echo ' - importing certificate'
    certutil -addstore TrustedPublisher "$parent_dir\wincdemu.cer"
    #$cert = Import-Certificate -FilePath "$parent_dir\wincdemu.cer" -CertStoreLocation 'Cert:\LocalMachine\TrustedPublisher'
    Write-Output " - imported certificate"

    echo ' - installation in progress ...'
    Start-Process -FilePath "$parent_dir\WinCDEmu-4.1.exe" -ArgumentList '/UNATTENDED' -Wait

}

echo 'WINCDEMU DONE'
echo '------------------------------------------------------------------------------'


