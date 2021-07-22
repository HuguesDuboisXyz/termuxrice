#!/bin/sh
pkg update

for p in `cat list-pkg.txt`; do
        pkg install $p
done
