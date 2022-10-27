--ĆWICZENIE 1

--1 Napisz polecenie, które oblicza wartość sprzedaży dla każdego zamówienia i zwraca wynik posortowany w malejącej kolejności (wg wartości sprzedaży).
select OrderID, sum(Quantity * UnitPrice * (1 - Discount)) from [Order Details] group by OrderID order by 2 desc

--2 Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało pierwszych 10 wierszy
select top 10 OrderID, sum(Quantity * UnitPrice * (1 - Discount)) from [Order Details] group by OrderID order by 2 desc


--ĆWICZENIE 2

--1 Podaj liczbę zamówionych jednostek produktów dla produktów, dla których productid < 3
select ProductID, sum(quantity) from [Order Details] where ProductID < 3 group by ProductID

--2 Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawało liczbę zamówionych jednostek produktu dla wszystkich produktów
select ProductID, sum(quantity) from [Order Details] group by ProductID

--3 Podaj nr zamówienia oraz wartość zamówienia, dla zamówień, dla których łączna liczba zamawianych jednostek produktów jest > 250
select OrderID, sum(Quantity * UnitPrice * (1 - Discount)) from [Order Details] group by OrderID having sum(Quantity) > 250


--ĆWICZENIE 3

--1 Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień
select EmployeeID, count(*) from Orders group by EmployeeID

--2 Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień
select ShipVia, sum(Freight) as "opłata za przesyłkę" from Orders group by ShipVia order by ShipVia

--3 Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień w latach o 1996 do 1997
select ShipVia, sum(Freight) as "opłata za przesyłkę" from Orders where year(OrderDate) between 1996 and 1997 group by ShipVia order by ShipVia


--ĆWICZENIE 4

--1 Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z podziałem na lata i miesiące
select EmployeeID, year(OrderDate) as "ROK", month(OrderDate) as "MSC", count(*) as "LICZBA"
    from Orders group by EmployeeID, year(OrderDate), month(OrderDate)
    order by EmployeeID, year(OrderDate), month(OrderDate)

--2 Dla każdej kategorii podaj maksymalną i minimalną cenę produktu w tej kategorii
select CategoryID, max(UnitPrice) as "max", min(UnitPrice) as "min" from Products group by CategoryID
