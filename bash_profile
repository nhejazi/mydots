# pyenv: Python project enviornment management
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# source .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# user-specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# NOTE: pyenv says to add this at the very end of ~/.profile or similar
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
