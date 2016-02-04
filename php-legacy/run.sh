#!/bin/bash

if [[ ! -e /etc/nginx/rewrite.conf ]]; then
  touch /etc/nginx/rewrite.conf
fi

nginx
/usr/local/php/sbin/php-fpm -F
