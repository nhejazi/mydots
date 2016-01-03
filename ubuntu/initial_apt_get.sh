#! /bin/bash

# NOTE: Removed libboost: libboost1.55-all-dev doesn't play nice with ros-indigo

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt-get install -y build-essential vim libgstreamer-plugins-base0.10-dev libgstreamer-plugins-bad0.10-dev libgstreamer0.10-dev gimp git-core gitk gparted cmake nautilus-open-terminal sqlite3 libhdf5-serial-dev libjpeg62 curl liblapack-dev libatlas-dev vlc python-pip mesa-utils libusb-1.0-0-dev libpng12-dev glmark2 tk-dev tcl vtk6 tcl-vtk openssh-server pigz xclip
