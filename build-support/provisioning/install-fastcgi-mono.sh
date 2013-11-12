#!/usr/bin/env bash

# this is the GitHub commit tag to build, see README for details
XSP_COMMIT_TAG="4587438369691b9b3e8415e1f113aa98b57d1fde"


### Install prerequisites ######################################################

apt-get update

apt-get install -y git
apt-get install -y build-essential
apt-get install -y gettext
apt-get install -y automake
apt-get install -y pkg-config

### Download and build XSP/FastCGI Mono ###############################################
cd /home/vagrant
echo "Cloning GitHub repository for XSP/FastCGI Mono..."
git clone https://github.com/mono/xsp.git
cd xsp
git checkout $XSP_COMMIT_TAG
./autogen.sh --prefix=/usr/local
make 
sudo make install
#cd /home/vagrant
#rm -fr xsp


# Clear the cache to reduce space used when packaging up the box
sudo apt-get clean



#cd /vagrant
#echo cd \/vagrant > /home/vagrant/.bashrc
#rm -rf /etc/motd

echo "> Mono version $MONO_VERSION is installed." >> /etc/motd
sudo echo "> Nginx, XSP and FastCGI Mono are installed and configured for serving ASP.NET applications." >> /etc/motd
#echo >> /etc/motd
#echo The directory you are now in is shared with the host \(the same directory as you copied the vagrantfile into\) - on your local machine clone the source as you would normally then inside this VM type \"cd \[directory name\]\" then \"rake mono\" and observe the output. >> /etc/motd
#echo >> /etc/motd

