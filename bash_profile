# pyenv: Python project enviornment management
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# source .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# user-specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH
