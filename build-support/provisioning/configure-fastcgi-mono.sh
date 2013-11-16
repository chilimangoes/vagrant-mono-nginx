#!/usr/bin/env bash

SITE_CONFIG_FILE=MySite.webapp


sudo mkdir -p /etc/init.d/mono-fastcgi
sudo cp -f /vagrant/build-support/server-files/init.d/mono-fastcgi/$SITE_CONFIG_FILE /etc/init.d/mono-fastcgi/$SITE_CONFIG_FILE

cd /etc/init.d/
sudo cp -f /vagrant/build-support/server-files/init.d/monoserve /etc/init.d/monoserve
sudo chmod +x monoserve
sudo update-rc.d monoserve defaults


sudo /etc/init.d/monoserve start
