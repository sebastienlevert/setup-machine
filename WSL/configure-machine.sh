#!/usr/bin/env bash
set -euo pipefail

Name=""
Email=""

# Support flags: -n "Full Name" -e "email@domain.com"
while getopts ":n:e:" opt; do
  case "$opt" in
    n) Name="$OPTARG" ;;
    e) Email="$OPTARG" ;;
    *) echo "Usage: $0 -n 'Full Name' -e 'email@domain.com'"; exit 1 ;;
  esac
done
shift $((OPTIND-1))

# Fallback to positional args if flags not used
if [[ -z "${Name}" && $# -ge 1 ]]; then Name="$1"; fi
if [[ -z "${Email}" && $# -ge 2 ]]; then Email="$2"; fi

if [[ -z "${Name}" || -z "${Email}" ]]; then
  echo "Usage: $0 -n 'Full Name' -e 'email@domain.com'"
  echo "   or: $0 'Full Name' 'email@domain.com'"
  exit 1
fi

git config --global user.name $Name
git config --global user.email $Email
git config --global push.default current
git config --global push.autoSetupRemote true
git config --global pull.rebase true
git config --global core.editor code -w
git config --global init.defaultBranch main

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 18
nvm install 20
nvm install 22
nvm use 20

npm i -g yarn
npm i -g rimraf