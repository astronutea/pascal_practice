program QuadrilateralType;

uses math;

type
    TPoint = record
        x, y: integer;
    end;

var
    A, B, C, D: TPoint;
    sideAB, sideBC, sideCD, sideDA: real;
    diagAC, diagBD: real;
    isRectangle, isSquare, isParallelogram: boolean;

function Distance(P1, P2: TPoint): real;
begin
    Distance := sqrt(sqr(P1.x - P2.x) + sqr(P1.y - P2.y));
end;

function IsParallel(P1, P2, P3, P4: TPoint): boolean;
var
    slope1, slope2: real;
    isVertical1, isVertical2: boolean;
begin
    // Проверка вертикальности отрезков
    isVertical1 := (P2.x = P1.x);
    isVertical2 := (P4.x = P3.x);

    // Функция определяет, параллельны ли две прямые
    if isVertical1 and isVertical2 then
        IsParallel := true // Оба вертикальны
    else if isVertical1 or isVertical2 then
        IsParallel := false // Один из них вертикален
    else
    begin
        slope1 := (P2.y - P1.y) / (P2.x - P1.x);
        slope2 := (P4.y - P3.y) / (P4.x - P3.x);
        IsParallel := (slope1 = slope2); // Если наклоны равны
    end;
end;

begin
    // Ввод координат
    writeln('Введите координаты точки A (x, y):');
    readln(A.x, A.y);
    writeln('Введите координаты точки B (x, y):');
    readln(B.x, B.y);
    writeln('Введите координаты точки C (x, y):');
    readln(C.x, C.y);
    writeln('Введите координаты точки D (x, y):');
    readln(D.x, D.y);

    // Вычисление длин сторон
    sideAB := Distance(A, B);
    sideBC := Distance(B, C);
    sideCD := Distance(C, D);
    sideDA := Distance(D, A);

    // Проверка на параллельность сторон
    isParallelogram := IsParallel(A, B, C, D) or IsParallel(B, C, D, A);

    // Проверка на квадрат или прямоугольник
    diagAC := Distance(A, C);
    diagBD := Distance(B, D);
    isRectangle := (sideAB = sideCD) and (sideBC = sideDA) and (diagAC = diagBD);

    // Проверка на квадрат
    isSquare := isRectangle and (sideAB = sideBC);

    // Определение типа четырехугольника
    if isParallelogram then
    begin
        if isRectangle then
        begin
            if isSquare then
                writeln('Фигура является квадратом.')
            else
                writeln('Фигура является прямоугольником.')
        end
        else
            writeln('Фигура является параллелограммом.');
    end
    else if (IsParallel(A, B, C, D) or IsParallel(B, C, D, A)) then
        writeln('Фигура является трапецией.')
    else
    begin
        writeln('Фигура не является квадратом, прямоугольником, параллелограммом, или трапецией.');
        exit;
    end;

    // Вывод таблицы
    writeln('-----------------------------------------------------');
    writeln('|  Сторона    |   Длина    |');
    writeln('-----------------------------------------------------');
    writeln('|    AB     |  ', sideAB:9:2, ' |');
    writeln('|    BC     |  ', sideBC:9:2, ' |');
    writeln('|    CD     |  ', sideCD:9:2, ' |');
    writeln('|    DA     |  ', sideDA:9:2, ' |');
    writeln('-----------------------------------------------------');
end.
