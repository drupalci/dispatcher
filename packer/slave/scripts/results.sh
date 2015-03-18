#!/bin/bash -eux

# Name:        results.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Sets up the results scripts.

wget https://github.com/drupalci/results/releases/download/0.0.1/results-cli.phar
mv results-cli.phar /usr/local/bin/results-cli
chmod 775 /usr/local/bin/results-cli
