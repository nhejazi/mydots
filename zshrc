###################################
##### my .zshrc configuration #####
##### symlink is at: ~/.zshrc #####
###################################

# manually set language environment
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
alias c='clear'
alias rv='R --vanilla'  # plain R REPL
alias rr='rtichoke'  # modern R command line interface
alias lf='ls -aF'

# export environment variables for GitHub access for Homebrew on macOS
if [ -e ~/.homebrew.github ]; then
  source ~/.homebrew.github
fi

# GPG signing for git
# (from https://github.com/keybase/keybase-issues/issues/2798)
export GPG_TTY=$(tty)

# autostart i3wm on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  ssh-agent startx
fi

# "the fuck", tool to fix command-line errors
eval "$(thefuck --alias)"

# Setting tab titles in a smart way, allowing user to specify titles too
# from: https://github.com/zeit/hyper/issues/1188 | post by audunolsen
# references to the gitDirty variable removed since redundant with prompt pure

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
source ~/.zplug/init.zsh

# Let zplug manage zplug
zplug "zplug/zplug"

# assorted useful plug-ins
zplug "supercrabtree/k", from:github  # nice directory listings, for humans
zplug "b4b4r07/enhancd", from:github, use:init.sh  # better cd command
zplug "peterhurford/up.zsh", from:github  # go up directories using numbers
zplug "marzocchi/zsh-notify", from:github  # desktop notifications
zplug "Valiev/almostontop", from:github  # clear screen after each command
zplug "sindresorhus/pretty-time-zsh", from:github  # seconds to human time
zplug "psprint/history-search-multi-word", from:github  # AND-style searching
zplug "rauchg/wifi-password", from:github  # retrieve nearby WiFi passwords

# use oh-my-zsh plug-ins
zplug "plugins/git", from:oh-my-zsh  # for using git
zplug "plugins/wd", from:oh-my-zsh  # warp between directories using names
zplug "plugins/z", from:oh-my-zsh  # frequency-based directory navigation
zplug "plugins/git-flow", from:oh-my-zsh  # for using the Git Flow model

# use prezto plug-ins
zplug "modules/history", from:prezto  # a nice history tool

# add Soliah prompt and theme
zplug "themes/Soliah", from:oh-my-zsh, as:theme
#zplug "themes/frisk", from:oh-my-zsh, as:theme

# add Pure prompt and theme
zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

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

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

# fzf keybindings for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

####################################
## Linux                          ##
####################################
if [[ `uname` == "Linux" ]]; then
  # make open work like in macOS
  alias open=xdg-open

  # export gems for non-system Ruby
  export GEM_HOME=$HOME/gems
  export PATH=$HOME/gems/bin:$PATH

  # set up socket for ssh-agent and use with the keychain utility
  # https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login#18915067
  # https://eklitzke.org/using-ssh-agent-and-ed25519-keys-on-gnome
  eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
  export SSH_AUTH_SOCK
  #export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  eval `keychain --agents ssh --eval id_rsa --inherit any --clear`

  # on Ubuntu, python/pip installs executables here, so need to add to path
  export PATH=$PATH:~/.local/bin

  # for Linux-based systems, the Cisco AnyConnect VPN client
  alias vpn='/opt/cisco/anyconnect/bin/vpn'
  alias vpnui='/opt/cisco/anyconnect/bin/vpnui'
fi

####################################
## macOS (Darwin)                 ##
####################################
if [[ `uname` == "Darwin" ]]; then
  # add to path to respect homebrew
  export PATH=/usr/local/bin:$PATH

  # export Homebrew path explicitly to fix issue with "ls"
  # see https://github.com/sorin-ionescu/prezto/issues/966
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  fpath=(/usr/local/share/zsh-completions $fpath)

  # use version of curl from Homebrew
  export PATH="/usr/local/opt/curl/bin:$PATH"

  # toggle the macOS "do not disturb" feature from the command line
  # https://github.com/sindresorhus/do-not-disturb-cli
  alias dnd='do-not-disturb toggle'

  # fzf via Homebrew
  if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
  fi
fi

# added by travis gem
[ -f /home/nsh/.travis/travis.sh ] && source /home/nsh/.travis/travis.sh

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/nsh/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
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

# enable mujoco (Berkeley CS285)
export LD_LIBRARY_PATH=~/.mujoco/mjpro150/bin/

# enable mujoco 2.0 (Berkeley CS285)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mujoco200/bin/

# enable mujoco 1.3 (Berkeley CS285)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mjpro131/bin/
