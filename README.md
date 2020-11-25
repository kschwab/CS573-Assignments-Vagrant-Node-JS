# CS573 Vagrant Extra Credit

This is the extra credit for CS573 HW 8, Problem #24.

# Running the Web Server

To run the web server, issue the following commands:

```sh
$ cd <folder of cloned CS573-Assignments-Vagrant-Node-JS>
$ vagrant up
$ vagrant ssh
$ /vagrant/start_server.sh
```
_**Note:** It is possible in some instances that the provider will need to be specified for `vagrant up`. In this case, the `vagrant up` command should be `vagrant up --provider <Provider Name>`. For VirtualBox provider, this would be `vagrant up --provider virtualbox`._

# Accessing the Web Server

To access the web server, the URL is:

http://localhost:8080

# DB Interaction

To interact with the web server DB, timestamps are generated on URL accesses and written/read from the PostgreSQL database. To access the DB, the URL is:

http://localhost:8080/db
