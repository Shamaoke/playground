
///
/// ::: Пример 3. Построение полярного графика функции ρ = 1 + cos(2φ) :::
///

phi = 0.0:0.01:2.0 * %pi;

rho = 1 + cos(2 * phi);

polarplot(phi, rho, style = color("blue"));

