#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.

VAR_DNS="nameserver 192.168.10.248 \nnameserver 192.168.10.249"
printf "${VAR_DNS}" > /etc/resolv.conf

sed -i "s/AllowOverride None/AllowOverride All/g" /etc/httpd/conf/httpd.conf

rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -D FOREGROUND
