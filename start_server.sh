#!/bin/bash

# This script should be run from inside the virtual machine

# build the app
cd /vagrant/node-js-getting-started
npm install

# start the postgres server which will listen to the default port 5432
sudo service postgresql start

PGHOST=localhost \
PGUSER=postgresonvagrantuser \
PGPASSWORD=postgresonvagrantpassword \
PGDATABASE=postgresonvagrantdb \
PGPORT=5432 \
npm start
