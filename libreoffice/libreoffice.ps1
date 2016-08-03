echo "INSTALLING LIBREOFFICE"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\LibreOffice_5.2.0_Win_x64.msi" -ArgumentList '/quiet','/qn','ADDLOCAL=ALL','CREATEDESKTOPLINK=1','REGISTER_ALL_SMO_TYPES=1','REMOVE=gm_o_Onlineupdate','RebootYesNo=No' -Wait
Start-Process -FilePath "$parent_dir\LibreOffice_5.2.0_Win_x64_helppack_sk.msi" -ArgumentList '/quiet','/qn' -Wait

echo "LIBREOFFICE DONE"
echo "------------------------------------------------- "
