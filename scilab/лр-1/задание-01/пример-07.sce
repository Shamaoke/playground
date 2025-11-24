
///
/// ::: Пример 7. Переменные в Scilab 2 :::
///

x = 3;
y = -1;

clear x;

try
  x
catch
  disp(lasterror())
end

y

a = 1;
b = 2;

clear;

try
  a
catch
  disp(lasterror())
end

try
  b
catch
  disp(lasterror())
end

