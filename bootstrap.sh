#!/bin/bash?
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install git
brew install git-gui

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv install 3.11.1

brew install vim
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-inconsolata-nerd-font
brew tap homebrew/cask-fonts
brew install --cask font-3270-nerd-font
brew install --cask font-agave-nerd-font
brew install --cask font-inconsolata-nerd-font
brew install macvim
brew unlink vim
brew install macvim
brew install postgresql
brew formulae | grep postgresql@
brew install postgresql@13
brew services start postgresql@13
brew install ack
brew install btop
brew install fzf
brew install ack
