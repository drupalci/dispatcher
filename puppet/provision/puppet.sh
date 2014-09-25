#!/bin/bash

# Script: puppet.sh
# Author: Nick Schuch

DIR='/vagrant/puppet'

cd $DIR && sudo -E puppet apply --modulepath $DIR/modules $DIR/site.pp
