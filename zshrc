###################################
##### my .zshrc configuration #####
##### symlink is at: ~/.zshrc #####
###################################

autoload -U compinit
compinit

# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# manually set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# control length of history file
HISTSIZE=1000
SAVEHIST=1000

## add color support
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

## convenience aliases
alias cl='clear'
alias lf='ls -aF'

## aliases for common tools
alias rr='R --quiet --no-save'
alias ipy='ipython'
alias jl='julia'

# GPG signing for git
# (from https://github.com/keybase/keybase-issues/issues/2798)
export GPG_TTY=$(tty)

# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }

# Show cwd when shell prompts for input.
precmd() {
   if overridden; then return; fi
   pwd=$(pwd) # Store full path as variable
   cwd=${pwd##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd\a" # Replace with $pwd to show full path
}

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd" # Omit construct from $1 to show args
}

########################################
## using zplug for plug-in management ##
########################################
source $HOME/.zplug/init.zsh

# Let zplug manage zplug
zplug "zplug/zplug"

# assorted useful plug-ins
zplug "supercrabtree/k", from:github                    # nice directory lists
zplug "Valiev/almostontop", from:github                 # clear screen
zplug "mafredri/zsh-async", from:github                 # asynchronicity

# use oh-my-zsh plug-ins
zplug "plugins/git", from:oh-my-zsh      # for using git
zplug "peterhurford/up.zsh", from:github # go up directories using numbers
zplug "plugins/wd", from:oh-my-zsh       # warp between directories using names
zplug "plugins/z", from:oh-my-zsh        # frequency-based directory navigation

# use prezto plug-ins
zplug "modules/history", from:prezto     # a nice history tool

# add prompts and themes
# zplug "themes/Soliah", from:oh-my-zsh, as:theme
# zplug "themes/frisk", from:oh-my-zsh, as:theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# proper syntax highlighting (NOTE: must be last)
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2

# install any plug-ins that are currently uninstalled
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# source plug-ins and add commands to $PATH
zplug load --verbose

# emacs keybindings (match bash)
bindkey -e

# Linux
if [[ `uname` == "Linux" ]]; then
  # add home directory bin/
  export PATH=$PATH:$HOME/bin

  # make `open` work like on macOS
  alias open=xdg-open

  # export gems for non-system Ruby
  export GEM_HOME=$HOME/gems
  export PATH=$HOME/gems/bin:$PATH

  # set up socket for ssh-agent and use with the keychain utility
  # https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login#18915067
  # https://eklitzke.org/using-ssh-agent-and-ed25519-keys-on-gnome
  if [[ `whoami` == "nsh" ]]; then
    eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
    export SSH_AUTH_SOCK
    eval `keychain --agents ssh --eval id_ed25519 --inherit any --clear`
  fi
fi

# macOS (Darwin)
if [[ `uname` == "Darwin" ]]; then
  # add homebrew environment variables
  # NOTE: updated for Apple Silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # NOTE: use 256colors in tmux despite broken ncurses on macOS
  # https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
  export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
fi

# pyenv: Python project management, with virtual environment integration
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [[ `uname` == "Linux" ]]; then
  # NOTE: trial-and-error indicates only needed on Linux -- wtf?
  eval "$(pyenv init --path)"
fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
path=('/Users/nih914/.juliaup/bin' $path)
export PATH
# <<< juliaup initialize <<<
