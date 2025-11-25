
///
/// ::: Пример 5. Построение графиков ФП `sigmf`, `dsigmf` и
///     `psigmf` (вариант 2) :::
///

x = linspace(0.0, 1.0, 100.0);

sig1 = sigmf(x', [12.0, 0.4]);
sig2 = sigmf(x', [-12.0, 0.6]);

psig = psigmf(x', [15.0, 0.6, -15.0, 0.8]);

dsig = dsigmf(x', [15.0, 0.2, 15.0, 0.4]);

plot2d(x', [sig1, sig2, psig, dsig], leg = "sig1@sig2@psig@dsig");

xtitle('Сигмоидные функции принадлежности', 'x', 'μ(x)');

