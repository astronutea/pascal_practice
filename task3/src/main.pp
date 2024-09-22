program FunctionTabulation;

uses
  crt, math, sysutils;

var
  a, b, step: Real;
  x: Real;
  i, n: Integer;
  sinValue, lnValue: Real;
  signChangeSin, signChangeLn: Integer;
  previousSin, previousLn: Real;
  isFirstSin, isFirstLn: Boolean;

begin
  clrscr;

  // Ввод диапазона и шага
  Write('Введите начало интервала a: ');
  ReadLn(a);
  Write('Введите конец интервала b: ');
  ReadLn(b);
  Write('Введите шаг: ');
  ReadLn(step);

  // Инициализация значений
  n := Trunc((b - a) / step) + 1; // Количество точек
  signChangeSin := 0; // Счетчик перемен знака для Sin
  signChangeLn := 0; // Счетчик перемен знака для Ln
  isFirstSin := True; // Флаг для первого значения Sin
  isFirstLn := True;  // Флаг для первого значения Ln

  // Вывод заголовка таблицы
  WriteLn('Номер         Значение          Функция         Функция ');
  WriteLn('точки           аргумента            Sin(x)               Ln(x)');
  WriteLn('-------------------------------------------------------------------');

  // Цикл табулирования
  for i := 0 to n - 1 do
  begin
    x := a + i * step;
    
    // Вычисляем значение Sin(x)
    sinValue := Sin(x);
    
    // Проверяем, можно ли вычислить Ln(x)
    if x > 0 then
    begin
      lnValue := Ln(x);
    end
    else
    begin
      lnValue := NaN; // Неопределенное значение для Ln(x)
    end;

    // Проверка на изменение знака Sin
    if isFirstSin then
    begin
      previousSin := sinValue;
      isFirstSin := False;
    end
    else if (previousSin >= 0) and (sinValue < 0) or (previousSin < 0) and (sinValue >= 0) then
    begin
      Inc(signChangeSin);
    end;
    previousSin := sinValue;

    // Проверка на изменение знака Ln
    if x > 0 then // Ln(x) определено только для x > 0
    begin
      if isFirstLn then
      begin
        previousLn := lnValue;
        isFirstLn := False;
      end
      else if (previousLn >= 0) and (lnValue < 0) or (previousLn < 0) and (lnValue >= 0) then
      begin
        Inc(signChangeLn);
      end;
      previousLn := lnValue;
    end;

    // Вывод значений в таблицу
    Write(Format('%5d', [i + 1]));
    Write(Format('%15.2f', [x]));

    // Sin(x)
    if isFirstSin or (i = n - 1) then
      Write(Format('%20s', ['-']))
    else
      Write(Format('%20.6f', [sinValue]));

    // Ln(x)
    if x <= 0 then
      Write(Format('%20s', ['*']))
    else
      Write(Format('%20.6f', [lnValue]));

    WriteLn;
  end;

  WriteLn('-------------------------------------------------------------------');
  
  // Вывод количества перемен знака
  if (signChangeSin = 0) and (signChangeLn = 0) then
    WriteLn('Обе функции не меняют знак на заданном интервале.')
  else
  begin
    WriteLn('Количество перемен знака Sin(x): ', signChangeSin);
    WriteLn('Количество перемен знака Ln(x): ', signChangeLn);
  end;

  ReadLn; // Ожидание нажатия клавиши
end.
