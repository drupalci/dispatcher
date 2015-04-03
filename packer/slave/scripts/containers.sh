#!/bin/bash -eux

# Name:        containers.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Pull down the containers required for a build via the make command.

# Used later when a build runs.
git clone https://github.com/drupalci/drupalci_testbot.git /opt/testbot

cd /opt/testbot

for CONTAINER in $(find -name Dockerfile | awk -F"/" '{print $4}'); 
do 
    docker pull drupalci/${CONTAINER}; 
done

docker images
