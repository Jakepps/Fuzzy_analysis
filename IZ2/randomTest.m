% Параметры для генерации случайных значений
numCases = 10;
tWater_values = randi([-25, 30], 1, numCases);
V_values = randi([-25, 30], 1, numCases);
Press_values = randi([0, 100], 1, numCases);
VolumeW_values = randi([1, 10], 1, numCases);

% Инициализация массива для хранения результатов
fisoutputs = zeros(1, numCases);

% Цикл для вычисления выходов для каждого случая
for i = 1:numCases
    fisoutputs(i) = evalfis([tWater_values(i), V_values(i), Press_values(i), VolumeW_values(i)], Boiler);
end

% Вывод результатов в виде таблицы
tableInputs = table(tWater_values', V_values', Press_values', VolumeW_values', 'VariableNames', {'tWater', 'V', 'Press', 'VolumeW'});
tableOutputs = table(fisoutputs', 'VariableNames', {'Output'});
resultTable = [tableInputs, tableOutputs];

% Отображение таблицы
disp(resultTable);
