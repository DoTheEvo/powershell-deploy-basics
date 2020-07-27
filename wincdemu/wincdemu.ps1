#http://wincdemu.sysprogs.org/

echo 'WINCDEMU v4.1 (2018-01-24)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir wincdemu*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, ENDING"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$major_vers = [Environment]::OSVersion.Version.Major

if ($major_vers -ge 10) {
    echo ' - windows 10 or higher detected, skipping winCDemu'
} else {
    echo ' - importing certificate'
    # certmgr.msc
    certutil -addstore TrustedPublisher "$parent_dir\wincdemu.cer" >> "$env:temp\robo_log.txt"
    #$cert = Import-Certificate -FilePath "$parent_dir\wincdemu.cer" -CertStoreLocation 'Cert:\LocalMachine\TrustedPublisher'

    echo ' - installation in progress ...'
    $arguments = '/UNATTENDED'
    Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments  -Wait
}

echo 'WINCDEMU DONE'
echo '------------------------------------------------------------------------------'
