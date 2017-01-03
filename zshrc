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


####################################
# using zplug for plug-in management
####################################
source ~/.zplug/init.zsh

# Let zplug manage zplug
zplug "zplug/zplug"

# add assorted useful plug-ins
zplug "Valiev/almostontop", from:github  # clear screen after each command
zplug "chrissicool/zsh-bash", from:github  # conform more to bash
zplug "marzocchi/zsh-notify", from:github  # desktop notifications
zplug "b4b4r07/enhancd", from:github, use:init.sh  # better cd command
zplug "psprint/history-search-multi-word", from:github  # AND-style searching
zplug "supercrabtree/k", from:github  # nice directory listings, for humans
zplug "bric3/nice-exit-code", from:github  # map exit codes for readability
zplug "sindresorhus/pretty-time-zsh", from:github  # seconds to human time
zplug "peterhurford/up.zsh", from:github  # go up directories using numbers

# use oh-my-zsh plug-ins
zplug "plugins/git", from:oh-my-zsh  # for using git
zplug "plugins/history", from:oh-my-zsh  # history plug-in
zplug "plugins/wd", from:oh-my-zsh  # warp between directories using names
zplug "plugins/z", from:oh-my-zsh  # frequency-based directory navigation

# add Pure prompt and theme
zplug "mafredri/zsh-async", from:github, defer:0  # Load this first
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntx-highlighting", defer:2

# install any plug-ins that are currently uninstalled
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# source plug-ins and add commands to $PATH
zplug load --verbose


# Set personal aliases, overriding those provided by plugins and themes.
# For a full list of active aliases, run `alias`.
