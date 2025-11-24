
///
/// ::: Пример 2. Пример построения черырех осей координат в графическом окне и
///     вывода в каждую из них соответствующего графика с использованием функции
///     `plotframe` (функция устарела, отсутствует в Scilab версии 2026.0.0) :::
///

x = -10.0:0.01:10.0;

y = sin(2 * x);
z = cos(3 * x);
u = cos(sin(2 * x));
v = sin(cos(3 * x));

rect = [min(x), -1, max(x), 1];
tics = [2, 11, 10, 5];

try
  plotframe(rect, tics, [%t, %t], ['Функция y=sin(2x)', 'X', 'Y'], [0, 0, 0.5, 0.5]);
  plot(x, y);
catch
  disp(lasterror());
end

try
  plotframe(rect, tics, [%f, %f], ['Функция y=cos(3x)', 'X', 'Z'], [0.5, 0, 0.5, 0.5]);
  plot(x, z)
catch
  disp(lasterror());
end

try
  plotframe(rect, tics, [%f, %f], ['Функция y=cos(sin(2x))', 'X', 'U'], [0, 0.5, 0.5, 0.5]);
  plot(x, u)
catch
  disp(lasterror());
end

try
  plotframe(rect, tics, [%t, %t], ['Функция y=sin(cos(3x))', 'X', 'V'], [0.5, 0.5, 0.5, 0.5]);
  plot(x, v)
catch
  disp(lasterror());
end

