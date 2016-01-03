#! /bin/bash

git config --global user.name "Ross Barnowski"
git config --global user.email "rossbar@berkeley.edu"
git config --global credential.helper 'cache --timeout=3600'
git config --global color.ui true
git config --global core.editor vim
# push options
git config --global push.followTags true
git config --global push.default simple

# Aliases
git config --global alias.unstage 'reset HEAD --'
git config --global alias.hist 'log --all --graph --decorate --oneline'
