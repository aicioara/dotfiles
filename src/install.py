#/usr/bin/env python

import logging
import os
import sys
from os import path

USER_HOME = ""



def s(cmd):
    logging.debug(cmd)
    rc = os.system(cmd)
    if rc != 0:
        logging.error("Failed to run `{}`".format(cmd))
        sys.exit(rc)


def get_dotfiles():
    pass


def backup_old_configs(dotfiles):
    pass


def create_symlinks(dotfiles):
    pass


def main():
    logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.DEBUG)
    dotfiles = get_dotfiles()
    backup_old_configs(dotfiles)
    create_symlinks(dotfiles)



if __name__ == "__main__":
    main()
