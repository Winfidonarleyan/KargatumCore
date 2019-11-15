#!/bin/bash

set -e

echo "--> Compile core"
export CCACHE_CPP2=true
ccache -s
timeout 2700 bash ./acore.sh "compiler" "all"
ccache -s
