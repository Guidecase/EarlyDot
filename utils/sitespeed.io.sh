#!/bin/bash

########## Install prerequisites

brew update 
brew install phantomjs

########## Download and extract package

cd ~/
curl -L -C - -O https://github.com/downloads/soulgalore/sitespeed.io/sitespeed.io-1.3.zip
unzip -a sitespeed.io-1.3.zip

########## Cleanup

cd ~/
rm -rf sitespeed.io-1.3.zip
