# Creates the .setup-machine folder in the user's profile folder
New-Item -Path ~ -Name '.setup-machine' -ItemType Directory -Force

# Downloads the latest version of the setup-machine repository as a ZIP file
Invoke-WebRequest -Uri https://api.github.com/repos/sebastienlevert/setup-machine/zipball/main -Out ~/.setup-machine/setup-machine.zip

# Unzip the downloaded ZIP file
Expand-Archive -Path ~/.setup-machine/setup-machine.zip -DestinationPath ~/.setup-machine -Force

# Change directory to the most recently created unzipped folder matching the pattern
cd (Get-ChildItem -Path ~/.setup-machine -Directory -Filter 'sebastienlevert-setup-machine-*' | Sort-Object CreationTime -Descending | Select-Object -First 1 -ExpandProperty FullName)