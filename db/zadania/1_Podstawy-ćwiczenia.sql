--1. Wybierz nazwy i adresy wszystkich klientów
Select ContactName, Address
from Customers

--2. Wybierz nazwiska i numery telefonów pracowników
Select FirstName || ' ' || LastName as Name, HomePhone
from Employees

--3. Wybierz nazwy i ceny produktów
Select ProductName, UnitPrice
from Products

--4. Pokaż nazwy i opisy wszystkich kategorii produktów
Select CategoryName, Description
from Categories

--5. Pokaż nazwy i adresy stron www dostawców
select CompanyName, HomePage
from Suppliers

--Znajdź numer zamówienia oraz identyfikator klienta dla zamówień z datą wcześniejszą niż 1 sierpień 1996
select OrderID, CustomerID, OrderDate
from Orders
where OrderDate < Date('1996-08-01')

--1. Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie
select CompanyName, Address, City
from Customers
where City like 'london'

--2. Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w Hiszpanii
select CompanyName, Address, Country
from Customers
where Country like 'France' or Country like 'Spain'

--3. Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20 a 30
select ProductName, UnitPrice
from Products
where UnitPrice between 20 and 30

--4. Wybierz nazwy i ceny produktów z kategorii ‘meat’
select ProductName, UnitPrice, CategoryName
from Products as p
join Categories as c
on p.CategoryID = c.CategoryID
where CategoryName like '%meat%'

--5. Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’
select ProductName, UnitsInStock, CompanyName as 'Supplier'
from Products as p
join Suppliers as s
on p.SupplierID = s.SupplierID
where CompanyName = 'Tokyo Traders'

--6. Wybierz nazwy produktów których nie ma w magazynie
select ProductName, UnitsInStock
from Products
where UnitsInStock = 0

--1. Szukamy informacji o produktach sprzedawanych w butelkach (‘bottle’)
select ProductName
from Products
where QuantityPerUnit like '%bottle%'

---2. Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę z zakresu od B do L
select LastName
from Employees
where LastName like '[B-L]%'

--3. Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę  B lub L
select LastName
from Employees
where LastName like '[BL]%'

--4. Znajdź nazwy kategorii, które w opisie zawierają przecinek
select CategoryName, Description
from Categories
where Description like '%,%'

--5. Znajdź  klientów, którzy w swojej nazwie mają w którymś miejscu słowo ‘Store’
select CompanyName
from Customers
where CompanyName like '%store%'

--1. Szukamy informacji o produktach o cenach mniejszych niż 10 lub większych niż 20
select UnitPrice
from Products
where UnitPrice < 0 or UnitPrice > 20

--Napisz instrukcję select tak aby wybrać numer zlecenia,datę zamówienia, numer klienta dla wszystkich 
--niezrealizowanych jeszcze zleceń, dla których krajem odbiorcy jest Argentyna
select OrderID, CustomerID, ShipCountry, ShippedDate
from Orders
where ShipCountry like 'Argentina' and ShippedDate is null

--1. Wybierz nazwy i kraje wszystkich klientów, wyniki posortuj  według kraju, w ramach danego kraju nazwy firm
--posortuj alfabetycznie
select CompanyName, Country
from Customers
order by Country, CompanyName


--2. Wybierz informację o produktach (grupa, nazwa, cena), produkty posortuj wg grup a w grupach malejąco wg ceny
select ProductName, UnitPrice, CategoryID
from Products
order by CategoryID, UnitPrice desc