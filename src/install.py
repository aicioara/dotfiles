#/usr/bin/env python

import logging
import os
import sys
import time
from os import path


CURR_FOLDER = os.path.dirname(os.path.realpath(__file__))
BACKUP_ROOT = os.path.abspath(os.path.join(CURR_FOLDER, "../backups/"))
REPO_HOME = os.path.abspath(os.path.join(CURR_FOLDER, "home/"))
USER_HOME = os.path.expanduser("~")


def s(cmd, dryrun=False):
    if dryrun:
        print(cmd)
        return
    logging.debug(cmd)
    rc = os.system(cmd)
    if rc != 0:
        logging.error("Failed to run `{}`".format(cmd))
        sys.exit(rc)


def get_dotfiles():
    return os.listdir(REPO_HOME)


def backup_old_configs(dotfiles):
    backup_folder_prefix = os.path.join(BACKUP_ROOT, time.strftime("%Y_%m_%d_%H_%M_%S_"))
    for backup_folder_suffix in xrange(100):
        if not os.path.isdir("{}{}".format(backup_folder_prefix, backup_folder_suffix)):
            break
    else:
        raise RuntimeError("Could not create the backup folder")

    backup_dir = "{}{}".format(backup_folder_prefix, backup_folder_suffix)

    os.makedirs(backup_dir)

    for dotfile in dotfiles:
        src = os.path.join(USER_HOME, dotfile)
        dst = os.path.join(backup_dir)

        if not (os.path.exists(src)):
            logging.info("Skipping backing up `{}`. It does not exist".format(src))
            continue

        cmd = "cp -r {src} {dst}".format(src=src, dst=dst)
        s(cmd)


def create_symlinks(dotfiles):
    for dotfile in dotfiles:
        src = os.path.join(REPO_HOME, dotfile)
        dst = os.path.join(USER_HOME, dotfile)

        logging.info("Linking {} -> {}".format(src, dst))

        cmd = "rm -rf {dst}".format(dst=dst)
        s(cmd)

        cmd = "ln -fs {original} {symlink}".format(original=src, symlink=dst)
        s(cmd)


def main():
    logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.INFO)
    dotfiles = get_dotfiles()
    backup_old_configs(dotfiles)
    create_symlinks(dotfiles)


if __name__ == "__main__":
    main()
