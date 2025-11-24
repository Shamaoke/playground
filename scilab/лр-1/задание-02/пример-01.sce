
///
/// ::: Пример 1. Найти значение выражения :::
///

function [y1, y2, y3] = f(x1, x2, x3)

  y1 = sin(x1) + cos(x1)
  y2 = sin(x2) + cos(x2)
  y3 = sin(x3) + cos(x3)

endfunction

[x1, x2, x3] = f(0, 2, 2 * %pi)

clear f;

