https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04


## Install new
`sudo apt-get update`

`sudo apt-get install mysql-server`

## Set password of root if missing
`sudo service mysql stop`

`sudo mkdir /var/run/mysqld`

`sudo chown mysql: /var/run/mysqld`

`sudo mysqld_safe --skip-grant-tables --skip-networking & mysql -uroot mysql`

```
# update root user
UPDATE mysql.user SET authentication_string=PASSWORD('YOURNEWPASSWORD'), plugin='mysql_native_password' WHERE User='root' AND Host='localhost';
EXIT;
```

`sudo mysqladmin -S /var/run/mysqld/mysqld.sock shutdown`

`sudo service mysql start`

## Remove mysql completely

`sudo apt-get purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*`

`sudo rm -rf /etc/mysql /var/lib/mysql`

`sudo apt-get autoremove`

`sudo apt-get autoclean`
