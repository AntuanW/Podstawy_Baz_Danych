select isnull(Phone,'') + isnull(Fax,'') from Suppliers

select productid, sum(quantity) as total_quantity from orderhist group by productid

--max cena zamawianego produktu dla kazdego zamowienia
select OrderID, max(UnitPrice) from [Order Details] group by OrderID order by 2


select OrderID, max(UnitPrice) as 'max', min(UnitPrice) as 'min' from [Order Details] group by OrderID

select ShipVia, count(ShipVia) from Orders group by ShipVia

select OrderID from [Order Details] group by OrderID having sum(Quantity) > 5

select CustomerID, count(*), sum(Freight) from Orders where year(ShippedDate) = 1998 group by CustomerID

-- zad dom 2, 1 grupowanie zadanie domowe













select count(*) from Orders where ShippedDate > RequiredDate










