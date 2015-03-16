#!/bin/bash -eux

# Name:        base.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Install base packages and configuration.

# Packages.
apt-get -y update
apt-get -y install openjdk-7-jre curl wget git vim make php-pear php5-dev php5-curl python
apt-get clean

# Composer.
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
