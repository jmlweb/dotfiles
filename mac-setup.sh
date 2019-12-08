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

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

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

export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"

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
brew cask install alfred
brew cask install appcleaner
brew cask install audio-hijack
brew cask install cakebrew
brew cask install calibre
brew cask install couleurs
brew cask install docker
brew cask install figma
brew cask install github-desktop
brew cask install google-chrome
brew cask install insomnia
brew cask install iterm2
brew cask install kap
brew cask install keka
brew cask install keycastr
brew cask install kindle
brew cask install lastpass
brew cask install macdown
brew cask install monolingual
brew cask install mounty
brew cask install muzzle
brew cask install notion
brew cask install numi
brew cask install paste
brew cask install rectangle
brew cask install rocket
brew cask install shuttle
brew cask install sip
brew cask install spotify
brew cask install telegram
brew cask install the-unarchiver
brew cask install visual-studio-code
brew cask install vlc

brew tap "homebrew/cask-drivers"
brew tap "homebrew/cask-fonts"
brew tap "homebrew/cask-versions"

brew cask install "font-fira-code"
brew cask install "font-hack"

# Remove outdated versions from the cellar.
brew cleanup
