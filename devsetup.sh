#!/bin/bash

################ DEV MACHINE INSTALLER #################
# Serkan Sevilgen ssevilgen@gmail.com
# This script installs developer tools
# Tested and used on Ubuntu 12.04 32bit / 64bit
# No warranty

echo "YOUR SYSTEM"
cat /etc/*-release
sys=$(uname -m)

echo "~~ DEVELOPER MACHINE INSTALLER ~~"
echo "This script will install Screen, Git, Python tools, Node.js, R, Emacs, MongoDB, Heroku Toolbelt, AWS Cli"

# ToDo Select packages or sections here
#echo -n "Install all / Select packages [a/s] a > "
#read OPTION
    
# APT-GET UPDATE
sudo apt-get update > /dev/null

# CURL
sudo apt-get install -y curl

# GIT
sudo apt-get install -y git  
echo -n "Enter your Git Name > "
read GIT_NAME
echo -n "Enter your Git Email > "
read GIT_EMAIL
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAL

# SCREEN
sudo apt-get install screen 

# Python RELATED STUFF
sudo apt-get install python-software-properties python g++ make
sudo apt-get install python-setuptools
sudo easy_install pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper > /dev/null

# NODE.JS
sudo add-apt-repository ppa:chris-lea/node.js > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install nodejs

# R
sudo apt-get install r-base

# EMACS24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs  > /dev/null
sudo apt-get -qq update > /dev/null
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# RSTUDIO SERVER
sudo apt-get install gdebi-core
sudo apt-get install libapparmor1
if [ $SYS == "x86_64" ]: then
    wget http://download2.rstudio.org/rstudio-server-0.98.490-amd64.deb
else
    wget http://download2.rstudio.org/rstudio-server-0.98.490-i386.deb
fi
sudo gdebi rstudio-server-0.98.490-i386.deb

# INSTALL MongoDB
echo "******** Installing MongoDB ********"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 > /dev/null
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update > /dev/null
sudo apt-get install mongodb-10gen

# INSTALL HEROKU TOOLBELT
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh 


# AWS CLI
pip install awscli
  
