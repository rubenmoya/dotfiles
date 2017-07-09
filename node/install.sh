#!/bin/sh

echo "Downloading and installing NVM and last stable Node"
bash < <(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh)
source $HOME/.nvm/nvm.sh
nvm install stable
nvm use stable
nvm alias default stable

npm install --global pure-prompt
