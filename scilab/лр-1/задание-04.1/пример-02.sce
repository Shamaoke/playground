
///
/// ::: Пример 2. Использование параметра `rect` в функции `plot2d` :::
///

x = -2.0 * %pi:0.1:2.0 * %pi;

y = [sin(x); cos(x)];

plot2d(x, y', style = [color("red"), color("blue")], rect = [-8, -2, 8, 2]);

