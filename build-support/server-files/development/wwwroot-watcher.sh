#!/usr/bin/env bash

###################################################################
# /etc/init.d/wwwroot-watcher.sh
#
# This script is only meant to run on a Vagrant box used for
# development. It is a workaround to an issue with VirtualBox
# shared folders, in which files that are modified on the host
# system do not trigger file system events in the guest, and
# vice-versa.
#
# What this script does is monitor the wwwroot folder, which is
# linked to the /vagrant shared folder, and any time files are
# added, deleted, or timestamps change, it touches the wwwroot
# folder so that FastCGI Mono (or any other program watching that
# directory) will get notified to scan for changes.
#
# Performance Note: Polling is done on an interval defined by the
# $WATCH_INTERVAL_SECONDS variable. The actual polling process is
# pretty fast and doesn't affect performance at all on smaller
# projects, even with $WATCH_INTERVAL_SECONDS set at 1 second. On
# very large projects, however, it might be necessary to increase
# this value if the script starts using a noticeable amount of CPU
# resources. If this happens, you'll need to find a value that 
# gives you a suitable tradeoff between performance and how quickly
# changes are picked up.
###################################################################

WATCH_INTERVAL_SECONDS=5

echo "$(date) Starting wwwroot-watcher"
echo "Running as user: $USER"
echo "--------------------------------------------------------"
echo ""

watcher_daemon() {
    chsum1=`ls -lR --time-style=full-iso /var/wwwroot/`

    while [[ true ]]
    do
        chsum2=`ls -lR --time-style=full-iso /var/wwwroot/`
        if [[ $chsum1 != $chsum2 ]] ; then
            echo "$(date) /var/wwwroot has changed, touching directory to notify FastCGI Mono"
            touch /var/wwwroot
            chsum1=$chsum2
        fi
        sleep $WATCH_INTERVAL_SECONDS
    done
}

watcher_daemon
