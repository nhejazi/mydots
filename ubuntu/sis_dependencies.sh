#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt-get install -y libxext-dev libapr1 libaprutil1 libexpat1-dev libfontconfig1-dev libfreetype6-dev libsvn1 libxft-dev libxpm-dev libxrender-dev subversion x11proto-render-dev zlib1g-dev libdrm-dev libice-dev libsm-dev libxt-dev mesa-common-dev libglu1-mesa libqt4-opengl-dev libcppunit-dev libusb-0.1-4 libusb-1.0-0 libusb-dev
