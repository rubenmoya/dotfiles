#!/usr/bin/env zsh
echo "Downloading and installing RVM and Ruby 2.3.4"
zsh < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
source $HOME/.zshrc
source $HOME/.rvm/scripts/rvm
rvm autolibs enable
rvm install 2.3.4
rvm use 2.3.4 --default
gem install bundler
