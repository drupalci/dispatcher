#!/bin/bash

# Script: slave.sh
# Author: Nick Schuch

DIR='/vagrant/puppet'

export FACTER_vagrant="1"
export FACTER_jenkins_role="slave"
export FACTER_jenkins_master="master.local"

cd $DIR && sudo -E puppet apply --modulepath $DIR/modules --hiera_config=$DIR/etc/hiera.yaml $DIR/site.pp
