echo "INSTALLING LIBREOFFICE v5.2.2 (2016-09-29)"
# https://sk.libreoffice.org/stiahnu/?type=win-x86_64&lang=sk

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\LibreOffice_5.2.2_Win_x64.msi" -ArgumentList '/quiet','/qn','ADDLOCAL=ALL','CREATEDESKTOPLINK=1','REGISTER_ALL_SMO_TYPES=1','REMOVE=gm_o_Onlineupdate','RebootYesNo=No' -Wait
echo "- installing helppack"
Start-Sleep -s 3
Start-Process -FilePath "$parent_dir\LibreOffice_5.2.2_Win_x64_helppack_sk.msi" -ArgumentList '/quiet','/qn' -Wait

echo "LIBREOFFICE DONE"
echo "------------------------------------------------------------------------------"
