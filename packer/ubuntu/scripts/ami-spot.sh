#!/bin/bash -eux

# Name:        ami-spot.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Install extra configuration for AWS Spot instances.

echo "Updating package list"
apt-get update
echo "Installing dependencies"
apt-get install wget python -y

echo "Downloading boot script"
wget https://raw.githubusercontent.com/jenkinsci/ec2-plugin/master/src/main/webapp/AMI-Scripts/ubuntu-init.py -O /usr/bin/userdata
chmod +x /usr/bin/userdata

echo "Adding boot script to run after boot is complete"
sed -i 's/exit 0//' /etc/rc.local
echo "python /usr/bin/userdata &" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
