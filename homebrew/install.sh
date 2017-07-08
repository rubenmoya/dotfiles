#!/bin/sh

# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
if [ ! -f /usr/local/bin/sha256sum ]; then
  sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
fi

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install other useful binaries.
brew install ack
brew install ctags
brew install git
brew install hub
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install pv
brew install reattach-to-user-namespace
brew install rename
brew install ssh-copy-id
brew install the_silver_searcher
brew install tmux
brew install tree
brew install webkit2png
brew install zopfli

# Install Cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

brew cask install google-chrome
brew cask install sublime-text-dev
brew cask install iterm2
brew cask install spotify

# Remove outdated versions from the cellar.
brew cleanup
