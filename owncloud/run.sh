#!/bin/bash

if [[ ! -z "$OWNCLOUD_DATA" ]]; then
  ln -s $OWNCLOUD_DATA /usr/src/owncloud/data
fi

if [[ ! -d /usr/src/owncloud/data ]]; then
  mkdir -p /usr/src/owncloud/data
fi

nginx
php-fpm -F
