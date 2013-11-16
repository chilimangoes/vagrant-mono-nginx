#!/usr/bin/env bash

# the name of the folder, under ./vagran-mono-nginx/src, where the web project lives, eg 'WebProject' for vagran-mono-nginx/src/WebProject
WEB_PROJECT_NAME=WebProject

if [[ ! -d "/var/wwwroot" ]]; then
	echo "/var/wwwroot directory does not exist yet... creating it now..."
	sudo mkdir -p /var/wwwroot

	echo "Setting up binding between '/var/wwwroot/' and '/vagrant/src/${WEB_PROJECT_NAME}/'..."
	sudo mount --bind "/vagrant/src/${WEB_PROJECT_NAME}/" /var/wwwroot/
fi

#sudo /etc/init.d/monoserve restart




