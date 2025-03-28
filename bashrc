#####################################
##### .bashrc setup/config file #####
##### is symlinked to ~/.bashrc #####
#####################################

# source global definitions if these exist
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# give bash good colors
if [ -h ~/.bash_color ]; then
  . $HOME/.bash_color
fi

# seems to fix lack of 256 colors in Xfce
if [ "$COLORTERM" == "xfce4-terminal" ]; then
  export TERM=xterm-256color
fi

# manually set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# if not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Alias definitions
## make nice bash commands easier to use...
alias lf='ls -aF' #displays symlinks with @
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cl='clear'

## make common tools easier to use...
alias rr='R --no-save' # R REPL without save prompt
alias rv='R --vanilla' # the plainest R REPL possible
alias ipy='ipython'
alias jl='julia'

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
  userStyle="${bold}${blue}"
else
  userStyle="${blue}"
fi

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${purple}"
else
  hostStyle="${purple}"
fi

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]" # working directory base name
PS1+="\[${bold}\]"
PS1+="\[${userStyle}\]\u" # username
PS1+="\[${white}\] at "
PS1+="\[${hostStyle}\]\h" # host
PS1+="\[${white}\] in "
PS1+="\[${green}\]\w"                                                                   # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${bold}${orange}\]\" \"\[${bold}${yellow}\]\")" # Git repository details
PS1+="\n"
PS1+="\[${white}\]\$ \[${reset}\]" # `$` (and reset color)
export PS1

# set title of a terminal window to be the relative path
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# GPG signing for git
# (from https://github.com/keybase/keybase-issues/issues/2798)
export GPG_TTY=$(tty)

# Linux
if [[ $(uname) == "Linux" ]]; then
  # add home directory bin/
  export PATH=$PATH:$HOME/bin

  # set up socket for ssh-agent and use with the keychain utility
  # https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login#18915067
  # https://eklitzke.org/using-ssh-agent-and-ed25519-keys-on-gnome
  if [[ $(whoami) == "nsh" ]]; then
    eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
    export SSH_AUTH_SOCK
    eval $(keychain --agents ssh --eval id_ed25519 --inherit any --clear)
  fi

  # export gems for non-system Ruby
  export GEM_HOME=$HOME/gems
  export PATH=$HOME/gems/bin:$PATH
fi

# macOS (Darwin)
if [ $(uname) == "Darwin" ]; then
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
if [[ $(uname) == "Linux" ]]; then
  # NOTE: trial-and-error indicates only needed on Linux -- wtf?
  eval "$(pyenv init --path)"
fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
case ":$PATH:" in
*:/Users/nih914/.juliaup/bin:*) ;;

*)
  export PATH=/Users/nih914/.juliaup/bin${PATH:+:${PATH}}
  ;;
esac
# <<< juliaup initialize <<<
