
///
/// ::: Пример 18. Поиск корней кубического уравнения :::
///

function [x1, x2, x3] = f(a, b, c, d)

  r = b / a;
  s = c / a;
  t = d / a;

  p = (3 * s - r ^ 2) / 3;
  q = 2 * r ^ 3 / 27 - r * s / 3 + t;

  D = (p / 3) ^ 3 + (q / 2) ^ 2;

  u = (-q / 2 + sqrt(D)) ^ (1 / 3);
  v = (-q / 2 - sqrt(D)) ^ (1 / 3);

  y1 = u + v;
  y2 = -(u + v) / 2 + (u - v) / 2 * %i * sqrt(3);
  y3 = -(u + v) / 2 - (u - v) / 2 * %i * sqrt(3);

  x1 = y1 - r / 3;
  x2 = y2 - r / 3;
  x3 = y3 - r / 3;

endfunction

[x1, x2, x3] = f(3, -20, -3, 4)

clear f;

