`include "summator.sv"
module sum_numbers_tb;
  
reg clk; //Регистр тактового сигнала (часы)
reg reset; //Регистр сигнала сброса
wire [7:0] sum; //Выходная шина суммы
  
sum_numbers dut ( .clk(clk), .reset(reset), .sum(sum)); //Основной модуль симуляции

initial 
begin
clk = 0; //Инициализация сигнала тактового сигнала
reset = 1; //Сигнала сброса в активном состоянии
#10 reset = 0; //Сигнал сброса в пассивное состояние после 10 единиц времени
$finish(); //Завершение симуляции после 40 единиц времени
end
  
always
#1 clk = ~clk;

endmodule