# Description: Script to setup a new machine with all the necessary tools and software

Param(
    [switch]$CLI = $true,
    [switch]$Development = $true,
    [switch]$Productivity = $false,
    [switch]$Miscellaneous = $true,
    [switch]$WSL = $true
)

# Ensure script is running as Administrator
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script! Please re-run this script as an Administrator!"
    Break
}

# Set PSGallery as a trusted repository
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

if($CLI) {
    winget install Microsoft.PowerToys -h
    winget install Microsoft.WindowsTerminal -h
    winget install Microsoft.PowerShell -h
    winget install JanDeDobbeleer.OhMyPosh -h
    winget install Git.Git -h
    winget install GitHub.cli -h
}

if($Development) {
    winget install Microsoft.DotNet.SDK.8 -h
    winget install Microsoft.DotNet.SDK.10 -h
    winget install CoreyButler.NVMforWindows -h
    winget install Microsoft.DevHome -h
    winget install Microsoft.Azure.StorageExplorer  -h
    winget install microsoft.azd -h
    winget install Microsoft.devtunnel -h
    winget install DevToys-app.DevToys -h
    winget install dotPDN.PaintDotNet -h
    winget install Mozilla.Firefox -h
    winget install Microsoft.VisualStudioCode -h
    winget install Microsoft.VisualStudio.2022.Enterprise -h
}

if($Productivity) {
    winget install Microsoft.Office -h
    winget install Microsoft.Teams -h
    winget install 9NBLGGH5R558 -h # Microsoft To-Do
    winget install 9P1J8S7CCWWT -h # Clipchamp
    winget install Spotify.Spotify
    winget install 9WZDNCRF0083 -h # Facebook Messenger
    winget install Foxit.FoxitReader -h
}

# Miscellaneous
if($Miscellaneous) {
    winget install 7zip.7zip -h
    winget install ShareX.ShareX -h
}

if($WSL) {
    wsl --install
}