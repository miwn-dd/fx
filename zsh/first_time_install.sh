#!/bin/sh
# run this script after cloning repo to ~/.fx

# install power line fonts
sudo apt-get update
sudo apt-get install fonts-powerline zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# link .zshrc
[ -e $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.`date +%Y%m%d-%H%M%S`.bak
ln -s $HOME/.fx/zsh/.zshrc $HOME/.zshrc
