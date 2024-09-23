#!/bin/zsh

# check out dotfiles
cd $HOME
git clone --bare https://github.com/kieran/.dotfiles.git .dotfiles.git

# set git alias
git config --global alias.dotfiles '!git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# checkout files
mv .zshrc .zshrc.bak 2>/dev/null
mv .config/starship.toml .config/starship.toml.bak 2>/dev/null
git dotfiles checkout --force main

# install nerd font via getnf
type getnf || curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i FiraCode

# install zap
type zap || zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# install starship
type starship || curl -sS https://starship.rs/install.sh | sh

# install mcfly
type mcfly || brew install mcfly

# reload terminal
source ~/.zshrc
