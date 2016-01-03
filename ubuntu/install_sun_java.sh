#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

#Enter,Y,Enter,Left,Enter

apt-get purge openjdk*
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java7-installer
