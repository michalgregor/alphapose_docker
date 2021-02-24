#!/bin/sh

if [ ! -d "/alphapose" ]; then
    ln -s /alphapose-repo /alphapose
elif [ -z "$(ls -A /alphapose)" ]; then
  cp -a /alphapose-repo/. /alphapose/
fi
exec "$@"
