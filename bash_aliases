# Bash Shell Aliases (for convenience)

# make nice bash commands easier to use...
alias lf='ls -aF'   #displays symlinks with @
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias prme='ps aux | grep $USER'
alias c='clear'


# make common tools easier to use...
alias rr='R'
alias rrr='rice'

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

alias Julia='julia'
alias ipy='ipython3'
alias jpynb='jupyter notebook &> /dev/null &'

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
