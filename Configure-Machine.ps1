Param(
  [Parameter(Mandatory=$true)]
  [ValidateNotNullOrEmpty()]
  [string]$Name,
  
  [Parameter(Mandatory=$true)
  ][ValidateNotNullOrEmpty()]
  [string]$Email
)
# Install Fonts
Install-PSResource -Name Fonts
Import-Module -Name Fonts

# Installs all the fonts in the CascadiaCode folder and its subfolders
Get-ChildItem -Path CascadiaCode -Recurse | Install-Font

# Initiates the Oh-My-Posh configuration
New-Item -Path ~ -Name '.oh-my-posh' -ItemType Directory -Force
cp .\OhMyPosh\*.* ~\.oh-my-posh -Recurse -Force
oh-my-posh init pwsh --config ~/.oh-my-posh/config.omp.json | Invoke-Expression

# Ensures the PowerShell profile is created and copies the custom profile
cp .\PowerShell\Microsoft.PowerShell_profile.ps1 $PROFILE

# Configures Git
git config --global user.name $Name
git config --global user.email $Email
git config --global push.default current
git config --global push.autoSetupRemote true
git config --global pull.rebase true
git config --global core.editor code -w
git config --global init.defaultBranch main

# Configures NVM
nvm install 18
nvm install 20
nvm install 22

nvm use 20

# Installs yarn and rimraf via npm
npm i -g yarn
npm i -g rimraf