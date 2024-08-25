#!/usr/bin/env bash

# remove broken symlinks
find -L ~ -maxdepth 1 -type l -exec rm {} +

# for bash shell customization
if [ -e ~/.bashrc ]; then
    echo "bashrc dotfile exists...old version will be renamed...";
    mv -f ~/.bashrc ~/.bashrc_backup;
fi
ln -s ~/.dotfiles/bashrc ~/.bashrc

# using .bash_profile (sources .bashrc)
if [ -e ~/.bash_profile ]; then
    echo "bash_profile dotfile exists...old version will be renamed...";
    mv -f ~/.bash_profile ~/.bash_profile_backup;
fi
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

# color settings for bash
if [ -e ~/.bash_color ]; then
    echo "bash_color dotfile exists...old version will be renamed...";
    mv -f ~/.bash_color ~/.bash_color_backup;
fi
ln -s ~/.dotfiles/bash_color ~/.bash_color

# for zsh shell customization
if [ -e ~/.zshrc ]; then
    echo "zshrc dotfile exists...old version will be renamed...";
    mv -f ~/.zshrc ~/.zshrc_backup;
fi
ln -s ~/.dotfiles/zshrc ~/.zshrc

# using .zprofile
if [ -e ~/.zprofile ]; then
    echo "zprofile dotfile exists...old version will be renamed...";
    mv -f ~/.zprofile ~/.zprofile_backup;
fi
ln -s ~/.dotfiles/zprofile ~/.zprofile

# for git configuration and customization
if [ -e ~/.git-prompt_mb.sh ]; then
    echo "git-prompt_mb dotfile exists...old version will be renamed...";
    mv -f ~/.git-prompt_mb.sh ~/.git-prompt_mb_backup.sh;
fi
ln -s ~/.dotfiles/git-prompt_mb.sh ~/.git-prompt_mb.sh

if [ -e ~/.gitconfig ]; then
    echo "gitconfig dotfile exists...old version will be renamed...";
    mv -f ~/.gitconfig ~/.gitconfig_backup;
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

if [ -e ~/.gitignore_global ]; then
    echo "gitignore dotfile exists...old version will be renamed...";
    mv -f ~/.gitignore_global ~/.gitignore_global_backup;
fi
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global

# message template for git commits
if [ -e ~/.gitmessage.txt ]; then
    echo "gitmessage dotfile exists...old version will be renamed...";
    mv -f ~/.gitmessage.txt ~/.gitmessage_backup.txt;
fi
ln -s ~/.dotfiles/gitmessage.txt ~/.gitmessage.txt

# configuration of the terminal multiplexer tmux
if [ -e ~/.tmux.conf ]; then
  echo "Tmux config already exists...old version will be renamed...";
  mv -f ~/.tmux.conf ~/.tmux.conf_backup;
fi
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# session startup profile for the R language
if [ -e ~/.Rprofile ]; then
  echo "Rprofile already exists...old version will be renamed...";
  mv -f ~/.Rprofile ~/.Rprofile_backup;
fi
ln -s ~/.dotfiles/rprofile ~/.Rprofile

# session startup profile for radian, the 21st century R console
if [ -e ~/.config/radian/profile ]; then
  echo "radian profile already exists...old version will be renamed...";
  mv -f ~/.config/radian/profile ~/.config/radian/profile_backup;
fi
ln -s ~/.dotfiles/radian_profile ~/.config/radian/profile

# configuration file for the terminal emulator Alacritty
if [ -e ~/.config/alacritty/alacritty.toml ]; then
  echo "alacritty.toml already exists...old version will be renamed...";
  mv -f ~/.config/alacritty/alacritty.toml \
    ~/.config/alacritty/alacritty_backup.toml;
fi
ln -s ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

# configuration file for SSH agent
if [ -e ~/.ssh/config ]; then
    echo "SSH config already exists...old version will be renamed...";
    mv -f ~/.ssh/config ~/.ssh/config_backup;
fi
ln -s ~/.dotfiles/ssh_config ~/.ssh/config
