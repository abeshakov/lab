module sum_numbers ( //Модуль для суммирования чисел
input wire clk, //Входной тактовый сигнал
input wire reset, //Сброс
output reg [7:0] sum //Выходной регистр суммы
);

reg [7:0] numbers [0:7];
reg [7:0] temp_sum;
reg [2:0] step;

initial //Начальный блок
begin //Инициализация массива чисел
numbers[0] = 1; 
numbers[1] = 5;
numbers[2] = 9;
numbers[3] = 2;
numbers[4] = 6;
numbers[5] = 7;
numbers[6] = 1;

sum = 0; //Инициализация выходной суммы
temp_sum = numbers[0];
step = 0;

//$display("Step %d: Sum = %d", step, temp_sum); //Отображение информации о текущем шаге и временной сумме

while (step < 6) //Цикл для суммирования чисел
begin 
step = step + 1; //Увеличение значения регистра шага на единицу
temp_sum = temp_sum + numbers[step]; //Добавление следующего числа из массива к временной сумме
$display("Step %d: Sum = %d", step, temp_sum);
end
end

always @(posedge clk) begin //блок положительной тактовой частоты clk
if (reset) //если активен сигнал сброса, то
begin 
sum <= 0; //обнуляем выходную сумму
temp_sum <= 0; //обнуляем временную сумму
step <= 0; //обнуляем регистр шага
end 
else 
begin
sum <= temp_sum; //Задаем выходную сумму равной временной сумме
end
end

endmodule