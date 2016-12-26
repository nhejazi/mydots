#####################################
####### FOR REMOTE HOSTS ONLY #######
#####################################

# for Berkeley/LBL Savio cluster and Bluevelvet Biostat server
if [[ (`uname -n | cut -d'.' -f 2` == "brc") || (`uname -n | cut -d'.' -f 2` == "biostat") ]]; then
  # source global definitions
  if [ -f /etc/bashrc ]; then
      . /etc/bashrc
  fi
fi

################################################################################

# for Grizzlybear2 Biostat HPC cluster
if [ `uname -n | cut -d'.' -f 1` == "grizzlybear2" ]; then
  # Source global definitions
  if [ -f /etc/bashrc ]; then
      . /etc/bashrc
  fi

  # Create R_LIBS directory if it does not exist
  if [ ! -d "$HOME/.R-packages" ]; then
       mkdir $HOME/.R-packages
  fi
  export R_LIBS=~/.R-packages

  # set module paths
  module use /share/apps/modulefiles
  module load /share/apps/modulefiles/R

  # user-specific startup environment
  PATH=$PATH:$HOME/bin
  export PATH
fi

################################################################################

# user-specific startup environment Bluevelvet Biostat server
if [ `uname -n | cut -d'.' -f 1` == "bluevelvet" ]; then
  PATH=/usr/local/cuda/bin:$HOME/bin:/usr/local/bowtie2:/usr/local/subread-1.4.5-p1/bin:$PATH
  LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

  export PATH
  export LD_LIBRARY_PATH

  # Create symbolic link to /data partition if it does not exist
  if [ ! -d "$HOME/data" ]; then
      ln -s /data "$HOME/."
  fi
fi

################################################################################
