#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

pip install --upgrade setuptools tornado distribute jinja2 six numpy ipython matplotlib cython scipy pandas scikit-image scikit-learn mayavi ntplib tables pyvtk pyrex numexpr pyopengl rope netifaces pyqtgraph progressbar
