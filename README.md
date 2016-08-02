# powershell-deploy-basics

* **install_all.bat** - runs `install_all.ps1` without dealing with ExecutionPolicy
* **install_all.ps1** - goes in to every subdirectory (7zip, aimp, anydesk,...) and runs ps1 script that is named same as the directory, afterwards if win10 it runs `win10_apps_removal.ps1`
* **win10_apps_removal.ps1** - removes some presinstalled apps
