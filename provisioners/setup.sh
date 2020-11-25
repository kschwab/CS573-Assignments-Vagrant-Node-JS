# update available package lists for Ubuntu
sudo apt-get update

# install Node JS
sudo apt install -y nodejs

# install the Node JS package manager
sudo apt install -y npm


# ==============================
# === DATABASE SETUP - START ===
# ==============================

# install PostgreSQL to allow the web application to store data in the local database
# the DEBIAN_FRONTEND environment variable argument is needed to suppress the postgres prompts
# for manually selecting the region and time zone
DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y postgresql

# Install PostgreSQL dev package required for npm pg install
sudo apt-get install -y postgresql-server-dev-all

# start the PostgreSQL service
sudo /etc/init.d/postgresql start

# create a PostgreSQL role named 'postgresonvagrantuser' having the password 'postgresonvagrantpassword'
# and then create a database 'postgresonvagrantdb' owned by the 'postgresonvagrantuser' role.
# NOTE: these commands are ran as the 'postgres' bash user, which was created automatically when postgresql was installed using apt-get
sudo -u postgres psql --command "CREATE USER postgresonvagrantuser WITH SUPERUSER PASSWORD 'postgresonvagrantpassword';"
sudo -u postgres createdb --owner postgresonvagrantuser postgresonvagrantdb

# ============================
# === DATABASE SETUP - END ===
# ============================


# NOTE:
# the contents of the /vagrant folder in the guest VM will be automatically synched with
# the <folder of cloned CS573-Assignments-Vagrant-Node-JS> folder on the host machine
# Hence, the source code of the cloned repository can be edited in the host machine,
# and the changes will be instantly available on the guest VM to be compiled and run
git clone https://github.com/heroku/node-js-getting-started.git /vagrant/node-js-getting-started

# all future commands will be relative to the cloned repository
cd /vagrant/node-js-getting-started

# === HACK FOR DEBUG AND GRADING - START ===
# this steps illustrates that we can be very specific with the revision
# of the cloned repository we want to build, as it could be the case that
# the latest revision of the cloned repository may contain unstable changes or
# changes with unwanted side effects.
# Also, this practice promotes reproducibility of the development environment being built.
#
# Alternatively, we can specify a git tag instead of a sha, but for this example,
# since we do not have write access to the cloned repository to create tags, we use the sha of commit
# https://github.com/heroku/node-js-getting-started/commit/a5d0ca5a618f18948652ebbd20b27b6970293d5c
git reset --hard a5d0ca5a618f18948652ebbd20b27b6970293d5c
#
# Obviously, in real world projects (and not in this simple example) in which we will have write access
# to the cloned repository, we could setup proper logging and there will be no need for this hack
git am ../provisioners/0001-Add-PostgreSQL-DB-that-prints-timestamps.patch
# === HACK FOR DEBUG AND GRADING - END ===

# NOTE: The file <folder of cloned CS573-Assignments-Vagrant-Node-JS>/start_server.sh on the host machine will automatically be
# available in the guest VM at: /vagrant/start_server.sh and in this way it
# can be run from inside the VM
chmod +x /vagrant/start_server.sh
