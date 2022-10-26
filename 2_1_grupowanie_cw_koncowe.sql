--ĆWICZENIE 1

--1 Napisz polecenie, które oblicza wartość sprzedaży dla każdego zamówienia i zwraca wynik posortowany w malejącej kolejności (wg wartości sprzedaży).
select OrderID, sum(Quantity * UnitPrice * (1 - Discount)) from [Order Details] group by OrderID order by 2 desc

--2 Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało pierwszych 10 wierszy
select top 10 OrderID, sum(Quantity * UnitPrice * (1 - Discount)) from [Order Details] group by OrderID order by 2 desc


--ĆWICZENIE 2

--1 Podaj liczbę zamówionych jednostek produktów dla produktów, dla których productid < 3
select ProductID, sum(quantity) from [Order Details] where ProductID < 3 group by ProductID

--2 Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawało liczbę zamówionych jednostek produktu dla wszystkich produktów
select ProductID, sum(quantity) from [Order Details] where ProductID < 3 group by ProductID

--3 Podaj nr zamówienia oraz wartość zamówienia, dla zamówień, dla których łączna liczba zamawianych jednostek produktów jest > 250
select OrderID, sum(Quantity * UnitPrice * (1 - Discount)) from [Order Details] group by OrderID having sum(Quantity) > 250


--ĆWICZENIE 3

--1 Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień
select EmployeeID, count(EmployeeID) from Orders group by EmployeeID

--2 Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień


--3 Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień w latach o 1996 do 1997



--ĆWICZENIE 4

--1 Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z podziałem na lata i miesiące


--2 Dla każdej kategorii podaj maksymalną i minimalną cenę produktu w tej kategorii