#!/bin/bash

export WORKING_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -ex
set -o pipefail

export SQL_INSTALL_SCRIPT=nanoid--1.0.sql
rm -rf "$WORKING_DIR/$SQL_INSTALL_SCRIPT"
cp $WORKING_DIR/nanoid-postgres/nanoid.sql "$WORKING_DIR/$SQL_INSTALL_SCRIPT"
make
make install
