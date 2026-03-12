
# s1 = 'python'
# s2 = 'stepicon'
# s3 = 'beegeek'
#
# print(min(s1, s2, s3))
# print(max(s1, s2, s3))

# s1 = 'python'
# s2 = 'stepicon'
# s3 = 'beegeek'
#
# print(min(s1, s2, s3, key=len))
# print(max(s1, s2, s3, key=len))

# def f(x):
#     return x**2
#
# def g(x):
#     return x**3
#
# funcs = [f, g]
#
# print(funcs[0](5), funcs[1](5))

# def comparator(pair):
#     return pair[1]
#
# pairs = [(5, 4), (3, 2), (1, 7), (8, 2)]
#
# pairs.sort(key=comparator)
#
# print(pairs)

# def comparator(pair):
#     return pair[0] + pair[1]
#
# pairs = [(5, 4), (3, 2), (1, 7), (8, 2)]
#
# pairs.sort(key=comparator, reverse=True)
#
# print(pairs)

# words = ['this', 'is', 'a', 'test', 'of', 'sorting']
#
# words.sort(key=len)
#
# print(words)

# def f1(x):
#     return 2*x+1
#
# def f2(x):
#     return x**2
#
# def f3(x):
#     return -x**2+1
#
# def f4(x):
#     return x-3
#
# funcs = [f1, f2, f3, f4]
#
# i = int(input())
#
# print(funcs[i](2))

# numbers = [(0, 0), (1, 1), (2, 2, 2), (3,)]
# numbers = [(-1, 2), (3, 14), (5, 6, 9)]
#
# def get_average(tup):
#     return sum(tup) / len(tup)
#
# min_tuple = min(numbers, key=get_average)
# max_tuple = max(numbers, key=get_average)
#
# print(min_tuple)
# print(max_tuple)

# points = [(3, 4), (-2, 1), (0, 1), (5, 12)]
#
# import math
#
# def distance_to_origin(point):
#     x, y = point
#     return math.sqrt(x**2 + y**2)
#
# sorted_points = sorted(points, key=distance_to_origin)
#
# print(sorted_points)

# def min_max_sum(tup):
#     return min(tup) + max(tup)
#
# sorted_numbers = sorted(numbers, key=min_max_sum)
#
# print(sorted_numbers)

# athletes = [('Дима', 10, 130, 35), ('Тимур', 11, 135, 39), ('Руслан', 9, 140, 33), 
#             ('Рустам', 10, 128, 30), ('Амир', 16, 170, 70), ('Рома', 16, 188, 100), 
#             ('Матвей', 17, 168, 68), ('Петя', 15, 190, 90)]
#
# # Получаем номер поля для сортировки
# field_number = int(input())
#
# # Словарь с соответствием номера поля индексу в кортеже
# # Индексы: 0 - имя, 1 - возраст, 2 - рост, 3 - вес
# field_index = {1: 0, 2: 1, 3: 2, 4: 3}
#
# # Сортируем по указанному полю
# sorted_athletes = sorted(athletes, key=lambda athlete: athlete[field_index[field_number]])
#
# # Выводим отсортированный список
# for athlete in sorted_athletes:
#     print(*athlete, end='\n')
#

# import math
#
# # Определяем функции
# def square(x):
#     return x ** 2
#
# def cube(x):
#     return x ** 3
#
# def root(x):
#     return math.sqrt(x)
#
# def modulus(x):
#     return abs(x)
#
# def sine(x):
#     return math.sin(x)
#
# # Получаем входные данные
# number = int(input())
# function_name = input()
#
# # Словарь с соответствием названия функции и самой функции
# functions = {
#     'квадрат': square,
#     'куб': cube,
#     'корень': root,
#     'модуль': modulus,
#     'синус': sine
# }
#
# # Применяем функцию к числу и выводим результат
# result = functions[function_name](number)
# print(result)

