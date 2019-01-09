#!/bin/bash

THIS_DIR=$(dirname "${BASH_SOURCE[0]}")
cd ${THIS_DIR}
python -u ${THIS_DIR}/src/install.py $@
