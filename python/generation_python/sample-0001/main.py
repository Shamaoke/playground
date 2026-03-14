
def diff(x, y):
    return x - y

result1 = diff(10, 3)

# print(result1)

result2 = diff(x=10, y=3)

# print(result2)

result3 = diff(y=3, x=10)

# print(result3)

result4 = diff(10, y=3)

# print(result4)

num = int('101', 2)

# print(num)

def add(n, m=0):
    return n + m

# print(add(1))
# print(add(1))
# print(add(1))

def append(e, l=[]):
    l.append(e)
    return l

# print(append(1))
# print(append(2))
# print(append(3))

def append2(e, l=None):
    if l is None: l = []
    l.append(e)
    return l

# print(append2(1))
# print(append2(2))
# print(append2(3))

# def fancy(length, char1, char2):
#     return (char1 + char2) * length + char1
#
# print(fancy(5, '-', '*'))

# def fancy(length, char1='-', char2='*'):
#     return (char1 + char2) * length + char1
#
# print(fancy(3))

def fancy(length, char1='-', char2='*'):
    return (char1 + char2) * length + char1

print(fancy(char2='$', length=3))

