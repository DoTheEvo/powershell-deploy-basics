# https://sk.libreoffice.org/stiahnu/?type=win-x86_64&lang=sk
# https://www.libreoffice.org/download/release-notes/

echo 'LIBREOFFICE 6.0.5 (2018-06-22)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
echo ' - installation in progress ...'

Start-Process -FilePath "$parent_dir\LibreOffice_6.0.5_Win_x64.msi" -ArgumentList '/quiet','/qn','ADDLOCAL=ALL','CREATEDESKTOPLINK=1','REGISTER_ALL_SMO_TYPES=1','REMOVE=gm_o_Onlineupdate','RebootYesNo=No' -Wait
Start-Sleep -s 3

echo ' - installing helppack ...'
Start-Process -FilePath "$parent_dir\LibreOffice_6.0.5_Win_x64_helppack_sk.msi" -ArgumentList '/quiet','/qn' -Wait
Start-Sleep -s 3

echo ' - installing fix, Visual C++ 2015 Redistr Upd 3 x64 ...'
Start-Process -FilePath "$parent_dir\vc_redist.x64.exe" -ArgumentList '/install','/passive','/quiet', '/norestart' -Wait

echo 'LIBREOFFICE DONE'
echo '------------------------------------------------------------------------------'
