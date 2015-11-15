-- Wybierz nazwy i adresy wszystkich klientów.
SELECT CompanyName, Address FROM Customers;
-- Wybierz nazwiska i numery telefonów pracowników.
SELECT LastName, HomePhone FROM Employees;
-- Wybierz nazwy i ceny produktów.
SELECT ProductName, UnitPrice FROM Products;
-- Pokaż nazwy i opisy wszystkich kategorii produktów.
SELECT CategoryName, Description FROM Categories;
-- Pokaż nazwy i adresy stron www dostawców.
SELECT CompanyName, HomePage FROM Suppliers;
-- Znajdź numer zamówienia oraz identyfikator klienta dla zamówień z datą wcześniejszą niż 1 sierpień 1996.
SELECT OrderID, CustomerID, OrderDate FROM Orders WHERE OrderDate < DATETIME('1996-08-01');
-- Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie.
SELECT CompanyName AS 'Nazwa firmy', Address AS 'Adres' FROM Customers WHERE City='London';
-- Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w Hiszpanii.
SELECT CompanyName, Address FROM Customers WHERE Country = 'France' OR Country= 'Spain';
-- Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20 a 30.
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 20 AND 30;
-- Wybierz nazwy i ceny produktów z kategorii ‘meat’.
SELECT CategoryID, CategoryName FROM Categories WHERE CategoryName='Meat/Poultry';
SELECT ProductName, UnitPrice, CategoryID FROM Products WHERE CategoryID = 6;
SELECT ProductName, UnitPrice, CategoryID FROM Products WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName='Meat/Poultry');
SELECT ProductName, UnitPrice, CategoryID FROM Products WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName LIKE '%meat%');
SELECT ProductName, UnitPrice, CategoryID FROM Products WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName LIKE '%meat%');
SELECT ProductName, UnitPrice, CategoryName FROM Products JOIN Categories ON Products.CategoryID = Categories.CategoryID WHERE CategoryName = 'Meat/Poultry';
-- Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’.
SELECT ProductName, UnitsInStock FROM Products JOIN Suppliers ON Products.SupplierID = suppliers.SupplierID WHERE CompanyName = 'Tokyo Traders';
-- Wybierz nazwy produktów których nie ma w magazynie.
SELECT ProductName, UnitsInStock FROM Products WHERE UnitsInStock = 0;
-- Szukamy informacji o produktach sprzedawanych w butelkach (‘bottle’).
SELECT ProductName, QuantityPerUnit FROM Products WHERE QuantityPerUnit LIKE '%bottles%';
-- Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę z zakresu od B do L.
SELECT LastName, Title FROM Employees WHERE LastName LIKE '[B-L]%';
-- Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę  B lub L.
SELECT LastName, Title FROM Employees WHERE LastName LIKE '[BL]%';
-- Znajdź nazwy kategorii, które w opisie zawierają przecinek.
SELECT CategoryName FROM Categories WHERE Description LIKE '%,%';
-- Znajdź klientów, którzy w swojej nazwie mają w którymś miejscu słowo ‘Store’.
SELECT CompanyName FROM Customers WHERE CompanyName LIKE '%Store%';
-- Szukamy informacji o produktach o cenach mniejszych niż 10 lub większych niż 20.
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice NOT BETWEEN 10 AND 20;
-- Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20.00 a 30.00.
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 10 AND 20;
-- Wybierz nazwy i  kraje wszystkich klientów mających siedziby w Japonii (Japan) lub we Włoszech (Italy).
SELECT CompanyName, Country FROM Customers WHERE Country = 'Japan' OR Country = 'Italy';
-- Napisz instrukcję select tak aby wybrać numer zlecenia, datę zamówienia, numer klienta dla wszystkich
-- niezrealizowanych jeszcze zleceń, dla których krajem odbiorcy jest Argentyna.
SELECT OrderID, CustomerID, OrderDate, ShippedDate, ShipCountry FROM Orders WHERE ShippedDate is NULL AND ShipCountry = 'Argentina';
-- Wybierz nazwy i kraje wszystkich klientów, wyniki posortuj  według kraju, w ramach danego kraju nazwy firm posortuj alfabetycznie.
SELECT CompanyName, Country FROM Customers ORDER BY Country, CompanyName;
-- Wybierz informację o produktach (grupa, nazwa, cena), produkty posortuj wg grup a w grupach malejąco wg ceny.
SELECT CategoryName, ProductName, UnitPrice FROM Products JOIN Categories ON Products.CategoryID = Categories.CategoryID ORDER BY CategoryName, UnitPrice DESC;
-- Wybierz nazwy i kraje wszystkich klientów mających siedziby w Wielkiej Brytanii (UK) lub we Włoszech (Italy), w ramach danego kraju nazwy firm posortuj alfabetycznie.
SELECT CompanyName, Country FROM Customers WHERE Country IN ('UK', 'Italy') ORDER BY Country, CompanyName;