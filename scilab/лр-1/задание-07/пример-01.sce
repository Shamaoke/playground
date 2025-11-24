
///
/// ::: Пример 1. Пример оформления графика :::
///

x = -10.0:0.01:10.0;
y = sin(cos(x));
z = cos(sin(x));

plot(x, y, "r", x, z, "b");

xgrid();

xtitle('График y=f(x)', 'X', 'Y');

legend('sin(cos(x))', 'cos(sin(x))', 3, %f)

