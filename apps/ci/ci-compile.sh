#!/bin/bash

set -e

echo "compile core"
timeout 2700 bash ./acore.sh "compiler" "all"
