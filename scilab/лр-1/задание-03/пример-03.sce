
///
/// ::: Пример 3. Построение графиков нескольких функций в одном окне 2 :::
///

x = -6.28:0.02:6.28;

y = sin(x / 2);
z = cos(x);
v = exp(cos(x));

plot(x, y);

// set(gca(), "auto_clear", "off");

gca().auto_clear = "off";

plot(x, z);

set(gca(), "auto_clear", "off");

plot(x, v);

