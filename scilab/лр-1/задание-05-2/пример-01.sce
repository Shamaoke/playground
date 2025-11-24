
///
/// ::: Пример 2. Построение полярного графика функции ρ = 1 + sin(φ) :::
///

phi = 0.0:0.01:2.0 * %pi;

rho = 1 + sin(phi);

polarplot(phi, rho, style = color("red"));

