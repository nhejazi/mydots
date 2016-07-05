#####################################
##### my Bash shell preferences #####
##### .bashrc setup/config file #####
##### is symlinked to ~/.bashrc #####
#####################################


# source global definitions (for clusters: Berkeley HPC Savio and Biostat Bluevelvet)
if [[ (`uname -n | cut -d'.' -f 2` == "brc") || (`uname -n | cut -d'.' -f 2` == "biostat") ]]; then
  if [ -f /etc/bashrc ]; then
      . /etc/bashrc
  fi
fi

# Seems to fix lack of 256 colors in Xfce
if [ "$COLORTERM" == "xfce4-terminal" ]; then
  export TERM=xterm-256color
fi


# Give bash shell a nice look
if [ -h ~/.bash_color ]; then
  . ~/.bash_color;
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -h ~/.bash_aliases ]; then
  . ~/.bash_aliases;
fi


# add GitHub completion (source: donnemartin/gitsome on GitHub)
if [ -h ~/.gh_complete.sh ]; then
  . ~/.gh_complete.sh;
fi


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
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

##########################################################################################
## OLD SHELL PROMPT (USES `git-prompt.sh`), DROPPED IN FAVOR OF METHOD OF MATHIASBYNENS ##
##########################################################################################
# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

# Add git branch to prompt
#. ~/.git-prompt.sh
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

# uncomment for a colored prompt, if the terminal has the capability
#force_color_prompt=yes
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#      # We have color support; assume it's compliant with Ecma-48
#      # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#      # a case would tend to support setf rather than setaf.)
#      color_prompt=yes
#    else
#      color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='\[\e[0;34m\]\u:\[\e[m\] \[\e[0;32m\]\w\[\e[m\] '
#    PS1+='\[\e[1;31m\]$(parse_git_branch)\[\e[m\] \[\e[0;35m\]\$\[\e[m\] \[\e[0;37m\]'
#else
#    PS1='\u: \w $(parse_git_branch) \$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir (removed for shorter title)
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac
##########################################################################################
##########################################################################################


# Use defined prompt_git from `prompt-git.sh` for mathiasbynens style
. ~/.prompt-git.sh

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
    alias ls='ls --color=auto'    ## ON MAC OSX, THIS IS OVERWRITTEN IN `.bash_profile`
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Comical quotes for terminal (see GitHub: nhejazi/good-news)
# NOTE June 2016: this appears to cause some issues with logging in to servers
# to copy files (affects tools including `scp`, `rsync`, Cyberduck, Filezilla)
# my remote username is usually "nhejazi" ==> this seems to work fine now...
if [[ $USER == "nimahejazi" ]]; then  ## local user accounts only
  if [ ! -e ~/.goodnews ]; then
    git clone https://github.com/nhejazi/good-news.git ~/.good-news
    sh ~/.good-news/_setup.sh
  fi
fi


# Setting PATH for Scala
export SCALA_HOME=/usr/local/share/scala
export PATH=$PATH:$SCALA_HOME/bin


# Workaround to Neovim mapping problem for <C-h> (only seems to affect OSX)
if [ `uname` == "Darwin" ]; then
  export TERMINFO="$HOME/.terminfo"
fi


# To use GitHub integration with gitsome CLI, the following is necessary: 
# NOTE June 2016: this causes an issue on Enterprise Linux systems that are
# running OS Red Hat (notably Berkeley's HPC Savio and Biostat's Bluevelvet).
if [[ (`uname -n | cut -d'.' -f 2` == "brc") || (`uname -n | cut -d'.' -f 2` == "biostat") ]]; then
  :
else
  if [ `uname` == "Linux" ]; then
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8
  fi
fi
