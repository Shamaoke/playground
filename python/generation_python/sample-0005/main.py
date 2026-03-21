
# l = [0, 1, 2, 3, 4]
#
# it = map(lambda e: e + len(l), l)
#
# print([e for e in it])
# print(list(it))

# import operator as op
#
# result = op.add(1, 2)
#
# print(result)

# l = [0, 1]
#
# it = map(lambda e: e + len(l), l)
#
# from operator import add
#
# result = add(*it)
#
# print(result)

# iterable = ['1', '2', '3']
#
# result = list(map(len, iterable))
#
# print(result)

# iterable = [[1], [2], [3]]
#
# result = list(map(len, iterable))
#
# print(result)

# iterable = [1, 2, 3]
#
# result = list(map(len, iterable))
#
# print(result)

# def is_a_student(score): return score > 75
#
# scores = [66, 90, 68, 59, 76, 60, 88, 74, 81, 65, 75]
#
# over_75 = list(filter(is_a_student, scores))
#
# print(over_75)

# listA = [2, 3, 4]
# listB = [3, 2, 1]
#
# result = sum(map(pow, listA, listB))
#
# print(result)

# from operator import mul
# from functools import reduce
#
# result = reduce(mul, range(1, 6))
#
# print(result)

# from operator import add
#
# result = list(map(add, 'abc', '1234'))
#
# print(result)

# from operator import add
# from functools import reduce
#
# result = reduce(add, [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
#
# print(result)

print(list(range(1, 6)))

