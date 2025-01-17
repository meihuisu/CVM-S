#!/bin/bash

tmp=`uname -s`

if [ $tmp == 'Darwin' ]; then
##for macOS, make sure have automake/aclocal
  brew install automake
  brew reinstall gcc
fi

aclocal
automake --add-missing
autoconf
cd data
./make_data_files.py
cd ..
./configure --prefix=$UCVM_INSTALL_PATH/model/cvms
make
make install

