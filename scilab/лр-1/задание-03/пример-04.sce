
///
/// Пример 4. Построение графиков нескольких функций в одном окне 3 :::
///

x = -6.28:0.02:6.28;

y = sin(x/2);

plot(x, y, "r-");

gca().auto_clear = "off";

z = cos(x);

plot(x, z, "k:");

gca().auto_clear = "off";

v = exp(cos(x));

plot(x, v, "b-");

