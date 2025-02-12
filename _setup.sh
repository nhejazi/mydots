#!/usr/bin/env bash

# remove broken symlinks
find -L ~ -maxdepth 1 -type l -exec rm {} +

# for bash shell customization
if [ -e "$HOME/.bashrc" ]; then
  echo "bashrc dotfile exists...renaming old version..."
  mv -f "$HOME/.bashrc" "$HOME/.bashrc_backup"
fi
ln -s "$HOME/.dotfiles/bashrc" "$HOME/.bashrc"

# using .bash_profile (sources .bashrc)
if [ -e "$HOME/.bash_profile" ]; then
  echo "bash_profile dotfile exists...renaming old version..."
  mv -f "$HOME/.bash_profile" "$HOME/.bash_profile_backup"
fi
ln -s "$HOME/.dotfiles/bash_profile" "$HOME/.bash_profile"

# color settings for bash
if [ -e "$HOME/.bash_color" ]; then
  echo "bash_color dotfile exists...renaming old version..."
  mv -f "$HOME/.bash_color" "$HOME/.bash_color_backup"
fi
ln -s "$HOME/.dotfiles/bash_color" "$HOME/.bash_color"

# for zsh shell customization
if [ -e "$HOME/.zshrc" ]; then
  echo "zshrc dotfile exists...renaming old version..."
  mv -f "$HOME/.zshrc" "$HOME/.zshrc_backup"
fi
ln -s "$HOME/.dotfiles/zshrc" "$HOME/.zshrc"

# using .zprofile
if [ -e "$HOME/.zprofile" ]; then
  echo "zprofile dotfile exists...renaming old version..."
  mv -f "$HOME/.zprofile" "$HOME/.zprofile_backup"
fi
ln -s "$HOME/.dotfiles/zprofile" "$HOME/.zprofile"

if [ -e "$HOME/.gitconfig" ]; then
  echo "gitconfig dotfile exists...renaming old version..."
  mv -f "$HOME/.gitconfig" "$HOME/.gitconfig_backup"
fi
ln -s "$HOME/.dotfiles/gitconfig" "$HOME/.gitconfig"

if [ -e "$HOME/.gitignore_global" ]; then
  echo "gitignore dotfile exists...renaming old version..."
  mv -f "$HOME/.gitignore_global" "$HOME/.gitignore_global_backup"
fi
ln -s "$HOME/.dotfiles/gitignore_global" "$HOME/.gitignore_global"

# message template for git commits
if [ -e "$HOME/.gitmessage.txt" ]; then
  echo "gitmessage dotfile exists...renaming old version..."
  mv -f "$HOME/.gitmessage.txt" "$HOME/.gitmessage_backup.txt"
fi
ln -s "$HOME/.dotfiles/gitmessage.txt" "$HOME/.gitmessage.txt"

# configuration of the terminal multiplexer tmux
if [ -e "$HOME/.tmux.conf" ]; then
  echo "Tmux config already exists...renaming old version..."
  mv -f "$HOME/.tmux.conf" "$HOME/.tmux.conf_backup"
fi
ln -s "$HOME/.dotfiles/tmux.conf" "$HOME/.tmux.conf"

# configuration for janky borders in macOS 14.0+
if [[ "$OSTYPE" == "darwin"* ]] && [[ -e "$HOME/.config/borders/bordersrc" ]]; then
  echo "bordersrc already exists...renaming old version..."
  mv -f "$HOME/.config/borders/bordersrc" \
    "$HOME/.config/borders/bordersrc_backup"
fi
ln -s "$HOME/.dotfiles/bordersrc" "$HOME/.config/borders/bordersrc"

# session startup profile for the R language
if [ -e "$HOME/.Rprofile" ]; then
  echo "Rprofile already exists...renaming old version..."
  mv -f "$HOME/.Rprofile" "$HOME/.Rprofile_backup"
fi
ln -s "$HOME/.dotfiles/rprofile" "$HOME/.Rprofile"

# session startup profile for radian, an ipython-like R REPL
if [ -e "$HOME/.config/radian/profile" ]; then
  echo "radian profile already exists...renaming old version..."
  mv -f "$HOME/.config/radian/profile" "$HOME/.config/radian/profile_backup"
fi
ln -s "$HOME/.dotfiles/radian_profile" "$HOME/.config/radian/profile"

# systemwide config for linting in R (for languageserver)
if [ -e "$HOME/.lintr" ]; then
  echo "lintr config already exists...renaming old version..."
  mv -f "$HOME/.lintr" "$HOME/.lintr_backup"
fi
ln -s "$HOME/.dotfiles/lintr_config" "$HOME/.lintr"

# configuration file for the Alacritty terminal
if [ -e "$HOME/.config/alacritty/alacritty.toml" ]; then
  echo "alacritty.toml already exists...renaming old version..."
  mv -f "$HOME/.config/alacritty/alacritty.toml" \
    "$HOME/.config/alacritty/alacritty_backup.toml"
fi
ln -s "$HOME/.dotfiles/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# configuration file for the Ghostty terminal
if [ -e "$HOME/.config/ghostty/config" ]; then
  echo "ghostty config already exists...renaming old version..."
  mv -f "$HOME/.config/ghostty/config" "$HOME/.config/ghostty/config_backup"
fi
ln -s "$HOME/.dotfiles/ghostty_config" "$HOME/.config/ghostty/config"

# configuration file for SSH agent
if [ -e "$HOME/.ssh/config" ]; then
  echo "SSH config already exists...renaming old version..."
  mv -f "$HOME/.ssh/config" "$HOME/.ssh/config_backup"
fi
ln -s "$HOME/.dotfiles/ssh_config" "$HOME/.ssh/config"
