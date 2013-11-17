#!/usr/bin/env bash

# the name of the folder, under ./vagran-mono-nginx/src, where the web project lives, eg 'WebProject' for vagran-mono-nginx/src/WebProject
WEB_PROJECT_NAME=WebProject

if [[ ! -d "/var/wwwroot" ]]; then
	echo "/var/wwwroot directory does not exist yet... creating it now..."
	sudo mkdir -p /var/wwwroot

	echo "Setting up binding between '/var/wwwroot/' and '/vagrant/src/${WEB_PROJECT_NAME}/'..."
	sudo mount --bind "/vagrant/src/${WEB_PROJECT_NAME}/" /var/wwwroot/
fi

sudo cp -f /vagrant/build-support/server-files/development/wwwroot-watcher.sh /etc/init.d/wwwroot-watcher.sh
sudo chmod +x /etc/init.d/wwwroot-watcher.sh

sudo cp -f /vagrant/build-support/server-files/development/wwwroot-watcher-service /etc/init.d/wwwroot-watcher-service
sudo chmod +x /etc/init.d/wwwroot-watcher-service
sudo update-rc.d wwwroot-watcher-service defaults


# TODO: This causes output to go to the terminal instead of the logfile when run as part of provisioning
#sudo /etc/init.d/wwwroot-watcher.sh restart
echo ""
echo "===================================================================="
echo ""
echo "Your Mono ASP.NET development server is now ready to use!"
echo ""
echo "IMPORTANT: In order for automatic ASP.NET recompilation to work, you"
echo "need to restart your vagrant box now, which you can do by entering"
echo "the command in your terminal:"
echo ">  vagrant reload"
echo ""

# http://chrislaco.com/devops-toolbox/provisioning-machines-with-vagrant/



