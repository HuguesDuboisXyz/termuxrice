#!/bin/sh

SCRIPT=$(readlink -f "$0")
BASE_DIR=$(dirname "$SCRIPT")


pkg update

for p in `cat list-pkg.txt`; do
        pkg install $p
done

mkdir -P $HOME/tmp/elixir
mkdir -P $HOME/tmp/erlang
mkdir -P $HOME/tmp/go
mkdir -P $HOME/tmp/js
mkdir -P $HOME/tmp/pharo
mkdir -P $HOME/tmp/python
mkdir -P $HOME/tmp/rust
mkdir -P $HOME/tmp/tmp
mkdir -P $HOME/tmp/ts

ln -s $BASE_DIR/bin $HOME/bin
ln -s $BASE_DIR/.termux $HOME/.termux
ln -s $BASE_DIR/.local $HOME/.local
ln -s $BASE_DIR/.config $HOME/.config
