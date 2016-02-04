#!/bin/bash

if [[ ! -e /etc/nginx/rewrite.conf ]]; then
  touch /etc/nginx/rewrite.conf
fi

nginx
php-fpm -F
