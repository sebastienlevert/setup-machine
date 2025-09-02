# Get default distro name and Linux user
$distro = ((wsl -l -q | Select-Object -First 1) -replace '[\u0000\uFEFF\u200B-\u200D]', '').Trim()
$user = (wsl -d $distro -- bash -lc 'echo -n $USER')

# Ensure destination folder exists inside WSL
wsl -d $distro -- bash -lc 'mkdir -p ~/.setup-machine'
wsl -d $distro -- bash -lc 'sudo apt-get update && sudo apt-get install -y dos2unix'

$files = @("setup-machine.sh", "configure-machine.sh")

$files | ForEach-Object {
    $srcFile = ".\WSL\$_"
    $dstFile = "\\wsl$\$distro\home\$user\.setup-machine\$_"

    # Copies the scripts to the WSL distro in the user's home .setup-machine folder
    Copy-Item -Path $srcFile -Destination $dstFile -Force
    
    # Normalize line endings, make executable, and run from the correct folder
    wsl -d $distro -- bash -ic "dos2unix ~/.setup-machine/$_ 2>/dev/null || true; chmod +x ~/.setup-machine/$_"
    # wsl -d $distro -- bash -ic "~/.setup-machine/$_"
}

