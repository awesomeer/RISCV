import sys


VALID_CHAR = '0123456789abcdef'
print("memory_initialization_radix=16;")
print("memory_initialization_vector=")

inf = open(sys.argv[1], 'r')
lines = inf.readlines()
for line in lines:
    tokens = line.split()
    if tokens == [] or tokens[0][0:2] != "0x":
        continue

    tokens = tokens[1:-1]
    for token in tokens:
        if not all(c in VALID_CHAR for c in token):
            break
        
        print(token[6:], end='')
        print(token[4:6], end='')
        print(token[2:4], end='')
        print(token[0:2])


print("00000013")
print("00000013")
print("00000013")
print("00000013")
print(";")


