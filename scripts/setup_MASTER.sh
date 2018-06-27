#!/bin/bash

# setup script for the master node
echo "setting up MASTER node"


echo "installing packages"

# install packages
# might have to install custom sdl2 version (we want >=2.0.8)
sudo apt install nfs-kernel-server nfs-common mpich # libsdl2-dev libsdl2-ttf-dev


# this is the shared directory, create it and add it as an export
mkdir -p /leconte/shared

# This tells the master node to allow others to read from the shared directory, which includes binaries and other files.
echo "/leconte/shared *(ro,sync)" > /etc/exports



