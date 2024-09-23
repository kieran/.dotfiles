#!/bin/zsh

# check out dotfiles
cd $HOME
git clone https://github.com/kieran/.dotfiles.git

# set git alias
git config --global alias.dotfiles '!git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# install nerd font via getnf
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i FiraCode

# install zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# install starship
curl -sS https://starship.rs/install.sh | sh

# install mcfly
brew install mcfly

# reload terminal
source ~/.zshrc
