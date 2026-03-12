
# def f(n=3):
#     return n + 7
#
# print(f(f(f())))

# def func(x, y, *args):
#     return len(args)
#
# print(func(10, 20, 30, 40, 50, 60))

# def func(*args):
#     return max(args) + min(args)
#
# print(func(10, 15, *[31, 42, 5, 1], *(17, 28, 19, 100), 13, 12))

# def count_args(*args): return len(args)
#
# print(count_args('stepik', 'beegeek'))
#
# print(count_args([], (''), 'a', 12, False))

# def sq_sum(*args): return sum(arg ** 2 for arg in args)
#
# print(sq_sum(1, 2, 3))
#
# print(sq_sum(1.5, 2.5))

# def mean(*args):
#     numeric_args = [arg for arg in args if isinstance(arg, (int, float)) and not isinstance(arg, bool)]
#
#     if not numeric_args:
#         return 0
#
#     return sum(numeric_args) / len(numeric_args)
#
# print(mean(1.5, True, ['stepik'], 'beegeek', 2.5, (1, 2)))
#
# print(mean(-1, 2, 3, 10, ('5')))

# def greet(*names):
#     if len(names) == 1:
#         return f"Hello, {names[0]}!"
#     else:
#         return f"Hello, {' and '.join(names[:-1])} and {names[-1]}!"
#
# print(greet('Timur'))
#
# print(greet('Timur', 'Roman'))
#
# print(greet('Timur', 'Roman', 'Ruslan'))

# def print_products(*args):
#     products = [arg for arg in args if isinstance(arg, str) and arg]
#
#     if not products:
#         print("Нет продуктов")
#     else:
#         for index, product in enumerate(products, start=1):
#             print(f"{index}) {product}")
#
# print_products('Бананы', [1, 2], ('Stepik'), 'Яблоки', '', 'Макароны', 5, True)
#
# print_products([4], {}, 1, 2, {'Beegeek'}, '')

def info_kwargs(**kwargs):
    for key in sorted(kwargs.keys()):
        print(f"{key}: {kwargs[key]}")

info_kwargs(first_name='Timur', last_name='Guev', age=28, job='teacher')

info_kwargs(city='Perm', name='Tony', height=175)

