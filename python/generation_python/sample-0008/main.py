
# numbers = [1, 2, 3, 4, 5, 6]
#
# for index, elem in enumerate(numbers):
#     if elem % 2 == 0:
#         numbers[index] *= 2
#
# print(numbers)

# numbers = [10, 30, 20, 50, 40, 60, 70, 80]
#
# total = 0
#
# for index, number in enumerate(numbers, 1):
#     if index % 2 == 0:
#         total += number
#
# print(total)

list1 = [1, 2, 3, 4, 5]
list2 = [5, 4, 3, 2, 1]

result = 0

for x, y in zip(list1, list2):
    result += x*y

print(result)

