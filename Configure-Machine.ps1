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

Get-ChildItem -Path CascadiaCode -Recurse | Install-Font

# Creates the .oh-my-posh folder in the user's profile folder
New-Item -Path ~ -Name '.oh-my-posh' -ItemType Directory -Force

cp .\OhMyPosh\*.* ~\.oh-my-posh -Recurse -Force

oh-my-posh init pwsh --config ~/.oh-my-posh/config.omp.json | Invoke-Expression

cp .\PowerShell\Microsoft.PowerShell_profile.ps1 $PROFILE

git config --global user.name $Name
git config --global user.email $Email
git config --global push.default current
git config --global push.autoSetupRemote true
git config --global pull.rebase true
git config --global core.editor code -w
git config --global init.defaultBranch main

nvm install 18
nvm install 20
nvm install 22

nvm use 20

npm i -g yarn
npm i -g rimraf