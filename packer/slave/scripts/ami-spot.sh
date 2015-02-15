#!/bin/bash -eux

# Name:        ami-spot.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Install extra configuration for AWS Spot instances.

rsync -avz /tmp/jenkins /opt

scp /opt/jenkins/ubuntu-init.py /usr/bin/userdata
chmod +x /usr/bin/userdata

sed -i 's/exit 0//' /etc/rc.local
echo "python /usr/bin/userdata &" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
