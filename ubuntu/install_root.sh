#! /bin/bash

# Script to install root (including pyroot)

INSTALL_DIR=$HOME/InstallationFiles
# Newest version of ROOT v5. Works in ubuntu 14.04
ROOT_VERSION=root_v5.34.32.source.tar.gz
NUM_CPUS=`grep -c ^processor /proc/cpuinfo`
USE_CPUS=`expr $NUM_CPUS - 1`

# Create the installation directory, if it doesn't already exist
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
if [ ! -e $ROOT_VERSION ]; then
  # Download source tree
  echo "Downloading source tree..."
  wget http://root.cern.ch/download/$ROOT_VERSION
fi
# Unpack source tree into directory called "root"
tar -xzf $ROOT_VERSION root
cd root
# Configure root (pyroot bindings built by default)
echo "\n\nConfiguring root..."
./configure
# Build
echo "\n\nBuilding root on $(USE_CPUS) cores"
make -j $USE_CPUS
# Add root configuration script to bashrc
echo "Adding thisroot.sh configuration to default environment..."
echo "source $INSTALL_DIR/root/bin/thisroot.sh" >> $HOME/.bashrc
echo "ROOT installation complete."
