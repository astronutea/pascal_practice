program SeriesSum;

uses
  SysUtils, Math;

function Factorial(n: Integer): Real;
begin
  if n = 0 then
    Factorial := 1.0
  else
    Factorial := n * Factorial(n - 1);
end;

var
  x: Real;
  n, i: Integer;
  term, sum, exactValue, absError, relError: Real;

begin
  Write('Введите значение x: ');
  ReadLn(x);
  Write('Введите количество членов ряда n: ');
  ReadLn(n);

  // Инициализация
  sum := 0.0;

  Writeln('Номер     Значение                Частичная сумма');
  Writeln('------------------------------------------------');

  for i := 0 to n - 1 do
  begin
    // Определение знака в зависимости от номера члена
    if i mod 2 = 0 then
      term := Power(x, 2 * i) / Factorial(2 * i) // Положительный член
    else
      term := -Power(x, 2 * i) / Factorial(2 * i); // Отрицательный член

    sum := sum + term;

    // Вывод текущего члена и частичной суммы
    Writeln(Format('%-10d %-20f %-20f', [i + 1, term, sum]));
  end;

  // Точное значение суммы ряда
  exactValue := Cos(x);

  // Абсолютная ошибка
  absError := Abs(exactValue - sum);

  // Относительная ошибка
  if exactValue <> 0 then
    relError := Abs(absError / exactValue)
  else
    relError := 0.0;

  // Вывод результатов
  Writeln('------------------------------------------------');
  Writeln(Format('Приближенное значение суммы: %f', [sum]));
  Writeln(Format('Точное значение суммы: %f', [exactValue]));
  Writeln(Format('Абсолютная ошибка: %f', [absError]));
  Writeln(Format('Относительная ошибка: %f', [relError]));
end.
