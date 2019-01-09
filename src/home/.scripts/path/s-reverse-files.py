#!/usr/bin/env python

import os

def count():
    i = 0;
    while True: i += 1; yield i

files = sorted(os.listdir('.'), key=lambda s: s.lower())
transformations = zip(files, ('tmp{}'.format(i) for i in count()), reversed(files))

for A, B, _ in transformations:
    print("{} -> {}".format(A, B))
    os.rename(A, B)

print("")

for _, A, B in transformations:
    print("{} -> {}".format(A, B))
    os.rename(A, B)
