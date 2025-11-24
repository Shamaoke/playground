
///
/// ::: Пример 3. Параметр `axesflag = 0` в функции `plot2d` :::
///

x = -2.0 * %pi:0.1:2.0 * %pi;

y = [sin(x); cos(x)];

plot2d(x, y', style = [color("red"), color("blue")], axesflag = 0);

// plot2d(x, y', style = [color("red"), color("blue")], axesflag = 1);

// plot2d(x, y', style = [color("red"), color("blue")], axesflag = 3);

// plot2d(x, y', style = [color("red"), color("blue")], axesflag = 5);

