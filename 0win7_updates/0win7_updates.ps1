$major_vers = [Environment]::OSVersion.Version.Major
$minor_vers = [Environment]::OSVersion.Version.Minor
if ($major_vers -eq 6) {
    if ($minor_vers -eq 1) {
        echo "WINDOWS 7 DETECTED - INSTALLING 3 UPDATES TO PREVENT LONG WAIT ON FIRST UPDATE"
        # KB3050265 KB3083710 KB3102810

        $parent_dir = Split-Path $MyInvocation.MyCommand.Path
         Foreach($item in (ls $parent_dir *.msu -Name))
         {
            echo "- $item"
            $item = $parent_dir + "\" + $item
            wusa $item /quiet /norestart | Out-Null
         }

        echo "WINDOWS 7 UPDATES DONE"
        echo "------------------------------------------------------------------------------"
    }
}
