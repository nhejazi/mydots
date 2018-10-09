# Bash Shell Aliases (for convenience)

# make nice bash commands easier to use...
alias lf='ls -aF'   #displays symlinks with @
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias prme='ps aux | grep $USER'
alias c='clear'


# make common tools easier to use...
alias rv='R --vanilla'  # plain R REPL
alias rr='rtichoke'  # modern R command line interface

if [ `uname` == "Linux" ]; then
  alias py2='python2.7'
elif [ `uname` == "Darwin" ]; then
  alias py2='python2'
else
  :
fi

if [ `uname` == "Linux" ]; then
  alias py3='python3.5'
elif [ `uname` == "Darwin" ]; then
  alias py3='python3'
else
  :
fi

# for Linux-based systems, the Cisco AnyConnect VPN client
if [ `uname` == "Linux" ]; then
  alias vpn='/opt/cisco/anyconnect/bin/vpn'
  alias vpnui='/opt/cisco/anyconnect/bin/vpnui'
fi

# toggle the macOS "do not disturb" feature from the command line
# https://github.com/sindresorhus/do-not-disturb-cli
if [ `uname` == "Darwin" ]; then
  alias dnd='do-not-disturb toggle'
else
  :
fi

alias Julia='julia'
alias ipy='ipython3'
alias jpynb='jupyter notebook &> /dev/null &'
alias qjpynb='kill $(pgrep jupyter)'

# system-specific alias for good-news prompt
if [[ $USER == "nimahejazi" ]]; then
  if [ `uname` == "Linux" ]; then
    shuf -n1 ~/.goodnews
    alias qf='shuf -n1 ~/.goodnews'
  else
  # for macOS, use Homebrew's GNU coreutils
    gshuf -n1 ~/.goodnews
    alias qf='gshuf -n1 ~/.goodnews'
  fi
fi

