#!/bin/bash

THIS_DIR=$(dirname "${BASH_SOURCE[0]}")
cd ${THIS_DIR}

if ! [ -x "$(command -v python3)" ]; then
    CMD=python
else
    CMD=python3
fi

$CMD -u ${THIS_DIR}/src/install.py $@
