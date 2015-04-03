#!/bin/bash -eux

# Name:        containers.sh
# Author:      Nick Schuch (nick@myschuch.com)
# Description: Pull down the containers required for a build via the make command.

# Used later when a build runs.
git clone https://github.com/drupalci/drupalci_testbot.git /opt/testbot

IMAGES=(
"base"
"web-base"
"db-base"
"php-base"
"web-5.4"
"web-5.6"
"web-5.5"
"web-7"
"web-5.3"
"db-mysql-5.5"
"mysql-5.5"
"mongodb-2.6"
"pgsql-9.1"
"pgsql-9.4"
"mariadb-5.5"
"mariadb-10.0"
)

for i in "${IMAGES[@]}"
do
	docker pull drupalci/${i}
done
