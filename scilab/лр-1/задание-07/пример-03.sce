
///
/// ::: Пример 3. Построение шести графиков в одном окне :::
///

x = -10.0:0.01:10;

y = sin(x);
z = cos(x);
u = cos(sin(x));
v = sin(cos(x));
w = exp(sin(x));
r = exp(cos(x));

subplot(3, 2, 1);
plot(x, y);
xtitle('Функция y=sin(x)', 'X', 'Y');

subplot(3, 2, 2);
plot(x, z);
xtitle('Функция z=cos(x)', 'X', 'Z');

subplot(3, 2, 3);
plot(x, u);
xtitle('Функция u=cos(sin(x))', 'X', 'U');

subplot(3, 2, 4);
plot(x, v);
xtitle('Функция v=sin(cos(x))', 'X', 'V');

subplot(3, 2, 5);
plot(x, w);
xtitle('Функция w=exp(sin(x))', 'X', 'W');

subplot(3, 2, 6);
plot(x, r);
xtitle('Функция r=exp(cos(x))', 'X', 'R');

