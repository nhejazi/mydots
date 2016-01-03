#! /bin/bash

# Get ubuntu version
VERSION_STRING=`lsb_release -r`
VERSION=${VERSION_STRING//[A-Z:a]/}
echo "Detected Ubuntu Version: $VERSION"                                        

# Only operate on unbuntu 12.04
if [ $VERSION == "12.04" ]; then
  # Prepare workspace
  mkdir -p $HOME/rgbdslam_catkin_ws/src
  cd $HOME/rgbdslam_catkin_ws/src
  catkin_init_workspace
  cd $HOME/rgbdslam_catkin_ws/
  catkin_make
  source devel/setup.bash
  # Get RGBDSLAM
  cd $HOME/rgbdslam_catkin_ws/src
  git clone https://github.com/rossbar/rgbdslam_v2.git
  cd $HOME/rgbdslam_catkin_ws/
  # Install
  rosdep update
  rosdep install rgbdslam
  catkin_make
  catkin_make
  # Add devel script to bashrc
  echo "source $HOME/rgbdslam_catkin_ws/devel/setup.bash" >> $HOME/.bashrc
elif [ $VERSION == "14.04" ]; then                                              
  # Prepare workspace
  mkdir -p $HOME/rgbdslam_catkin_ws/src
  cd $HOME/rgbdslam_catkin_ws/src
  catkin_init_workspace
  cd $HOME/rgbdslam_catkin_ws
  catkin_make
  source devel/setup.bash
  # Get RGBDSLAM
  cd $HOME/rgbdslam_catkin_ws/src
  git clone git@github.com:rossbar/rgbdslam_v2.git
  cd $HOME/rgbdslam_catkin_ws
  # Install
  rosdep update
  rosdep install rgbdslam
  catkin_make
  # Set up environment
  echo "# ROS environment for RGBDSLAM" >> $HOME/.bashrc
  echo "source $HOME/rgbdslam_catkin_ws/devel/setup.bash" >> $HOME/.bashrc

else
  echo "Detected Ubuntu Version: $VERSION"
  echo "rgbdslam_v2 autobuild only works for ubuntu 12.04"
  echo "Exiting..."
fi
