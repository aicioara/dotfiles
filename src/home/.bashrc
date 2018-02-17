#!/bin/bash
# Written by Andrei Cioara <http://andrei.cioara.me>

# .bashrc is too specific. Extracting the rc so it can be used by other shells

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

source ~/.shellrc
