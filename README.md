# Setup-Machine

A PowerShell script to configure a Windows machine with all the tools I use on a daily basis.

```powershell
# Creates the .setup-machine folder in the user's profile folder
New-Item -Path ~ -Name '.setup-machine' -ItemType Directory -Force

# Downloads the latest version of the setup-machine repository as a ZIP file
Invoke-WebRequest -Uri https://api.github.com/repos/sebastienlevert/setup-machine/zipball/master -Out ~/.setup-machine/setup-machine.zip

# Unzip the downloaded ZIP file
Expand-Archive -Path ~/.setup-machine/setup-machine.zip -DestinationPath ~/.setup-machine -Force

# Change directory to the unzipped folder (the name may vary, so we use a wildcard)
cd (Get-ChildItem -Path .setup-machine/sebastienlevert-setup-machine-*)

# Run the Setup-Machine.ps1 script
.\Setup-Machine.ps1

# Run the Configure-Machine.ps1 script with your Git name and email
.\Configure-Machine.ps1 -Username "Your Name" -Email "email@domain.com"
```