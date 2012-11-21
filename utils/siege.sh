#!/bin/bash

########## Download and extract package

cd ~/
curl -C - -O http://www.joedog.org/pub/siege/siege-latest.tar.gz
tar -xvf siege-latest.tar.gz
cd siege-*

########## Build and install

./configure
make
make install

########## Cleanup

cd ~/
rm -rf siege-*

########## Configuration

siege