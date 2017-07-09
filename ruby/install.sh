#!/bin/sh
echo "Downloading and installing RVM and Ruby 2.3.4"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
bash < <(curl -sSL https://get.rvm.io)
source $HOME/.rvm/scripts/rvm
rvm autolibs enable
rvm install 2.3.4
rvm use 2.3.4 --default
gem install bundler
gem install tmuxinator
