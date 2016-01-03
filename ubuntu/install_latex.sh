#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt-get install -y texlive-base texmaker texlive-latex-extra texlive-publishers texlive-fonts-recommended texlive-science texlive-bibtex-extra texlive-humanities
