#!/bin/bash
export GHOST_NODE_VERSION_CHECK=false

if [[ ! -z "$GHOST_DATA" ]]; then
  ln -s $GHOST_DATA /usr/src/ghost/content
fi

if [[ ! -d /usr/src/ghost/content || ! -d /usr/src/ghost/content/themes ]]; then
  mkdir -p /usr/src/ghost/content
  cp -R /usr/src/ghost/content_default/* /usr/src/ghost/content/
fi

npm start --production
