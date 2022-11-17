--ĆWICZENIE 1--

--1 Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru oraz nazwę klienta.
select o.OrderID, sum(ord.Quantity) as "Liczba sztuk", c.CompanyName from [Order Details] as ord
    inner join Orders as o on ord.OrderID = o.OrderID
    inner join Customers as c on o.CustomerID = c.CustomerID
    group by c.CompanyName, o.OrderID

--2 Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia,
--dla których łączna liczbę zamówionych jednostek jest większa niż 250
select o.OrderID, sum(ord.Quantity) as "Liczba sztuk", c.CompanyName from [Order Details] as ord
    inner join Orders as o on ord.OrderID = o.OrderID
    inner join Customers as c on o.CustomerID = c.CustomerID
    group by c.CompanyName, o.OrderID
    having sum(Quantity) > 250

--3 Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz nazwę klienta.
select o.OrderID, round(sum(ord.Quantity * ord.UnitPrice * (1 - ord.Discount)), 2) as "Łączna cena", c.CompanyName
    from [Order Details] as ord
    inner join Orders as o on ord.OrderID = o.OrderID
    inner join Customers as c on o.CustomerID = c.CustomerID
    group by c.CompanyName, o.OrderID

--4 Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia,
--dla których łączna liczba jednostek jest większa niż 250.
select o.OrderID, round(sum(ord.Quantity * ord.UnitPrice * (1 - ord.Discount)), 2) as "Koszt", c.CompanyName
    from [Order Details] as ord
    inner join Orders as o on ord.OrderID = o.OrderID
    inner join Customers as c on o.CustomerID = c.CustomerID
    group by o.OrderID, c.CompanyName
    having  round(sum(ord.Quantity * ord.UnitPrice * (1 - ord.Discount)), 2) > 250

--5 Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i nazwisko pracownika obsługującego zamówienie
select o.OrderID, round(sum(ord.Quantity * ord.UnitPrice * (1 - ord.Discount)), 2) as "Koszt", c.CompanyName, e.FirstName, e.LastName
    from [Order Details] as ord
    inner join Orders as o on ord.OrderID = o.OrderID
    inner join Customers as c on o.CustomerID = c.CustomerID
    inner join Employees as e on o.EmployeeID = e.EmployeeID
    group by o.OrderID, c.CompanyName, e.FirstName, e.LastName
    having  round(sum(ord.Quantity * ord.UnitPrice * (1 - ord.Discount)), 2) > 250


--ĆWICZENIE 2--

--1 Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez klientów jednostek towarów z tej kategorii.
select C.CategoryName, sum([O D].Quantity) as "Ilość" from Orders O
    inner join [Order Details] [O D] on o.OrderID = [O D].OrderID
    inner join Products P on [O D].ProductID = P.ProductID
    inner join Categories C on P.CategoryID = C.CategoryID
    group by C.CategoryName

--2 Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez klientów jednostek towarów z tej kategorii.
select C.CategoryName, round(sum([O D].Quantity * [O D].UnitPrice * (1 - [O D].Discount)), 2) as "Cena" from Orders O
    inner join [Order Details] [O D] on o.OrderID = [O D].OrderID
    inner join Products P on [O D].ProductID = P.ProductID
    inner join Categories C on P.CategoryID = C.CategoryID
    group by C.CategoryName

--3 Posortuj wyniki w zapytaniu z poprzedniego punktu wg:

--a) łącznej wartości zamówień
select C.CategoryName, round(sum([O D].Quantity * [O D].UnitPrice * (1 - [O D].Discount)), 2) as "Cena" from Orders O
    inner join [Order Details] [O D] on o.OrderID = [O D].OrderID
    inner join Products P on [O D].ProductID = P.ProductID
    inner join Categories C on P.CategoryID = C.CategoryID
    group by C.CategoryName
    order by 2
--b) łącznej liczby zamówionych przez klientów jednostek towarów.

select C.CategoryName, sum([O D].Quantity) as "Ilość" from Orders O
    inner join [Order Details] [O D] on o.OrderID = [O D].OrderID
    inner join Products P on [O D].ProductID = P.ProductID
    inner join Categories C on P.CategoryID = C.CategoryID
    group by C.CategoryName
    order by 2

--4 Dla każdego zamówienia podaj jego wartość uwzględniając opłatę za przesyłkę
select O.OrderID, round(sum([O D].Quantity * [O D].UnitPrice * (1 - [O D].Discount) + O.Freight), 2) as "Koszt" from Orders O
    inner join [Order Details] [O D] on O.OrderID = [O D].OrderID
    group by O.OrderID


--ĆWICZENIE 3

--1 Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r
select s.CompanyName, count(*) as "Liczba zamowien" from Shippers as s
    inner join Orders as o on s.ShipperID = o.ShipVia
    where year(o.ShippedDate) = 1997
    group by CompanyName


--2 Który z przewoźników był najaktywniejszy (przewiózł największą liczbę zamówień) w 1997r, podaj nazwę tego przewoźnika
select top 1 s.CompanyName from Shippers as s
    inner join Orders as o on s.ShipperID = o.ShipVia
    where year(o.ShippedDate) = 1997
    group by CompanyName
    order by count(*) desc

--3 Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika
select e.FirstName, e.LastName, round(sum([O D].Quantity * [O D].UnitPrice * (1 - [O D].Discount)), 2) as "Wartosc" from Employees as e
    inner join Orders as o on e.EmployeeID = o.EmployeeID
    inner join [Order Details] as [O D] on o.OrderID = [O D].OrderID
    group by e.EmployeeID, e.FirstName, e.LastName

--4 Który z pracowników obsłużył największą liczbę zamówień w 1997r, podaj imię i nazwisko takiego pracownika
select top 1 e.FirstName, e.LastName from Employees as e
    inner join Orders as o on e.EmployeeID = o.EmployeeID
    where year(o.OrderDate) = 1997
    group by e.EmployeeID, e.FirstName, e.LastName
    order by count(*) desc

--5 Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o największej wartości) w 1997r,
--podaj imię i nazwisko takiego pracownika
select top 1 e.FirstName, e.LastName from Employees as e
    inner join Orders as o on e.EmployeeID = o.EmployeeID
    inner join [Order Details] as [O D] on o.OrderID = [O D].OrderID
    where year(o.OrderDate) = 1997
    group by e.EmployeeID, e.FirstName, e.LastName
    order by round(sum([O D].Quantity * [O D].UnitPrice * (1 - [O D].Discount) + O.Freight), 2) desc


--ĆWICZENIE 4

--1 Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika,
--ogranicz wynik tylko do pracowników:

--a) którzy mają podwładnych
select e.EmployeeID, e.FirstName, e.LastName, round(sum([O D].Quantity * [O D].UnitPrice * (1 - [O D].Discount)), 2)
from Employees as e
left outer join Employees as c on e.EmployeeID = c.ReportsTo
inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as [O D] on o.OrderID = [O D].OrderID
group by e.EmployeeID, e.FirstName, e.LastName, c.ReportsTo
having isnull(c.ReportsTo, 0) != 0

--b) którzy nie mają podwładnych
select e.EmployeeID, e.FirstName, e.LastName, round(sum([O D].Quantity * [O D].UnitPrice * (1 - [O D].Discount)), 2)
from Employees as e
left outer join Employees as c on e.EmployeeID = c.ReportsTo
inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as [O D] on o.OrderID = [O D].OrderID
group by e.EmployeeID, e.FirstName, e.LastName, c.ReportsTo
having isnull(c.ReportsTo, 0) = 0
