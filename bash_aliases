# Bash Shell Aliases (for convenience)

# make nice bash commands easier to use...
alias lf='ls -aF'   #displays symlinks with @
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias prme='ps aux | grep $USER'
alias c='clear'

# make common tools easier to use...
alias rr='R --no-save'  # R REPL without save prompt
alias rv='R --vanilla'  # the most plain R REPL possible
alias rad='radian --no-history'  # ipython-like R CLI
alias py='python3'
alias ipy='ipython'
alias jplb='jupyter lab'
alias jpnk='jupyter notebook'
alias jl='julia'

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
