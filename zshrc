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


# fix path issue to respect homebrew
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  export PATH=/usr/local/bin:$PATH
fi

# Set personal aliases, overriding those provided by plugins and themes.
# For a full list of active aliases, run `alias`.
## export Homebrew path explicitly to fix issue with "ls"
### see https://github.com/sorin-ionescu/prezto/issues/966
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
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
alias jpynb='jupyter notebook &> /dev/null &'
alias qjpynb='kill $(pgrep jupyter)'

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


# sets the tab title to current directory
#precmd() {
#  echo -ne "\e]1;${PWD##*/}\a"
#}


####################################
# using zplug for plug-in management
####################################
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
#zplug "themes/Soliah", from:oh-my-zsh, as:theme

# add Pure prompt and theme
zplug "mafredri/zsh-async", from:github
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


# Codi plug-in for Vim
# Usage: codi [filetype] [filename]
codi() {
  vim "$2" -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi ${1:-python}"
}

# Codi for Neovim
# Usage: ncodi [filetype] [filename]
ncodi() {
  nvim "$2" -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi ${1:-python}"
}


# emacs keybindings (match bash)
bindkey -e


# added by travis gem
[ -f /Users/nimahejazi/.travis/travis.sh ] && \
  source /Users/nimahejazi/.travis/travis.sh


# fzf via Homebrew
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
  fi
fi


# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

# fzf keybindings for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# use homebrew's curl
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  export PATH="/usr/local/opt/curl/bin:$PATH"
fi


# toggle the macOS "do not disturb" feature from the command line
# https://github.com/sindresorhus/do-not-disturb-cli
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  alias dnd='do-not-disturb toggle'
fi


# export environment variable for Homebrew GitHub access
if [ -e ~/.homebrew.github ]; then
  source ~/.homebrew.github
fi


# GPG signing for git
# (from https://github.com/keybase/keybase-issues/issues/2798)
export GPG_TTY=$(tty)

