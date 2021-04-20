#!/usr/bin/env bash

# remove broken symlinks
find -L ~ -maxdepth 1 -type l -exec rm {} +

# for bash shell customization
if [ -e ~/.bashrc ]; then
    echo "bashrc dotfile exists...old version will be renamed...";
    mv -f ~/.bashrc ~/.bashrc_backup;
fi
ln -s ~/.dotfiles/bashrc ~/.bashrc

# using .bash_profile for changes specific to macOS
if [ -e ~/.bash_profile ]; then
    echo "bash_profile dotfile exists...old version will be renamed...";
    mv -f ~/.bash_profile ~/.bash_profile_backup;
fi
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

# alias settings for bash
if [ -e ~/.bash_aliases ]; then
    echo "bash_aliases dotfile exists...old version will be renamed...";
    mv -f ~/.bash_aliases ~/.bash_aliases_backup;
fi
ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases

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

# customized theme for the tmux statusline (via tmuxline.vim)
if [ -e ~/.tmuxline ]; then
  echo "Tmuxline config already exists...old version will be renamed...";
  mv -f ~/.tmuxline ~/.tmuxline_backup;
fi
ln -s ~/.dotfiles/tmuxline ~/.tmuxline

# session startup profile for the R language
if [ -e ~/.Rprofile ]; then
  echo "Rprofile already exists...old version will be renamed...";
  mv -f ~/.Rprofile ~/.Rprofile_backup;
fi
ln -s ~/.dotfiles/rprofile ~/.Rprofile

# session startup profile for radian, the 21st century R console
if [ -e ~/.radian_profile ]; then
  echo "radian profile already exists...old version will be renamed...";
  mv -f ~/.radian_profile ~/.radian_profile_backup;
fi
ln -s ~/.dotfiles/radian_profile ~/.radian_profile

# configuration file for the terminal emulater Alacritty
if [ -e ~/.config/alacritty/alacritty.yml ]; then
  echo "alacritty.yml already exists...old version will be renamed...";
  mv -f ~/.config/alacritty/alacritty.yml \
    ~/.config/alacritty/alacritty_backup.yml;
fi
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

# configuration file for Jupyter notebooks
if [ -e ~/.jupyter/jupyter_notebook_config.py ]; then
    echo "jupyter_notebook_config exists...old version will be renamed...";
    mv -f ~/.jupyter/jupyter_notebook_config.py \
      ~/.jupyter/jupyter_notebook_config_backup.py;
fi
ln -s ~/.dotfiles/jupyter_notebook_config.py \
  ~/.jupyter/jupyter_notebook_config.py

# configuration file for command line jrnl
if [ -e ~/.config/jrnl/jrnl.yaml ]; then
    echo "jrnl.yaml already exists...old version will be renamed...";
    mv -f ~/.config/jrnl/jrnl.yaml ~/.config/jrnl/jrnl_backup.yaml;
fi
ln -s ~/.dotfiles/jrnl_config.yaml ~/.config/jrnl/jrnl.yaml

# configuration file for SSH agent
if [ -e ~/.ssh/config ]; then
    echo "SSH config already exists...old version will be renamed...";
    mv -f ~/.ssh/config ~/.ssh/config_backup;
fi
ln -s ~/.dotfiles/ssh_config ~/.ssh/config

# configuration file for xinit
if [ -e ~/.xinitrc ]; then
    echo "xinit config already exists...old version will be renamed...";
    mv -f ~/.xinitrc ~/.xinitrc_backup;
fi
ln -s ~/.dotfiles/xinitrc ~/.xinitrc
