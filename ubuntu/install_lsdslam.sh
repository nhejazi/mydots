#! /bin/bash
### Install lsd_slam package to home directory
WS_NAME=lsd_slam_ws
VERSION_STRING=`lsb_release -r`
VERSION=${VERSION_STRING//[A-Z:a/]/}

# Check the ubuntu version. If not 14.04 (ros indigo), exit
if [ $VERSION -ne "14.04" ]; then
  echo "Automated install only valid for ros indigo (Ubuntu 14.04)"
  exit -1
fi

# Install
mkdir $HOME/$WS_NAME
cd $HOME/$WS_NAME
rosws init . /opt/ros/indigo
mkdir src
rosws set $HOME/$WS_NAME/src -t .
echo "source $HOME/$WS_NAME/setup.bash" >> $HOME/.bashrc
source setup.bash
cd src
# Pull down sourcecode
git clone https://github.com/rossbar/lsd_slam.git lsd_slam
# Configure git repo
cd lsd_slam
git remote add upstream https://github.com/tum-vision/lsd_slam.git
# Update from upstream
git fetch upstream
git pull upstream master

# Compile
rosmake lsd_slam
