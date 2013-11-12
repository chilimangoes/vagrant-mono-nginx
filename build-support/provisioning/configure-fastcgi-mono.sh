#!/usr/bin/env bash

SITE_CONFIG_FILE=MySite.webapp


# TODO: what we need to eventually do is share the web project directory into /var/wwwroot

sudo echo "<%@ Page Language=\"C#\" AutoEventWireup=\"true\" %>" >> /var/wwwroot/default.aspx
sudo echo "<!DOCTYPE html>" >> /var/wwwroot/default.aspx
sudo echo "<html xmlns=\"http://www.w3.org/1999/xhtml\">" >> /var/wwwroot/default.aspx
sudo echo "<head runat=\"server\">" >> /var/wwwroot/default.aspx
sudo echo "    <title></title>" >> /var/wwwroot/default.aspx
sudo echo "</head>" >> /var/wwwroot/default.aspx
sudo echo "<body>" >> /var/wwwroot/default.aspx
sudo echo "    <div>" >> /var/wwwroot/default.aspx
sudo echo "    <% var test = \"Hello World! Got an aspx page running on nginx!!!\"; %>" >> /var/wwwroot/default.aspx
sudo echo "    <%= test %>" >> /var/wwwroot/default.aspx
sudo echo "    </div>" >> /var/wwwroot/default.aspx
sudo echo "</body>" >> /var/wwwroot/default.aspx
sudo echo "</html>" >> /var/wwwroot/default.aspx

[ ! -d /etc/init.d/mono-fastcgi ] && sudo mkdir /etc/init.d/mono-fastcgi
sudo cp -f /vagrant/build-support/server-files/init.d/mono-fastcgi/$SITE_CONFIG_FILE /etc/init.d/mono-fastcgi/$SITE_CONFIG_FILE

cd /etc/init.d/
sudo cp -f /vagrant/build-support/server-files/init.d/monoserve /etc/init.d/monoserve
sudo chmod +x monoserve
sudo update-rc.d monoserve defaults



sudo /etc/init.d/monoserve start
