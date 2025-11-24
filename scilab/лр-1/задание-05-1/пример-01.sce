
///
/// ::: Пример 1. Построение полярных графиков функции ρ = 3cos(5φ), ρ₁ = 3cos(3φ) :::
///

phi = 0.0:0.01:2.0 * %pi;

rho  = 3 * cos(5 * phi);
rho1 = 3 * cos(3 * phi);

polarplot(phi, rho,  style = color("red"));
polarplot(phi, rho1, style = color("blue"));

