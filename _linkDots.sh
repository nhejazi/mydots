#!/usr/bin/bash

# remove broken symlinks
find -L ~ -maxdepth 1 -type l -exec rm {} +

# for bash shell customization
if [ -e ~/.bashrc ]; then
    echo "bashrc dotfile exists...old version will be renamed...";
    mv -f ~/.bashrc ~/.bashrc_orig;
fi
ln -s ~/.dotfiles/bashrc ~/.bashrc

# using .bash_profile for changes specific to macOS
if [ -e ~/.bash_profile ]; then
    echo "bash_profile dotfile exists...old version will be renamed...";
    mv -f ~/.bash_profile ~/.bash_profile_orig;
fi
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

# using .profile for Linux-specific changes
if [ -e ~/.profile ]; then
    echo "profile dotfile exists...old version will be renamed...";
    mv -f ~/.profile ~/.profile_orig;
fi
ln -s ~/.dotfiles/profile ~/.profile

# alias settings for bash
if [ -e ~/.bash_aliases ]; then
    echo "bash_aliases dotfile exists...old version will be renamed...";
    mv -f ~/.bash_aliases ~/.bash_aliases_orig;
fi
ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases

# color settings for bash
if [ -e ~/.bash_color ]; then
    echo "bash_color dotfile exists...old version will be renamed...";
    mv -f ~/.bash_color ~/.bash_color_orig;
fi
ln -s ~/.dotfiles/bash_color ~/.bash_color

# for zsh shell customization
if [ -e ~/.zshrc ]; then
    echo "zshrc dotfile exists...old version will be renamed...";
    mv -f ~/.zshrc ~/.zshrc_orig;
fi
ln -s ~/.dotfiles/zshrc ~/.zshrc

# for xonsh shell customization
if [ -e ~/.xonshrc ]; then
    echo "xonshrc dotfile exists...old version will be renamed...";
    mv -f ~/.xonshrc ~/.xonshrc_orig;
fi
ln -s ~/.dotfiles/xonshrc ~/.xonshrc

# for git configuration and customization
if [ -e ~/.git-prompt_mb.sh ]; then
    echo "git-prompt_mb dotfile exists...old version will be renamed...";
    mv -f ~/.git-prompt_mb.sh ~/.git-prompt_mb_orig.sh;
fi
ln -s ~/.dotfiles/git-prompt_mb.sh ~/.git-prompt_mb.sh

if [ -e ~/.gitconfig ]; then
    echo "gitconfig dotfile exists...old version will be renamed...";
    mv -f ~/.gitconfig ~/.gitconfig_orig;
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

if [ -e ~/.gitignore_global ]; then
    echo "gitignore dotfile exists...old version will be renamed...";
    mv -f ~/.gitignore_global ~/.gitignore_global_orig;
fi
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global

if [ -e ~/.gitmessage.txt ]; then
    echo "gitmessage dotfile exists...old version will be renamed...";
    mv -f ~/.gitmessage.txt ~/.gitmessage_orig.txt;
fi
ln -s ~/.dotfiles/gitmessage.txt ~/.gitmessage.txt

if [ -e ~/.gh_complete.sh ]; then
    echo "github_complete already exists...old version will be renamed...";
    mv -f ~/.gh_complete.sh ~/.gh_complete_orig.sh;
fi
ln -s ~/.dotfiles/gh_complete.sh ~/.gh_complete.sh

# session startup profile for R language/environment
if [ -e ~/.Rprofile ]; then
  echo "Rprofile already exists...old version will be renamed...";
  mv -f ~/.Rprofile ~/.Rprofile_orig;
fi
ln -s ~/.dotfiles/rprofile ~/.Rprofile

# configuration file for the HyperTerm terminal
if [ -e ~/.hyperterm.js ]; then
  echo "hyperterm.js already exists...old version will be renamed...";
  mv -f ~/.hyperterm.js ~/.hyperterm_orig.js;
fi
ln -s ~/.dotfiles/hyperterm.js ~/.hyperterm.js

# run setup script for Atom (text editor) configuration files
sh ./atom/_linkAtomicDots.sh