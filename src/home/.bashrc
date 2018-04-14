#!/bin/bash
# Written by Andrei Cioara <http://andrei.cioara.me>

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# .bashrc is too specific. Extracting the rc so it can be used by other shells
source ~/.shellrc
