#!/bin/python3

#ignore = {'_', '\n'}
def hexToBin(hs):
    return bin(int(hs, 16))[2:]

def main():
    with open("./alu-tests.tv") as f:
        for l in f:
            #s = bin(int(''.join(c for c in filter(lambda x: x not in ignore, l)), 16))[2:]
            s = '_'.join(map(hexToBin, l.split('_')))
            print(s)

if __name__=="__main__":
    main()
