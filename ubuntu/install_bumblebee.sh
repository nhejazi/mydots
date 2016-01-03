#! /bin/bash

# NOTE: Removed libboost: libboost1.55-all-dev doesn't play nice with ros-indigo

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

add-apt-repository ppa:bumblebee/stable
apt-get update
apt-get install -y bumblebee bumblebee-nvidia virtualgl primus
