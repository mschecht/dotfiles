#!/usr/bin/env bash
#
# Bootstrap script for setting up a new OSX machine
#
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Reading:
#
# - http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# - https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716
# - https://news.ycombinator.com/item?id=8402079
# - http://notes.jerzygangi.com/the-best-pgp-tutorial-for-mac-os-x-ever/

echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-indent
brew install gnu-which
brew install grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils


PACKAGES=(
    git
    tmux
    tree
    vim
    wget
    htop
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    xquartz
    flux
    google-chrome
    google-drive-file-stream
    iterm2
    skype
    slack
    sublime-text
    spotify
    zotero
    whatsapp
    inkscape
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Upgrading all packages..."
brew upgrade ${PACKAGES[@]}

echo "Cleaning up one last time..."
brew cleanup

echo "Bootstrapping complete"

