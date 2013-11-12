#!/usr/bin/env bash

# TODO: Need to update this to generate SSL cert and set up Nginx site to run as HTTPS (see bottom of nginx-sites-available-default)

# -rw-r--r-- 1 root root  898 Dec 13  2011 fastcgi_params
sudo cp -f /vagrant/build-support/server-files/nginx/fastcgi_params /etc/nginx/fastcgi_params
sudo cp -f /vagrant/build-support/server-files/nginx/sites-available/default /etc/nginx/sites-available/default

[ ! -d /var/wwwroot ] && sudo mkdir /var/wwwroot
sudo echo "Hello world!" >> /var/wwwroot/index.htm

service nginx restart
