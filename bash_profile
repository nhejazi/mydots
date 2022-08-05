# source .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# user-specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# pyenv: Python project enviornment management
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [[ `uname` == "Linux" ]]; then
  # NOTE: trial-and-error indicates only needed on Linux -- wtf?
  eval "$(pyenv init --path)"
fi
eval "$(pyenv init -)"
