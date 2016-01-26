# generate symlinks to important files in home directory

cd

# for terminal (bash) customization
if [ -e ~/.bashrc ]
  then
    echo "bashrc dotfile exists - will be removed."
    rm ~/.bashrc
fi
ln -s ~/git-repos/mydotfiles/bashrc ~/.bashrc

if [ -e ~/.bash_profile ]
  then
    echo "bash_profile dotfile exists - will be removed."
    rm ~/.bash_profile
fi
ln -s ~/git-repos/mydotfiles/bash_profile ~/.bash_profile

if [ -e ~/.bash_color ]
  then
    echo "bash_color dotfile exists - will be removed."
    rm ~/.bash_color
fi
ln -s ~/git-repos/mydotfiles/bash_color ~/.bash_color


# for git configuration/customization
if [ -e ~/.git-prompt.sh ]
  then
    echo "git-prompt dotfile exists - will be removed."
    rm ~/.git-prompt.sh
fi
ln -s ~/git-repos/mydotfiles/git-prompt.sh ~/.git-prompt.sh

if [ -e ~/.gitconfig ]
  then
    echo "gitconfig dotfile exists - will be removed."
    rm ~/.gitconfig
fi
ln -s ~/git-repos/mydotfiles/gitconfig ~/.gitconfig

if [ -e ~/.gitignore_global ]
  then
    echo "gitignore dotfile exists - will be removed."
    rm ~/.gitignore_global
fi
ln -s ~/git-repos/mydotfiles/gitignore_global ~/.gitignore_global

if [ -e ~/.gitmessage.txt ]
  then
    echo "gitmessage dotfile exists - will be removed."
    rm ~/.gitmessage.txt
fi
ln -s ~/git-repos/mydotfiles/gitmessage.txt ~/.gitmessage.txt
