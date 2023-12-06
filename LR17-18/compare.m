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

% Варианты типов функций принадлежности
membership_functions = ["gaussmf", "trimf", "trapmf"];

% Инициализация ячеек для хранения результатов
output_cell = cell(length(membership_functions), 1);
error_cell = cell(length(membership_functions), 1);

% Обучение и оценка адекватности для каждого типа функции принадлежности
for i = 1:length(membership_functions)
    options = anfisOptions('Epoch', 100);
    opt.NumMembershipFunctions = [3 5 5];
    opt.InputMembershipFunctionType = repmat(membership_functions(i), 1, 3);
    fis_optimized = anfis(data, options, opt);

    % Оценка адекватности
    output = evalfis([X1(:), X2(:)], fis_optimized);
    error = d(:) - output;

    % Сохранение результатов в ячейки
    output_cell{i} = output;
    error_cell{i} = error;
end

% Создание таблицы с результатами
results_table = table(repelem(X1(:), length(membership_functions)), ...
                      repelem(X2(:), length(membership_functions)), ...
                      repmat(d(:), length(membership_functions), 1), ...
                      cell2mat(output_cell), cell2mat(error_cell), ...
                      repelem(membership_functions', length(X1(:)), 1), ...
                      'VariableNames', {'x1', 'x2', 'd_exact', 'output', 'error', 'membership_function'});

% Вывод таблицы
disp(results_table);
writetable(results_table, 'results_table.csv');
