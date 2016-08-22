# Bash Shell Aliases (for convenience)

# make nice bash commands easier to use...
alias lf='ls -aF'   #displays symlinks with @

alias ll='ls -alF'

alias la='ls -A'

alias l='ls -CF'

alias prme='ps aux | grep $USER'


# make common tools easier to use...
alias rr='R'

alias py2='python2'

if [ `uname` == "Linux" ]; then
  alias py3='python3.5'
elif [ `uname` == "Darwin" ]; then
  alias py3='python3'
else
  :
fi

alias Julia='julia'

alias ipy2='ipython2'

alias ipy3='ipython3'

alias jpynb='jupyter notebook --no-browser'


# OS-specific alias for good-news prompt
if [[ $USER == "nimahejazi" ]]; then
  if [ `uname` == "Linux" ]; then
    shuf -n1 ~/.goodnews
    alias qf='shuf -n1 ~/.goodnews'
  else
  # for OSX, use Homebrew's GNU coreutils
    gshuf -n1 ~/.goodnews
    alias qf='gshuf -n1 ~/.goodnews'
  fi
fi
