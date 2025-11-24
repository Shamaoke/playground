
///
/// ::: Пример 5. Построение графиков функций с использованием легенд :::
///

x = -2.0 * %pi:0.1:2.0 * %pi;
y = [sin(x); cos(x)];

plot2d(x, y', style = [color("red"), color("blue")], axesflag = 5, leg = "sin(x)@cos(x)");

