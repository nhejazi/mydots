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
  export EDITOR='nvim'
fi


# control length of history file
HISTSIZE=1000
SAVEHIST=1000


# Set personal aliases, overriding those provided by plugins and themes.
# For a full list of active aliases, run `alias`.
## export Homebrew path explicitly to fix issue with "ls"
### see https://github.com/sorin-ionescu/prezto/issues/966
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
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
alias rr='R'
alias lf='ls -aF'
alias jpynb='jupyter notebook'


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

# add Pure prompt and theme
zplug "mafredri/zsh-async", from:github, defer:0  # Load this first
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
# Usage: codi2 [filetype] [filename]
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
