--8. Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20 a 30, dla każdego produktu podaj dane adresowe dostawcy
select ProductName, UnitPrice, Address
from Products
join Suppliers
on Products.SupplierID = Suppliers.SupplierID
where UnitPrice between 20 and 30

--9. Wybierz nazwy produktów oraz informacje o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’
select ProductName, UnitsInStock, CompanyName
from Products
join Suppliers
on Products.SupplierID = Suppliers.SupplierID
where CompanyName = 'Tokyo Traders'

--10. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select CompanyName, Address
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID and OrderDate like '%1997%'
where o.OrderID is null

select CompanyName, Address
from Customers
where not exists (
	select *
	from Orders
	where CustomerId = Customers.CustomerID and OrderDate like '%1997%'
)

select CompanyName, Address
from Customers
where CompanyName not in (
	select CompanyName
	from Orders
	where CustomerId = Customers.CustomerID and OrderDate like '%1997%'
)
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--11. Wybierz nazwy i numery telefonów dostawców, dostarczających produkty, których aktualnie nie ma w magazynie
select CompanyName, Address, ProductName, UnitsInStock
from Suppliers
inner join Products
on Products.SupplierID = Suppliers.SupplierID and UnitsInStock = 0

select CompanyName, Address, ProductName, UnitsInStock
from Suppliers
inner join Products
on Products.SupplierID = Suppliers.SupplierID
where UnitsInStock = 0

--1.Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej pomiędzy 20 a 30, dla każdego produktu
--podaj dane adresowe dostawcy, interesują nas tylko produkty z kategorii ‘Meat/Poultry’
select ProductName, UnitPrice, Address
from Products
inner join Categories
on Products.CategoryID = Categories.CategoryID and CategoryName like '%meat%'
inner join Suppliers
on Suppliers.SupplierID = Products.SupplierID
where UnitPrice between 20 and 30

--2.Wybierz nazwy i ceny produktów z kategorii ‘Confections’ dla każdego produktu podaj nazwę dostawcy.
select ProductName, UnitPrice, CategoryName
from Products
inner join Categories
on Products.CategoryID = Categories.CategoryID and CategoryName = 'Confections'

--3. Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma ‘United Package’
select Customers.CompanyName, Customers.Phone, Shippers.CompanyName, OrderDate
from Orders
inner join Shippers on Orders.ShipVia = Shippers.ShipperID and Shippers.CompanyName = 'United Package'
inner join Customers on Orders.CustomerID = Customers.CustomerID
where OrderDate like '%1997%'

--4. Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii ‘Confections
select distinct  Customers.CompanyName, Customers.Phone, CategoryName
from Customers
inner join Orders on Customers.CustomerID = Orders.CustomerID
inner join  `Order Details` on  `Order Details`.OrderID = Orders.OrderID
inner join Products on Products.ProductID =  `Order Details`.ProductID
inner join Categories on Categories.CategoryID = Products.CategoryID and CategoryName = 'Confections'
order by Customers.CompanyName

--1.Napisz polecenie, które wyświetla pracowników oraz ich podwładnych.
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select e1.LastName, e2.LastName
from Employees as e1
left join Employees as e2 on e1.EmployeeID = e2.ReportsTo
order by e1.LastName, e2.LastName
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--2._ Napisz polecenie, które wyświetla pracowników, którzy nie mają podwładnych.
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select e1.LastName
from Employees as e1
left join Employees as e2 on e1.EmployeeID = e2.ReportsTo
where e2.ReportsTo is null
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--1. Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez klienta jednostek.
select CategoryName, Customers.CompanyName, Sum(Quantity)
from Categories
inner join Products on Categories.CategoryID = Products.CategoryID
inner Join [Order Details] on Products.ProductID = [Order Details].ProductID
inner join Orders on [Order Details].OrderID = Orders.OrderID
inner join Customers on Orders.CustomerID = Customers.CustomerID
group by CategoryName, Customers.CustomerID
order by CompanyName, CategoryName

--2. Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek oraz nazwę klienta.
select CompanyName, Sum(Quantity) as Quantity
from Orders
inner join `Order Details` on Orders.OrderID = `Order Details`.OrderID
inner join Customers on Orders.CustomerID = Customers.CustomerID
group by Orders.OrderID
order by Quantity desc

--3. Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczba jednostek jest większa niż 250.
select CompanyName, Sum(Quantity) as QuantityAll
from Orders
inner join `Order Details` on Orders.OrderID = `Order Details`.OrderID
inner join Customers on Orders.CustomerID = Customers.CustomerID
group by Orders.OrderID
having QuantityAll > 250
order by QuantityAll desc

--4. Dla każdego klienta (nazwa) podaj nazwy towarów, które zamówił
select CompanyName, ProductName, Sum(Quantity) as QuantityOfProducts
from Products
inner Join [Order Details] on Products.ProductID = [Order Details].ProductID
inner join Orders on [Order Details].OrderID = Orders.OrderID
inner join Customers on Orders.CustomerID = Customers.CustomerID
group by CompanyName, ProductName
order by CompanyName, ProductName

--5. Dla każdego klienta (nazwa) podaj wartość poszczególnych zamówień. Gdy klient nic nie zamówił też powinna
--pojawić się informacja
select CompanyName, Orders.OrderID, IFNULL(SUM(UnitPrice * Quantity * (1 - Discount)),0) as OrderWholePrice
from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
left join [Order Details] on Orders.OrderID = [Order Details].OrderID
group by CompanyName, Orders.OrderID