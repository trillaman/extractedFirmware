#!/bin/sh
if [ -e /usr/bin/mysql_mips.tar.gz ] ; then

cd /tmp
tar zxvf /usr/bin/mysql_mips.tar.gz
cd /tmp
tar zxvf /usr/bin/radius.tar.gz
tar zxvf /usr/bin/coova.tar.gz
cd /tmp/mysql_mips/bin
./mysql_install_db --user=root --datadir=/tmp/jffs2/mysql_data --force
sleep 1
./mysqld_safe  --user=root --datadir=/tmp/jffs2/mysql_data &
sleep 2
cp /tmp/radius/etc/raddb/sql/mysql/* /tmp/mysql_mips/bin/
./mysqladmin create radius
./mysqladmin create user_mgmt
./mysqladmin create grouping
./mysql radius < schema.sql
./mysql radius < admin.sql
./mysql user_mgmt < userprofile.sql
./mysql user_mgmt < usergroup.sql
./mysql grouping < grouping.sql
cd /tmp/radius/sbin
./radiusd
sleep 1

rm -f /tmp/coova/etc/chilli/www/amit.gif
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/captive_logo.gif captive_logo.gif

rm -f /tmp/coova/etc/chilli/www/cap_login.css
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/cap_login.css cap_login.css

rm -f /tmp/coova/etc/chilli/www/cap_logout.html
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/cap_logout.html cap_logout.html

rm -f /tmp/coova/etc/chilli/www/config-local.sh
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/config-local.sh config-local.sh

rm -f /tmp/coova/etc/chilli/www/coova.html
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/coova.html coova.html

rm -f /tmp/coova/etc/chilli/www/css.tmpl
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/css.tmpl css.tmpl

rm -f /tmp/coova/etc/chilli/www/footer.tmpl
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/footer.tmpl footer.tmpl

rm -f /tmp/coova/etc/chilli/www/header.tmpl
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/header.tmpl header.tmpl

rm -f /tmp/coova/etc/chilli/www/js.tmpl
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/js.tmpl js.tmpl

rm -f /tmp/coova/etc/chilli/www/login.chi
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/login.chi login.chi

rm -f /tmp/coova/etc/chilli/www/login.tmpl
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/login.tmpl login.tmpl

rm -f /tmp/coova/etc/chilli/www/login_form.tmpl
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/login_form.tmpl login_form.tmpl

rm -f /tmp/coova/etc/chilli/www/login_success.tmpl
cd /tmp/coova/etc/chilli/www/;cp /tmp/www3/login_success.tmpl login_success.tmpl

fi
