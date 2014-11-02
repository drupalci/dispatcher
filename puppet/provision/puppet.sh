#!/bin/bash

# Script: puppet.sh
# Author: Nick Schuch

DIR=`pwd`

cd $DIR && sudo -E puppet apply --modulepath $DIR/puppet/modules $DIR/puppet/site.pp
