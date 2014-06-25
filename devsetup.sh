#!/bin/bash

echo "YOUR SYSTEM"
cat /etc/*-release
SYS=$(uname -m)

echo "~~ DEVELOPER MACHINE INSTALLER ~~"
echo "This script will install Screen, Htop, Git, Python tools, Node.js, R, Emacs, RStudio Server, MongoDB, Heroku Toolbelt, AWS Cli"

# ToDo Select packages or sections here
#echo -n "Install all / Select packages [a/s] a > "
#read OPTION

# APT-GET UPDATE
sudo apt-get update > /dev/null

echo "~~~ INSTALLING SCREEN, CURL, HTOP, NETHOGS, GIT, AB ~~~"

# CURL

sudo apt-get install -y curl

# GIT
echo "~~~ INSTALLING GIT ~~~"
sudo apt-get install -y git  
echo -n "Enter your Git Name > "
read GIT_NAME
echo -n "Enter your Git Email > "
read GIT_EMAIL
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL

# SCREEN
sudo apt-get install screen 

# HTOP
sudo apt-get install htop

# NETHOGS
sudo apt-get install nethogs

# ab (Apache benchmark tool)
sudo apt-get install apache2-utils

echo "~~~ INSTALLING NGINX ~~~"
# Nginx
sudo apt-get install nginx

# Python RELATED STUFF
echo "~~~ pip virtualenv virtualenvwrapper fabric ~~~"
sudo apt-get install python-software-properties python g++ make
sudo apt-get install python-setuptools
sudo easy_install pip
sudo pip install setuptools --no-use-wheel --upgrade
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install fabric

# NODE.JS
echo "~~~ INSTALLING NODEJS express forever jshint ~~~"
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update > /dev/null
sudo apt-get install nodejs

sudo npm install -g express-generator
sudo npm install forever -g
sudo npm install jshint -g

# R
echo "~~~ INSTALLING R, RSTUDIO SERVER~~~"
sudo apt-get install r-base

# RSTUDIO SERVER
sudo apt-get install gdebi-core
sudo apt-get install libapparmor1
if [ $SYS == "x86_64" ]; then
    wget http://download2.rstudio.org/rstudio-server-0.98.490-amd64.deb
    sudo gdebi rstudio-server-0.98.490-amd64.deb
else
    wget http://download2.rstudio.org/rstudio-server-0.98.490-i386.deb
    sudo gdebi rstudio-server-0.98.490-i386.deb
fi

# EMACS24
echo "~~~ INSTALLING EMACS ~~~"
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update > /dev/null
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg


# INSTALL MongoDB
echo "~~~ INSTALLING MONGODB ~~~"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 > /dev/null
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update > /dev/null
sudo apt-get install mongodb-org

# INSTALL HEROKU TOOLBELT
echo "~~~ INSTALLING HEROKU TOOLBELT ~~~"
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh 

# AWS CLI
echo "~~~ INSTALLING AWS CLI ~~~"
pip install awscli

# ORACLE JAVA 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
