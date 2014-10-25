#!/bin/bash -eux

# Name:        command.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Install DrupalCI console to the host.

git clone https://github.com/ricardoamaro/drupalci_testbot.git /opt/drupalci_testbot
chmod 775 /opt/drupalci_testbot/drupalci
ln -s /opt/drupalci_testbot/drupalci /usr/local/bin/drupalci
