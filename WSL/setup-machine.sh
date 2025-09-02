# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# make nvm runnable in this session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

sudo add-apt-repository ppa:dotnet/backports
sudo apt update && sudo apt upgrade
sudo apt install gh -y
sudo apt install jq -y
sudo apt-get install -y dotnet-sdk-10.0

# install go lang 1.24.2
wget https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz
# add go to the path.
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

#Go get powerline bits
go install github.com/justjanne/powerline-go@latest
# setup go-powerline in .bashrc
echo 'add powerline config to .bashrc'

echo 'GOPATH=$HOME/go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -modules "venv,ssh,cwd,perms,git,hg,jobs,exit" -error $? -jobs $(jobs -p | wc -l))"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' >> ~/.bashrc