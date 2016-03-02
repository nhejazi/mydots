#!/usr/bin/bash

# remove broken symlinks
find -L ~ -maxdepth 1 -type l -exec rm {} +

# for bash shell customization
if [ -e ~/.bashrc ]; then
    echo "bashrc dotfile exists...will be removed.";
    rm -f ~/.bashrc;
fi
ln -s ~/.dotfiles/bashrc ~/.bashrc

if [ -e ~/.bash_profile ]; then
    echo "bash_profile dotfile exists...will be removed.";
    rm -f ~/.bash_profile;
fi
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

if [ -e ~/.bash_color ]; then
    echo "bash_color dotfile exists...will be removed.";
    rm -f ~/.bash_color;
fi
ln -s ~/.dotfiles/bash_color ~/.bash_color

# for xonsh shell customization
if [ -e ~/.xonshrc ]; then
    echo "xonshrc dotfile exists...will be removed.";
    rm -f ~/.xonshrc;
fi
ln -s ~/.dotfiles/xonshrc ~/.xonshrc

# for git configuration and customization
if [ -e ~/.git-prompt.sh ]; then
    echo "git-prompt dotfile exists...will be removed.";
    rm -f ~/.git-prompt.sh;
fi
ln -s ~/.dotfiles/git-prompt.sh ~/.git-prompt.sh

if [ -e ~/.gitconfig ]; then
    echo "gitconfig dotfile exists...will be removed.";
    rm -f ~/.gitconfig;
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

if [ -e ~/.gitignore_global ]; then
    echo "gitignore dotfile exists...will be removed.";
    rm -f ~/.gitignore_global;
fi
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global

if [ -e ~/.gitmessage.txt ]; then
    echo "gitmessage dotfile exists...will be removed.";
    rm -f ~/.gitmessage.txt;
fi
ln -s ~/.dotfiles/gitmessage.txt ~/.gitmessage.txt
