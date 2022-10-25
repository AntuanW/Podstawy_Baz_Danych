--Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie
select CompanyName, Address from Customers where City = 'London'

--Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w Hiszpanii

select CompanyName, Address from Customers where Country = 'France' or Country = 'Spain'

--Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20 a 30
select ProductName, UnitPrice from Products where UnitPrice between 20.00 and 30.00

--Wybierz nazwy i ceny produktów z kategorii ‘meat’
select * from Categories
select ProductName, UnitPrice from Products where ProductID = 6

--Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’
select * from Suppliers
select ProductName, UnitsInStock from Products where ProductID = 6

--Wybierz nazwy produktów których nie ma w magazynie
select ProductName from Products where UnitsInStock = 0

--
select CompanyName from Customers where CompanyName like '%Restaurant%'

--inf o produktach sprzedawanych w butelkach
select ProductName from Products where QuantityPerUnit like '%bottle%'

--
select ReportsTo from Employees where LastName like '[B-L]%'

--
select ReportsTo from Employees where LastName like '[BL]%'

--
select CategoryName from Categories where Description like '%,%'

--
select CompanyName from Customers where CompanyName like '%Store%'

--
select OrderID, RequiredDate, CustomerID from Orders
where ShipCountry = 'Argentina' and (ShippedDate is NULL or ShippedDate > GETDATE())

--
select CompanyName, Country from Customers order by  Country, CompanyName

--
select CategoryID, ProductName, UnitPrice from Products order by CategoryID, UnitPrice DESC

--


--
