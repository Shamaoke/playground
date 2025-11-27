
///
/// ::: Пример 1. Программа использования операций `min` и `max` :::
///

x = -10.0:0.1:10.0;

y1 = gaussmf(x', [3.0, 0.2]);
y2 = gaussmf(x', [7.0, 0.1]);

yy1 = tnorm([y1, y2], 'min');
yy2 = snorm([y1, y2], 'max');
yy3 = tnorm([y1, y2], 'dprod');
yy4 = snorm([y1, y2], 'dsum');

subplot(3, 1, 1);
plot2d(x', [y1, y2], leg = "mf1@mf2", rect = [-10.0, -0.1, 10.0, 1.1]);
xtitle('Вычисление функции принадлежности', 'x', 'μ(x)');

subplot(3, 1, 2);
plot2d(x', [yy1, yy3], leg = "min@dprod", rect = [-10.0, -0.1, 10.0, ...
1.1]);
xtitle('Операция конъюнкции', 'x', 'and(mf1, mf2)');

subplot(3, 1, 3);
plot2d(x', [yy2, yy4], leg = "max@dsum", rect = [-10.0, -0.1, 10.0, ...
1.1]);
xtitle('Операция дизъюнкции', 'x', 'or(mf1, mf2)');


