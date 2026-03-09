
##
## Задание №2
## ----------
## Мать и отец являются родителями, а дочь и сын — детьми.
##
## Установить, кто в семье является родителями, а кто — детьми.
##

from pyDatalog import pyDatalog as pdl

pdl.create_terms('X, Y, Z, parent, par, child')

+parent('Анна', 'мать')
+parent('Павел', 'отец')
+parent('Ирина', 'мать')
+parent('Андрей', 'сын')
+parent('Марина', 'дочь')

+par('мать', 'родитель')
+par('отец', 'родитель')
+par('дочь', 'ребенок')
+par('сын', 'ребенок')

child(X, Z) <= parent(X, Y) & par(Y, Z)

print(child(X, Z))

print(('Марина', 'родитель') in child(X, Z).data)
print(('Андрей', 'родитель') in child(X, Z).data)
print(('Павел', 'родитель') in child(X, Z).data)

