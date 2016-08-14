echo "INSTALLING PANDA"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo "EXTRACTING THE ZIP FILE"

if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\panda.zip" "$parent_dir"

} else {
    echo "older powershell"
    $shellApplication = new-object -com shell.application
    $zipPackage = $shellApplication.NameSpace("$parent_dir\panda.zip")
    $destinationFolder = $shellApplication.NameSpace($parent_dir)
    $destinationFolder.CopyHere($zipPackage.Items(), 20)
}

echo "ZIP FILE EXTRACTED"

Start-Sleep -m 2000

Start-Process -FilePath "$parent_dir\Panda Free Antivirus 16.1.3\setup.exe" -ArgumentList '-s', '-sp"/quiet"' -Wait
Remove-Item "C:\Users\Public\Desktop\Panda Free Antivirus.lnk" -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force "$parent_dir\Panda Free Antivirus 16.1.3" -ErrorAction SilentlyContinue
echo "EXTRACTED FOLDER DELETED"

echo "PANDA DONE"
echo "------------------------------------------------- "

Remove-Item -Recurse -Force "$parent_dir\Panda Free Antivirus 16.1.3" -ErrorAction SilentlyContinue

echo "PANDA GONE"

cmd /c pause
