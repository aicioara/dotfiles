#!/usr/bin/env python

import argparse
import itertools
import os
import shutil

parser = argparse.ArgumentParser()
parser.add_argument("folder1")
parser.add_argument("folder2")
parser.add_argument("destination", default='c')
args = parser.parse_args()

if not os.path.isdir(args.destination):
    os.makedirs(args.destination)

files1 = ("{}/{}".format(args.folder1, file) for file in sorted(os.listdir(args.folder1),key=lambda s: s.lower()))
files2 = ("{}/{}".format(args.folder2, file) for file in sorted(os.listdir(args.folder2),key=lambda s: s.lower()))

i = 0
def copy(file):
    if file is None:
        return
    global i
    i += 1
    extension = file.split('.')[-1]
    new_file = "{}/file{}.{}".format(args.destination, str(i).zfill(2), extension)
    shutil.copyfile(file, new_file)

for file1, file2 in itertools.izip_longest(files1, files2):
    copy(file1)
    copy(file2)
