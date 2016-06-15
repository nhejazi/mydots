# Aliases for personal convenience

# make nice bash commands easier to use...
alias lf='ls -aF'   #displays symlinks with @
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias prme='ps aux | grep $USER'


# make common tools easier to use...
alias rr='R'
alias py2='python2'
alias py3='python3'
alias Julia='julia'
alias ipy2='ipython2'
if [ `uname` == "Darwin" ]; then
  alias ipy3='ipython3 --pylab'
else
  alias ipy3='ipython3'
fi
alias jpynb='jupyter notebook --no-browser'


# make OS-specific setup+alias for good-news prompt
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
