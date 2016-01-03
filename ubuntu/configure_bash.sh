FILE=$HOME/.bashrc
cp ./bash_prompt_color.sh $HOME/.bash_color
cat <<EOM >>$FILE
# Personal additions to configure environment
#--- Aliases
alias ipy='ipython --pylab'
alias ipyn='ipython notebook'
# Make bash pretty
source $HOME/.bash_color
EOM
