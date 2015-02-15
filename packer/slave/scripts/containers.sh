#!/bin/bash -eux

# Name:        containers.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Pull down the containers required for a build via the make command.

# PrivateTravis containers.
docker pull privatetravis/base
docker pull privatetravis/mysql
docker pull privatetravis/postgres
docker pull privatetravis/phpenv
docker pull privatetravis/php:5.3
docker pull privatetravis/php:5.4
docker pull privatetravis/php:5.5
docker pull privatetravis/php:5.6
