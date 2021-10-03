#!/bin/python3
ignore = {'_', '\n'}
with open("./alu-tests.tv") as f:
    for l in f:
        s = bin(int(''.join(c for c in filter(lambda x: x not in ignore, l)), 16))[2:]
        print(s)
