<#
.SYNOPSIS
Installer generator.
.DESCRIPTION
This will only work when invoked from root repo dir
Builds all subproject documentation, cleans up build dirs, creates the 
Milo DB installer
.PARAMETER outputInstallerName
Output name of the generated installer.
.PARAMETER qtIfwPath
Full path to Qt Installer Framework executable
.EXAMPLE
CreateWinInstaller installer.exe "C:\QtIF3.0\bin\binarycreator.exe"
.LINK
https://www.milosolutions.com/
#>

# first, lets define parameters
param(
 [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
 [string]$outputInstallerName,
 
 [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
 [string]$qtIfwPath
)

$TempDir=".\__tempMiloWizard"
if (Test-Path $TempDir) {
    Write-Host "Removing files from previous run"
    # Force will also delete hidden or read-only files and directories
    Remove-Item -path $TempDir -Recurse -Force
}

$ContentDir="$TempDir\packages\com.milosolutions"

# create directory structure in temporary folder. Piping results to 
# Out-Null hides output of New-Item command.
Write-Host "Creating directory structure in $TempDir"
New-Item -path "$ContentDir\data\packages" -type directory  | Out-Null
New-Item -path "$ContentDir\meta" -type directory  | Out-Null
New-Item -path "$TempDir\config" -type directory  | Out-Null

# -Container preserves directory structure
Write-Host "Copying files into $TempDir"
Get-ChildItem -Path ".\scripts\wizard_generator\config" | `
    Copy-Item -Destination "$TempDir\config" -Recurse -Container
Get-ChildItem -Path ".\packages" | `
    Copy-Item -Destination "$ContentDir\data\packages" -Recurse -Container
Get-ChildItem -Path ".\scripts\wizard_generator\meta" | `
    Copy-Item -Destination "$ContentDir\meta" -Recurse -Container
Copy-Item "wizard.json" -Destination "$ContentDir\data\wizard.json"
Copy-Item ".\icon.png" -Destination "$ContentDir\data\icon.png"
# copies reinstall script
# reinstall method described here: 
# https://stackoverflow.com/questions/46455360/workaround-for-qt-installer-framework-not-overwriting-existing-installation/46614107#46614107
Copy-Item ".\scripts\wizard_generator\auto_uninstall.qs" `
    -Destination "$ContentDir\\data\auto_uninstall.qs"

Write-Host "Generating installer"
& $qtIfwPath -v -c "$TempDir\config\config.windows.xml" -p "$TempDir\packages" $outputInstallerName  

Remove-Item -path $TempDir -Recurse -Force
Write-Host "Done. Installer created here: $outputInstallerName."
