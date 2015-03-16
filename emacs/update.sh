#!/bin/sh

DIR=$(dirname $0)

if [ ! -d ~/.cask ]; then
    sh $DIR/install.sh
fi

cd ~/.cask
cask update
