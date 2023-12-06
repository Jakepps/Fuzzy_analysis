w = [1; 10];
b = 3;

X = [-2 1; 1 -2; 3 -1; 2 2];
target_outputs = [0; 0; 0; 1];

epochs = 1000;
learning_rate = 0.1;
max_error = 0.01;

for epoch = 1:epochs
    total_error = 0;
    for i = 1:size(X, 1)
        activation_function = @(x) double(x >= 0);
        output = activation_function(X(i, :) * w + b);

        error = target_outputs(i) - output;
        total_error = total_error + abs(error);

        w = w + learning_rate * error * X(i, :)';
     b = b + learning_rate * error;
    end

    average_error = total_error / size(X, 1);
    disp(['Эпоха ' num2str(epoch) ', Средняя ошибка: ' num2str(average_error)]);

    if average_error < max_error
    disp(['Обучение завершено на эпохе ' num2str(epoch)]);
    break;
    end
end

disp('Веса:');
disp(w);
disp('Смещение:');
disp(b);