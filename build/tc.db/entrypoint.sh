#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql/data \
  && mysqld_safe --user=mysql --datadir=/var/lib/mysql/data &

cmd='mysql < /root/root.sql'

while ! eval ${cmd}; do sleep 1; done
while true; do sleep 10; done
