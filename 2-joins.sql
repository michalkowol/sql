-- Napisz polecenie zwracające nazwy produktów i firmy je dostarczające tak aby produkty bez „dostarczycieli” i „dostarczyciele” bez produktów nie pojawiali się w wyniku.
SELECT ProductName, CompanyName from Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;
-- Napisz polecenie zwracające jako wynik nazwy klientów, którzy złożyli zamówienia po 1 marca 1998.
SELECT CompanyName,OrderDate FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID WHERE OrderDate > datetime('1998-03-01');
-- Napisz polecenie zwracające wszystkich klientów z datami zamówień.
SELECT CompanyName, OrderDate FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID WHERE OrderDate IS NOT NULL;
-- Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe.
SELECT CompanyName, OrderDate FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID WHERE OrderDate not LIKE '%1997%'; -- to zle: jesli firma A zrobila zamowienia w 1997 i w 1998 to zostanie wyswietlona
SELECT CompanyName, Address FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID AND OrderDate LIKE '%1997%' WHERE Orders.OrderID IS NULL;
-- Wybierz nazwy i numery telefonów dostawców, dostarczających produkty, których aktualnie nie ma w magazynie.
SELECT CompanyName, Phone FROM Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID and UnitsInStock != 0 WHERE Products.ProductID IS NULL;
SELECT CompanyName, Phone, ProductName, UnitsInStock FROM Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID WHERE UnitsInStock = 0 or UnitsInStock IS NULL; -- to zle
SELECT CompanyName, Phone, ProductName, UnitsInStock FROM Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID WHERE CompanyName = 'G''day, Mate';

SELECT CompanyName, Phone, ProductName, UnitsInStock FROM Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID WHERE CompanyName = 'Tesla';
SELECT CompanyName, Phone, ProductName, UnitsInStock FROM Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID WHERE CompanyName = 'Microsoft';
SELECT * FROM Suppliers JOIN Products ON Suppliers.SupplierID = Products.SupplierID;
SELECT * FROM Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID;
SELECT * FROM Suppliers LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID WHERE Products.ProductID IS NULL;
-- Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej pomiędzy 20 a 30, dla każdego produktu podaj dane adresowe dostawcy, interesują nas tylko produkty z kategorii ‘Meat/Poultry’.
-- Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma ‘United Package’.
-- Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii ‘Confections.
-- Napisz polecenie, które wyświetla pracowników oraz ich podwładnych.
-- Napisz polecenie które zwraca imię i nazwisko (jako pojedynczą kolumnę – name) pracowników.
-- Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez klienta jednostek.
-- Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek oraz nazwę klienta.
-- Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczba jednostek jest większa niż 250.
-- Dla każdego klienta (nazwa) podaj nazwy towarów, które zamówił.
-- Dla każdego klienta (nazwa) podaj wartość poszczególnych zamówień. Gdy klient nic nie zamówił też powinna pojawić się informacja.
-- Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek oraz nazwę klienta.
-- Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczbę zamówionych jednostek jest większa niż 250.
-- Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz nazwę klienta.
-- Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczba jednostek jest większa niż 250.
-- Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i nazwisko pracownika obsługującego zamówienie.
-- Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez klientów jednostek towarów.
-- Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówień.
-- Posortuj wyniki w zapytaniu z punktu 2 wg: a) łącznej wartości zamówień b) łącznej liczby zamówionych przez klientów jednostek towarów.
-- Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997 r.
-- Który z przewoźników był najaktywniejszy (przewiózł największą liczbę zamówień) w 1997 r., podaj nazwę tego przewoźnika.
-- Który z pracowników obsłużył największą liczbę zamówień w 1997r, podaj imię i nazwisko takiego pracownika.
-- Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika.
-- Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o największej wartości) w 1997 r., podaj imię i nazwisko takiego pracownika.
-- Ogranicz wynik z pkt. 1 tylko do pracowników a) którzy mają podwładnych b) którzy nie mają podwładnych.