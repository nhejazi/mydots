#! /bin/bash

FILE="$HOME/.vimrc"

# Make required directories and install pathogen
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# Setup simple vimrc to use pathogen plugin
cat <<EOM >$FILE
execute pathogen#infect()
syntax on
filetype plugin indent on
set colorcolumn=80
EOM
# Upgrades!
# vim-sensible
git clone git://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible
# jedi-vim (python code completion)
git clone --recursive https://github.com/davidhalter/jedi-vim.git $HOME/.vim/bundle/jedi-vim
