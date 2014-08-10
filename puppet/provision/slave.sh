#!/bin/bash

# Script: slave.sh
# Author: Nick Schuch

DIR='/vagrant/puppet'

export FACTER_vagrant="1"
export FACTER_jenkins_role="slave"
export FACTER_jenkins_master="192.168.1.52"
export FACTER_jenkins_master_user="admin"
export FACTER_jenkins_master_pass="password"

cd $DIR && sudo -E puppet apply --modulepath $DIR/modules --hiera_config=$DIR/etc/hiera.yaml $DIR/site.pp
