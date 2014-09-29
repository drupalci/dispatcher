#!/bin/bash -eux

# Name:        ami-spot.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Install extra configuration for AWS Spot instances.

echo "Updating package list"
sudo apt-get update
echo "Installing dependencies"
sudo apt-get install wget python -y

echo "Downloading boot script"
sudo wget https://raw.githubusercontent.com/jenkinsci/ec2-plugin/master/src/main/webapp/AMI-Scripts/ubuntu-init.py -O /usr/bin/userdata
sudo chmod +x /usr/bin/userdata

echo "Adding boot script to run after boot is complete"
sudo sed -i 's/exit 0/python \/usr\/bin\/userdata\n&/' /etc/rc.local
