function Expand-ZIPFile($file, $destination){
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace($file)
    foreach($item in $zip.items()){
        $shell.Namespace($destination).copyhere($item)
    }
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

echo "INSTALLING PANDA"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

if ($PSVersionTable.PSVersion.Major -ge 5) {
    Expand-Archive "$parent_dir\panda.zip" "$parent_dir"

} ElseIf ($PSVersionTable.PSVersion.Major -ge 4) {
    echo "win 8.1 powershell"
    Unzip "$parent_dir\panda.zip" "$parent_dir"
} Else {
    echo "win 7 powershell"
    Expand-ZIPFile –File "$parent_dir\panda.zip" –Destination "$parent_dir"
}

echo "zip extracted"

Start-Sleep -m 2000

Start-Process -FilePath "$parent_dir\Panda Free Antivirus 16.1.3\setup.exe" -ArgumentList '-s', '-sp"/quiet"' -Wait
Remove-Item "C:\Users\Public\Desktop\Panda Free Antivirus.lnk" -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force "$parent_dir\Panda Free Antivirus 16.1.3" -ErrorAction SilentlyContinue

echo "PANDA DONE"
echo "------------------------------------------------- "

Remove-Item -Recurse -Force "$parent_dir\Panda Free Antivirus 16.1.3" -ErrorAction SilentlyContinue

echo "PANDA GONE"

cmd /c pause
