#!/bin/bash
#zipfile="processing-3.3.6-linux64.tgz"
zipfile="processing-3.3.6-linux32.tgz"

if [ ! -e $zipfile ]
then
  wget http://download.processing.org/$zipfile
fi 

tar zxvf $zipfile > /dev/null

# Install minim
mkdir sketchbook
cd sketchbook
mkdir libraries
cd libraries
wget https://github.com/ddf/Minim/archive/master.zip
tar zxvf master.zip > /dev/null
cd ..
cd ..