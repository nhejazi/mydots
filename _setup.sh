#!/usr/bin/env bash

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

# message template for git commits
if [ -e ~/.gitmessage.txt ]; then
    echo "gitmessage dotfile exists...old version will be renamed...";
    mv -f ~/.gitmessage.txt ~/.gitmessage_orig.txt;
fi
ln -s ~/.dotfiles/gitmessage.txt ~/.gitmessage.txt

# GitHub autocompletions script
if [ -e ~/.gh_complete.sh ]; then
    echo "github_complete already exists...old version will be renamed...";
    mv -f ~/.gh_complete.sh ~/.gh_complete_orig.sh;
fi
ln -s ~/.dotfiles/gh_complete.sh ~/.gh_complete.sh

# configuration of the terminal multiplexer tmux
if [ -e ~/.tmux.conf ]; then
  echo "Tmux config already exists...old version will be renamed...";
  mv -f ~/.tmux.conf ~/.tmux.conf_orig;
fi
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# customized theme for the tmux statusline (via tmuxline.vim)
if [ -e ~/.tmuxline ]; then
  echo "Tmuxline config already exists...old version will be renamed...";
  mv -f ~/.tmuxline ~/.tmuxline_orig;
fi
ln -s ~/.dotfiles/tmuxline ~/.tmuxline

# session startup profile for the R language
if [ -e ~/.Rprofile ]; then
  echo "Rprofile already exists...old version will be renamed...";
  mv -f ~/.Rprofile ~/.Rprofile_orig;
fi
ln -s ~/.dotfiles/rprofile ~/.Rprofile

# configuration file for the terminal emulater Alacritty
if [ -e ~/.config/alacritty/alacritty.yml ]; then
  echo "alacritty.yml already exists...old version will be renamed...";
  mv -f ~/.config/alacritty/alacritty.yml \
    ~/.config/alacritty/alacritty_orig.yml;
fi
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

# configuration file for Jupyter notebooks
if [ -e ~/.jupyter/jupyter_notebook_config.py ]; then
    echo "jupyter_notebook_config exists...old version will be renamed...";
    mv -f ~/.jupyter/jupyter_notebook_config.py \
      ~/.jupyter/jupyter_notebook_config_orig.py;
fi
ln -s ~/.dotfiles/jupyter_notebook_config.py \
  ~/.jupyter/jupyter_notebook_config.py

# configuration file for command line jrnl
if [ -e ~/.jrnl_config ]; then
    echo "jrnl_config already exists...old version will be renamed...";
    mv -f ~/.jrnl_config ~/.jrnl_config_orig;
fi
ln -s ~/.dotfiles/jrnl_config ~/.jrnl_config

# configuration file for SSH agent
if [ -e ~/.ssh/config ]; then
    echo "SSH config already exists...old version will be renamed...";
    mv -f ~/.ssh/config ~/.ssh/config_orig;
fi
ln -s ~/.dotfiles/ssh_config ~/.ssh/config

# configuration file for xinit
if [ -e ~/.xinitrc ]; then
    echo "xinit config already exists...old version will be renamed...";
    mv -f ~/.xinitrc ~/.xinitrc_orig;
fi
ln -s ~/.dotfiles/xinitrc ~/.xinitrc
