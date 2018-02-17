#!/bin/bash

THIS_DIR=$(dirname "$0")
cd ${THIS_DIR}
python -u ${THIS_DIR}/src/install.py $@
