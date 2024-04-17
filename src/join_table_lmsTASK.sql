--1 Бардык клиенттердин шаарлары уникалдуу чыксын
SELECT DISTINCT CITY FROM Custumers;
--2 Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1950 AND 1960;
--3 Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT s.SupplierName,  s.Country FROM Suppliers s WHERE Country = 'France';
--4 Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
SELECT c.CustomerName,c.Address,c.Country FROM Custumers c WHERE c.Country not in ('Spain') and c.CustomerName like 'A%';
--5 PostalCode бош болгон клиенттер чыксын
SELECT * FROM Customers c where c.PostalCode like  '';
--6 Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT top 2 * FROM Customers where city='London' order by CustomerId;
--7 Фамилиясы  4 тамгадан турган ишкерлердин аты жанатуулган жылдары чыксын
SELECT e.LastName, e.BirthDate FROM Employees e WHERE e.LastName LIKE '____';
--8 Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
SELECT s.Country, COUNT(*) AS kolichestvo FROM Suppliers s GROUP BY s.Country;
--9 Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT country,count(*) FROM Suppliers GROUP BY Country HAVING COUNT(*) = 1 ORDER BY country;
--10 Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
SELECT CategoryName, SUM(price) AS JalpySumma FROM Products p inner join Categories c on p.CategoryID=c.CategoryID group by c.CategoryName;
--11 6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT CategoryID, SUM(price) as Jalpy_summa FROM Products group by CategoryID;
--12 Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT p.ProductID,p.ProductName,p.Price,s.SupplierID,s.SupplierName FROM Products p inner join Suppliers s on p.SupplierID=s.SupplierID order by s.SupplierName;
--13 Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
SELECT s.SupplierName,count(p.ProductName) FROM Suppliers s inner join Products p on p.SupplierID=s.SupplierID group by s.SupplierName order by count(p.ProductName) desc;
--14 Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
SELECT c.CustomerName, e.FirstName, sh.ShipperName from Customers c,Orders o,Employees e,Shippers sh where c.CustomerID = o.CustomerID and o.EmployeeID = e.EmployeeID  and sh.ShipperID = o.ShipperID;
--15 Кайсы ишкер канча клиент обслуживайтеткен чыксын
SELECT e.FirstName, count(c.CustomerName) as skolko_klientov_obslujil from Customers c, Orders o, Employees e where c.CustomerID = o.CustomerID and o.EmployeeID = e.EmployeeID group by e.FirstName order by count(c.CustomerName) desc;
