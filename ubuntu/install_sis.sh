#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Get users in order to run this script as multiple users
USER_LIST=`users`
stringarray=($USER_LIST)
NON_ROOT_USER=${stringarray[0]}

# Env for running as a different user
RUNAS="sudo -u $NON_ROOT_USER"

# Get ubuntu version
VERSION_STRING=`lsb_release -r`
VERSION=${VERSION_STRING//[A-Z:a]/}
SISDIR=$HOME/SIS
PERMISSION_FILE=/etc/udev/rules.d/60-sis3150.rules
# Only operate on unbuntu 12.04
if [ $VERSION == "12.04" ]; then
$RUNAS bash<<___
  # Unpack the SIS tar
  mkdir $SISDIR
  tar -C $SISDIR -xzf sisusb-1.2-003.tar.gz
  # Configure the build
  cd $SISDIR/sisusb-1.2-003; ./configure --prefix=$SISDIR --with-usb-headerdir=/usr/include --with-usb-libdir=/lib/x86_64-linux-gnu
  # Build and install
  cd $SISDIR/sisusb-1.2-003; make
  cd $SISDIR/sisusb-1.2-003; make install
___
  # Setup permissions
  cat <<EOM >$PERMISSION_FILE
SUBSYSTEM=="usb", ATTR{idVendor}=="1657", ATTR{idProduct}=="3150", MODE="0777"
EOM

else
  echo "Detected Ubuntu Version: $VERSION"
  echo "install_sis.sh only works for ubuntu 12.04"
  echo "Exiting..."
fi
