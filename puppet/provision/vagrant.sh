#!/bin/bash

# Script: vagrant.sh
# Author: Nick Schuch

DIR='/vagrant/puppet'

cd $DIR && sh base.sh
cd $DIR && sh puppet.sh
