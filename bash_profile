# source .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# user-specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH
