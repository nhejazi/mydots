#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Install the necessary packages to run the jekyll server
apt-get install ruby-dev rubygems-integration nodejs
# Update system ruby pkg manager
gem update
# Install jekyll and other necessary packages
gem install jekyll rdiscount
