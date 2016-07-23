#!/usr/bin/bash

# remove broken symlinks
find -L ~ -maxdepth 1 -type l -exec rm {} +

# for bash shell customization
if [ -e ~/.bashrc ]; then
    echo "bashrc dotfile exists...removing...";
    rm -f ~/.bashrc;
fi
ln -s ~/.dotfiles/bashrc ~/.bashrc

# using .bash_profile for OSX-specific changes
if [ -e ~/.bash_profile ]; then
    echo "bash_profile dotfile exists...removing...";
    rm -f ~/.bash_profile;
fi
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

# using .profile for Linux-specific changes
if [ -e ~/.profile ]; then
    echo "profile dotfile exists...removing...";
    rm -f ~/.profile;
fi
ln -s ~/.dotfiles/profile ~/.profile

# alias settings for bash
if [ -e ~/.bash_aliases ]; then
    echo "bash_aliases dotfile exists...removing...";
    rm -f ~/.bash_aliases;
fi
ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases

# color settings for bash
if [ -e ~/.bash_color ]; then
    echo "bash_color dotfile exists...removing...";
    rm -f ~/.bash_color;
fi
ln -s ~/.dotfiles/bash_color ~/.bash_color

# for xonsh shell customization
if [ -e ~/.xonshrc ]; then
    echo "xonshrc dotfile exists...removing...";
    rm -f ~/.xonshrc;
fi
ln -s ~/.dotfiles/xonshrc ~/.xonshrc

# for git configuration and customization
#if [ -e ~/.git-prompt.sh ]; then
#    echo "git-prompt dotfile exists...removing...";
#    rm -f ~/.git-prompt.sh;
#fi
#ln -s ~/.dotfiles/git-prompt.sh ~/.git-prompt.sh

if [ -e ~/.prompt-git.sh ]; then
    echo "prompt-git dotfile exists...removing...";
    rm -f ~/.prompt-git.sh;
fi
ln -s ~/.dotfiles/prompt-git.sh ~/.prompt-git.sh

if [ -e ~/.gitconfig ]; then
    echo "gitconfig dotfile exists...removing...";
    rm -f ~/.gitconfig;
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

if [ -e ~/.gitignore_global ]; then
    echo "gitignore dotfile exists...removing...";
    rm -f ~/.gitignore_global;
fi
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global

if [ -e ~/.gitmessage.txt ]; then
    echo "gitmessage dotfile exists...removing...";
    rm -f ~/.gitmessage.txt;
fi
ln -s ~/.dotfiles/gitmessage.txt ~/.gitmessage.txt

if [ -e ~/.gh_complete.sh ]; then
    echo "github_complete already exists...removing...";
    rm -f ~/.gh_complete.sh;
fi
ln -s ~/.dotfiles/gh_complete.sh ~/.gh_complete.sh

# session startup profile for R language/environment
if [ -e ~/.Rprofile ]; then
  echo "Rprofile already exists...removing...";
  rm -f ~/.Rprofile;
fi
ln -s ~/.dotfiles/rprofile ~/.Rprofile

# configuration file for the HyperTerm terminal
if [ -e ~/.hyperterm.js ]; then
  echo "hyperterm.js already exists...removing...";
  rm -f ~/.hyperterm.js;
fi
ln -s ~/.dotfiles/hyperterm.js ~/.hyperterm.js

