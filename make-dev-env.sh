#!/bin/sh

DIRECTORIES="elixir erlang go vlang js python rust ts"
for d in $DIRECTORIES; do
	mkdir -p $HOME/tmp/$d;
	mkdir -p $HOME/src/projects/$d;
done
mkdir -p $HOME/tmp/tmp

mkdir -p $HOME/src/local/erlang
cd $HOME/src/local/erlang
git clone https://github.com/erlang-ls/erlang_ls.git
git clone https://github.com/WhatsApp/erlfmt
git clone https://github.com/lfe/lfe

mkdir -p $HOME/src/local/vlang
cd $HOME/src/local/vlang
git clone https://github.com/vlang/v
git clone https://github.com/vlang/vls.git
cd $BASE_DIR
