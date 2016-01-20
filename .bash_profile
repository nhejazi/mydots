# LAST UPDATED: JANUARY 16, 2016

# First thing's first - source .bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc; 
fi

# Setting up use the GNU "ls" utility
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Prioritizing Homebrew installs
export PATH=/usr/local/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=/usr/local/lib/python3.4/site-packages:$PYTHONPATH
#export PYTHONPATH=/usr/local/caffe/python:$PYTHONPATH
unset PYTHONPATH #manual fix for environment variable problems

# Setting PATH for Julia 0.4.2
PATH="/Applications/Julia-0.4.2.app/Contents/Resources/julia/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Haskell 7.10
#export PATH=~/Library/Haskell/bin:$PATH

# Setting PATH for Scala 2.11  (MOVED TO BASHRC)
#export SCALA_HOME=/usr/local/share/scala-2.11.7
#export PATH=$PATH:$SCALA_HOME/bin

# Setting DOCKER variables (manual fix)
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_MACHINE_NAME=default
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/nimahejazi/.docker/machine/machines/default

# Add colors to the output of command "ls"
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
alias ls="gls --color=auto"  # requires "brew install coreutils"

# Default editor switch to Emacs
#VISUAL=/usr/bin/emacs; export VISUAL
#EDITOR=/usr/bin/emacs; export EDITOR

# Default editor switch to MacVim
export EDITOR=/usr/local/Cellar/macvim/7.4-80/bin/mvim

# Set MacVim as the default Vim
alias vimgui=/usr/local/Cellar/macvim/7.4-80/bin/mvim

# Useful to fix Dropbox (from OS X sync error)
alias restartDropbox="osascript -e 'tell application \"Dropbox\" to quit';killall Dropbox;open -a \"Dropbox\""

