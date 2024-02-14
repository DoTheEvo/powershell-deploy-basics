# https://github.com/rustdesk/rustdesk/releases

echo 'RUSTDESK'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
[array]$install_files = Get-ChildItem -Path $parent_dir rustdesk*.exe | Sort-Object LastWriteTime -Descending

if (!$install_files) {
    echo " - installation file not found, TERMINATING INSTALLATION"
    Return
}

$install_file_newest = $install_files[0].FullName
echo " - found: $install_files"
echo ' - installation in progress ...'

$arguments = "--silent-install"
Start-Process -FilePath "$install_file_newest" -ArgumentList $arguments -Wait

echo ' - creating startmenu shortcut'

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\RustDesk\RustDesk.lnk")
$shortcut.TargetPath = "C:\Program Files\RustDesk\RustDesk.exe"
$shortcut.Save()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($shell)

echo ' - removing startup link for tray icon'
Remove-Item 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\RustDesk Tray.lnk' -ErrorAction SilentlyContinue

echo ' - removing desktop link '
Remove-Item 'C:\Users\Public\Desktop\RustDesk.lnk' -ErrorAction SilentlyContinue

Set-Service 'rustdesk' -startupType manual
echo ' - rustdesk service set to manual startup'

echo 'RUSTDESK DONE'
echo '------------------------------------------------------------------------------'
