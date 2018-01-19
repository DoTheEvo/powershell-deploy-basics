echo "LIBREOFFICE 5.4.4 (2017-12-29)"
# https://sk.libreoffice.org/stiahnu/?type=win-x86_64&lang=sk
# https://www.libreoffice.org/download/release-notes/

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo " - installation in progress ..."
Start-Process -FilePath "$parent_dir\LibreOffice_5.4.4_Win_x64.msi" -ArgumentList '/quiet','/qn','ADDLOCAL=ALL','CREATEDESKTOPLINK=1','REGISTER_ALL_SMO_TYPES=1','REMOVE=gm_o_Onlineupdate','RebootYesNo=No' -Wait
Start-Sleep -s 3

echo " - installing helppack ..."
Start-Process -FilePath "$parent_dir\LibreOffice_5.4.4_Win_x64_helppack_sk.msi" -ArgumentList '/quiet','/qn' -Wait
Start-Sleep -s 3

echo " - installing fix for libreoffice 5.4.2 Visual C++ 2015 Redistributable Update 3 ..."
Start-Process -FilePath "$parent_dir\vc_redist.x64.exe" -ArgumentList '/install','/passive','/quiet', '/norestart' -Wait

echo "LIBREOFFICE DONE"
echo "------------------------------------------------------------------------------"
