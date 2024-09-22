program TriangleAnalysis;

uses math;

type
    TPoint = record
        x, y: integer;
    end;

var
    A, B, C, P: TPoint;
    sideAB, sideBC, sideCA: real;
    areaABC, areaPAB, areaPBC, areaPCA: real;
    inside: boolean;

function Distance(P1, P2: TPoint): real;
begin
    Distance := sqrt(sqr(P1.x - P2.x) + sqr(P1.y - P2.y));
end;

function TriangleArea(P1, P2, P3: TPoint): real;
begin
    TriangleArea := 0.5 * abs(P1.x * (P2.y - P3.y) + 
                               P2.x * (P3.y - P1.y) + 
                               P3.x * (P1.y - P2.y));
end;

begin
    // Ввод координат
    writeln('Введите координаты вершины A (x, y):');
    readln(A.x, A.y);
    writeln('Введите координаты вершины B (x, y):');
    readln(B.x, B.y);
    writeln('Введите координаты вершины C (x, y):');
    readln(C.x, C.y);
    writeln('Введите координаты точки P (x, y):');
    readln(P.x, P.y);

    // Вычисление длин сторон треугольника
    sideAB := Distance(A, B);
    sideBC := Distance(B, C);
    sideCA := Distance(C, A);

    // Вычисление площадей
    areaABC := TriangleArea(A, B, C);
    areaPAB := TriangleArea(P, A, B);
    areaPBC := TriangleArea(P, B, C);
    areaPCA := TriangleArea(P, C, A);

    // Проверка, находится ли точка внутри треугольника
    inside := (areaABC = areaPAB + areaPBC + areaPCA);

    // Определяем вид треугольника
    if (sqr(sideAB) + sqr(sideBC) > sqr(sideCA)) and
       (sqr(sideBC) + sqr(sideCA) > sqr(sideAB)) and
       (sqr(sideCA) + sqr(sideAB) > sqr(sideBC)) then
    begin
        writeln('Треугольник является остроугольным.');
    end else
    begin
        writeln('Треугольник не является остроугольным.');
    end;

    // Вывод таблицы
    writeln('-------------------------------------------------------------------');
    writeln('|  Вершина  |  X  |  Y  |');
    writeln('-------------------------------------------------------------------');
    writeln('|    A     | ', A.x:3, '  | ', A.y:3, '  |');
    writeln('|    B     | ', B.x:3, '  | ', B.y:3, '  |');
    writeln('|    C     | ', C.x:3, '  | ', C.y:3, '  |');
    writeln('|    P     | ', P.x:3, '  | ', P.y:3, '  |');
    writeln('-------------------------------------------------------------------');
    writeln('|  Длина стороны  |   Длина  |');
    writeln('-------------------------------------------------------------------');
    writeln('|    AB    | ', sideAB:7:2, ' |');
    writeln('|    BC    | ', sideBC:7:2, ' |');
    writeln('|    CA    | ', sideCA:7:2, ' |');
    writeln('-------------------------------------------------------------------');
    
    // Вывод информации о местоположении точки
    if inside then
        writeln('Точка P находится внутри треугольника ABC.')
    else
        writeln('Точка P находится вне треугольника ABC.');
end.
