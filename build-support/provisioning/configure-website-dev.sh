#!/usr/bin/env bash

[ "$#" -eq 1 ] || die "1 argument required, $# provided"

# the name of the folder, under ./vagrant-mono-nginx/src, where the web project lives, eg 'WebProject' for vagrant-mono-nginx/src/WebProject
# this should be passed in as the first argument to this script
WEB_PROJECT_NAME=$1

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



