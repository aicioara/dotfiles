# Author: Andrei Cioara

# Logging Bash History
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history/bash-history-$(date "+%Y-%m-%d").log; fi'

# Npm
export PATH=/usr/local/npm/bin:$PATH

# CUDA
export CUDA_HOME=/usr/local/cuda-7.0
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
export PATH=${CUDA_HOME}/bin:$PATH