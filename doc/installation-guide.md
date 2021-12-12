# Installation Guide

## On a new MacOS (migrating from another)

* Log in iCloud and Sync all Keychain passwords
* Update Mac 
* Backup `~/.ssh` and `~/.gnupg` from the previous computer to the new one
  - `chmod -R 700 ~/.ssh`
  - `chmod -R 700 ~/.gnupg`
* Install git
* Clone dotfiles repository `git clone https://github.com/jmlweb/dotfiles $HOME/.dotfiles`
* Go to dotfiles folder `cd $HOME/.dotfiles`
* Install git submodules `git submodule update --init --recursive modules/dotly`
* Install dotfiles `DOTFILES_PATH="$HOME/.dotfiles" DOTLY_PATH="$DOTFILES_PATH/modules/dotly" "$DOTLY_PATH/bin/dot" self install`
* Restart terminal
* Import packages `dot package import`

### Optimize MacOS

* `dot setup bootstrap`
* restart computer

### Install software

* `cd ~`
* Check that `Brewfile` is linked to `~/.dotfiles/os/mac/brew/Brewfile`
* `brew bundle install`
* Open **1Password**, authenticate and set permissions.
* Open **Amphetamine**. Set permissions.
* Open **Clipy**. Set permissions and start on login.
* Open **Google Chrome**, authenticate and check `sync account`.
* Open **MTMR**. Set permissions and start on login.
* Open **Notion** and authenticate.
* Open **Rectangle**. Set permissions and start on login.
* Open **Slack**. Authenticate.
* Open **Spotify**. Authenticate and disable start on login.
* Open **Zoom**. Authenticate.

### Install nvm, node lts and yarn

* `dot setup node-yarn`