#!/bin/bash -eux

# Name:        command.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Install DrupalCI console to the host.

DIR="/opt/drupalci_testbot"

git clone --branch phar https://github.com/nickschuch/drupalci_testbot.git $DIR
cd $DIR
composer install --prefer-dist --dev --no-progress

# We need to do this so we can build the .phar for PrivateTravis.
echo "phar.readonly = Off" >> /etc/php5/cli/php.ini

bin/box build
chmod 775 $DIR/drupalci.phar
ln -s $DIR/drupalci.phar /usr/local/bin/drupalci
