#!/bin/sh

SCRIPT=$(readlink -f "$0")
BASE_DIR=$(dirname "$SCRIPT")

pkg update
pkg install $(cat list-pkg.txt)
ln -s $BASE_DIR/bin $HOME/bin
ln -s $BASE_DIR/.termux $HOME/.termux
ln -s $BASE_DIR/.local $HOME/.local
ln -s $BASE_DIR/.config $HOME/.config
