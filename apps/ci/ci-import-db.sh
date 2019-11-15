#!/bin/bash

set -e

echo "import DB"
bash ./acore.sh "db-assembler" "import-all"
