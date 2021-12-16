import sys

VALID_CHAR = '0123456789abcdef'

def output(file: str):
    inf = open(file, 'r')

    lines = inf.readlines()

    for line in lines:
        tokens = line.split()
        if tokens == [] or tokens[0][0:2] != "0x":
            continue

        tokens = tokens[1:-1]
        for token in tokens:
            if not all(c in VALID_CHAR for c in token) or len(token) < 8:
                break
            print(token[6:], end='')
            print(token[4:6], end='')
            print(token[2:4], end='')
            print(token[0:2])


for argv in sys.argv[1:]:
    output(argv)

print("00000013")
print("00000013")
print("00000013")
print("00000013")


