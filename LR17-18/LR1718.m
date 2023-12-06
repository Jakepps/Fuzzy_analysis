% Генерация обучающих данных
x1 = linspace(-1, 1, 100);
x2 = linspace(-1, 1, 100);
[X1, X2] = meshgrid(x1, x2);
d = (1 + X1.^2) + (1 - X2).^2;
data = [X1(:), X2(:), d(:)];

% Сохранение обучающих данных в файл
save('training_data.dat', 'data', '-ascii');

% Загрузка обучающих данных
data = load('training_data.dat');

% Обучение ННС
options = anfisOptions('Epoch', 100);
%opt.NumMembershipFunctions = [3 5 7];
opt.InputMembershipFunctionType = ["gaussmf" "trimf" "trapmf"];
fis_optimized = anfis(data, options);

% Оценка адекватности
output = evalfis([X1(:), X2(:)], fis_optimized);
error = d(:) - output;

% Создание таблицы с результатами
results_table = table(X1(:), X2(:), d(:), output, error, 'VariableNames', {'x1', 'x2', 'd_exact', 'output', 'error'});

% Вывод таблицы
%disp(results_table);
%writetable(results_table, 'results_table.csv');