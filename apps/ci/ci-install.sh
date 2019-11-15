#!/bin/bash

set -e

echo "--> Install OS deps (apt-get)"
bash ./acore.sh "install-deps"

echo "--> Install clang-7"
sudo apt-get install clang-7

echo "--> Create config.sh"
cat >>conf/config.sh <<CONFIG_SH
CCOMPILERC=$CCOMPILERC
CCOMPILERCXX=$CCOMPILERCXX
MTHREADS=$(expr $(grep -c ^processor /proc/cpuinfo) + 2)
CWARNINGS=ON
CDEBUG=OFF
CTYPE=Release
CSCRIPTS=ON
CSERVERS=ON
CTOOLS=ON
CSCRIPTPCH=ON
CCOREPCH=ON
CCUSTOMOPTIONS='-DCMAKE_C_FLAGS="-Werror" -DCMAKE_CXX_FLAGS="-Werror"'
DB_CHARACTERS_CONF="MYSQL_USER='root'; MYSQL_PASS='$DB_RND_NAME'; MYSQL_HOST='localhost';"
DB_AUTH_CONF="MYSQL_USER='root'; MYSQL_PASS='$DB_RND_NAME'; MYSQL_HOST='localhost';"
DB_WORLD_CONF="MYSQL_USER='root'; MYSQL_PASS='$DB_RND_NAME'; MYSQL_HOST='localhost';"
DB_AUTH_NAME=auth_$DB_RND_NAME
DB_CHARACTERS_NAME=characters_$DB_RND_NAME
DB_WORLD_NAME=world_$DB_RND_NAME
CONFIG_SH
