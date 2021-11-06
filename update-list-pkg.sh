#!/bin/sh

SCRIPT=$(readlink -f "$0")
BASE_DIR=$(dirname "$SCRIPT")

pkg list-installed | cut -f1 -d/ | tail -n +2 > $BASE_DIR/list-pkg.txt
