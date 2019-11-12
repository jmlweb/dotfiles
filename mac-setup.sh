#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select --install

########
# BREW #
########
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

#######
# ZSH #
#######
brew install zsh zsh-completions
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##################
# NODE USING NVM #
##################
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node

packages=(
    fkill-cli
    serve
    vtop
)

npm install -g "${packages[@]}"

########
# YARN #
########
brew install yarn

# Install Python
brew install python
brew install python3

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" audio-hijack
brew cask install --appdir="/Applications" cakebrew
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" insomnia
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" keka
brew cask install --appdir="/Applications" macdown
brew cask install --appdir="/Applications" monolingual
brew cask install --appdir="/Applications" mounty
brew cask install --appdir="/Applications" muzzle
brew cask install --appdir="/Applications" notion
brew cask install --appdir="/Applications" numi
brew cask install --appdir="/Applications" paste
brew cask install --appdir="/Applications" sip
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" telegram
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" vlc

tap "homebrew/cask-drivers"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"

cask "font-fira-code"
cask "font-hack"

# Remove outdated versions from the cellar.
brew cleanup
