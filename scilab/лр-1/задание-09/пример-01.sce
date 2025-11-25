
///
/// ::: Пример 1. Построение графика поверхности сферы x(u, v) = cos(u)cos(v),
///     y(u, v) = cos(u)sin(v), z(u, v) = sin(u) :::
///

u = linspace(-%pi / 2, %pi / 2, 40);
v = linspace(0, 2 * %pi, 20);

x = cos(u)' * cos(v);
y = cos(u)' * sin(v);
z = sin(u)' * ones(v);

plot3d3(x, y, z);

