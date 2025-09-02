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

For WSL setup, run the following commands in PowerShell:

```powershell
.\Configure-WSL.ps1
```

When jump on WSL for the first time, run:

```bash
# Setups the required capabilities
~/.setup-machine/setup-machine.sh

# Configure your WSL instance including git with your name and email
~/.setup-machine/configure-machine.sh -n "Your Name" -e ""
```
