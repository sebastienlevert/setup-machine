# Setup-Machine

A PowerShell script to configure a Windows machine with all the tools I use on a daily basis.

```powershell
# Download the latest Init-Machine.ps1 script and execute it
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/sebastienlevert/setup-machine/main/Init-Machine.ps1'))

# Run the Setup-Machine.ps1 script
.\Setup-Machine.ps1

# Run the Configure-Machine.ps1 script with your Git name and email
.\Configure-Machine.ps1 -Username "Your Name" -Email "email@domain.com"

# Run the Clean-Machine.ps1 script to remove unnecessary capabilities of Windows
.\Clean-Machine.ps1
```
