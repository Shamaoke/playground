
##
## Задание №1
## ----------
## Я съел 3 свиные отбивные, 4 бараньи отбивные, 2 банки гороха и одну банку фасоли.
##
## Сколько мяса и овощей я съел?
##
## Свинина и баранина — это мясо; горох и фасоль — овощи.
##

from pyDatalog import pyDatalog as pdl

pdl.create_terms('F, G, Q, what, eat')

+what('pork', 'meat')
+what('lamb', 'meat')
+what('peas', 'vegetable')
+what('beans', 'vegetable')

+eat('pork', 3)
+eat('lamb', 4)
+eat('peas', 2)
+eat('beans', 1)

pdl.create_terms('geat, sumg, qtys')

geat(G, Q) <= (what(F, G) & eat(F, Q))

(sumg[G] == sum_(Q, for_each = G)) <= geat(G, Q)

qtys(G, Q) <= (sumg[G] == Q)

print(geat('meat', Q))
print(geat('vegetable', Q))

result = qtys(G, Q).data

print(result)

