#####################################
##### .bashrc setup/config file #####
##### is symlinked to ~/.bashrc #####
#####################################

# Give bash shell a nice look
if [ -h ~/.bash_color ]; then
  . ~/.bash_color;
fi

# add GitHub completion (GitHub source: donnemartin/gitsome)
if [ -h ~/.gh_complete.sh ]; then
  . ~/.gh_complete.sh;
fi

# seems to fix lack of 256 colors in Xfce
if [ "$COLORTERM" == "xfce4-terminal" ]; then
  export TERM=xterm-256color
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Alias definitions
## make nice bash commands easier to use...
alias lf='ls -aF'   #displays symlinks with @
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias prme='ps aux | grep $USER'
alias c='clear'

## make common tools easier to use...
alias rr='R --no-save'  # R REPL without save prompt
alias rv='R --vanilla'  # the most plain R REPL possible
alias py='python3'
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

# Use defined prompt_git from `prompt-git.sh` for mathiasbynens style
. ~/.git-prompt_mb.sh

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
  userStyle="${bold}${blue}";
else
  userStyle="${blue}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${purple}";
else
  hostStyle="${purple}";
fi;

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${bold}\]\n"; # newline
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\] at ";
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\w"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${bold}${orange}\]\" \"\[${bold}${yellow}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

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

# Add an "alert" alias for long running commands. (usage e.g., sleep 10; alert)
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# To use GitHub integration with gitsome CLI, the following is necessary:
# NOTE June 2016: this causes an issue on Red Hat Linux systems.
if [[ (`uname -n | cut -d'.' -f 2` == "brc") || (`uname -n | cut -d'.' -f 2` == "biostat") ]]; then
  :
else
  if [ `uname` == "Linux" ]; then
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8
  fi
fi

# Setting PATH for Scala
export SCALA_HOME=/usr/local/share/scala
export PATH=$PATH:$SCALA_HOME/bin

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# autostart i3wm on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  ssh-agent startx
fi

# GPG signing for git
# (from https://github.com/keybase/keybase-issues/issues/2798)
export GPG_TTY=$(tty)

# Linux
if [[ `uname` == "Linux" ]]; then
  # on Ubuntu, python/pip installs executables here, so need to add to path
  export PATH=$PATH:~/.local/bin

  # set up socket for ssh-agent and use with the keychain utility
  # https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login#18915067
  # https://eklitzke.org/using-ssh-agent-and-ed25519-keys-on-gnome
  eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
  export SSH_AUTH_SOCK
  #export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  eval `keychain --agents ssh --eval id_rsa --inherit any --clear`

  # export gems for non-system Ruby
  export GEM_HOME=$HOME/gems
  export PATH=$HOME/gems/bin:$PATH
fi

# macOSX (Darwin)
if [ `uname` == "Darwin" ]; then
  # Workaround to Neovim mapping problem for <C-h> (only seems to affect macOS)
  export TERMINFO="$HOME/.terminfo"

  # for Hub command line tool, GitHub wrapper around git
  # (GitHub source: github/hub)
  eval "$(hub alias -s)"

  # bash completions needed by Homebrew and Mac-CLI
  # (GitHub source: guarinogabriel/Mac-CLI)
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion;
  fi
fi

# added by Miniconda3 4.5.12 installer
if [ `uname` == "Linux" ]; then
  # >>> conda init >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/nsh/miniconda3/bin/conda' \
    shell.bash hook 2> /dev/null)"
  if [ $? -eq 0 ]; then
      \eval "$__conda_setup"
  else
      if [ -f "/home/nsh/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/nsh/miniconda3/etc/profile.d/conda.sh"
          CONDA_CHANGEPS1=false conda activate base
      else
          \export PATH="/home/nsh/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda init <<<
fi

# pyenv: Python project enviornment management
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# add `pyenv init` for shims and autocompletion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# virtual environment integration with pyenv
if command -v pyenv-virtualenv 1>/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi
