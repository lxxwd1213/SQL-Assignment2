--10.
select count(ProductID) as TotalProduct
from Production.Product
--11.
select count(ProductSubcategoryID) as NumberofSubcategory
from Production.Product
--12.
select ProductSubcategoryID, count(ProductSubcategoryID) as CountedProducts
from Production.Product
group by ProductSubcategoryID
--13.
select count(ProductID) - count(ProductSubcategoryID) as NoProductSubcategory
from Production.Product
--14.
select sum(Quantity) as SumofProductsQuantity
from Production.ProductInventory
--15.
select ProductID, Quantity as TheSum
from Production.ProductInventory
where LocationID = 40 and Quantity <100
--16.
select Shelf, ProductID, Quantity as TheSum
from Production.ProductInventory
where LocationID = 40 and Quantity <100
--17.
select avg(Quantity) as AvgQuantity
from Production.ProductInventory
where LocationID = 10
--18.
select ProductID, Shelf, avg(Quantity) as TheAvg
from Production.ProductInventory
GROUP BY ProductID, Shelf
--19.
select ProductID, Shelf, avg(Quantity) as TheAvg
from Production.ProductInventory
where Shelf != 'N/A'
GROUP BY ProductID, Shelf
--20.
SELECT Color, Class, COUNT(ProductID) as TheCount, AVG(ListPrice) as AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL and Class IS NOT NULL
GROUP BY Color, Class
--21.
SELECT c.Name as Country, s.Name as Province
FROM person.CountryRegion c JOIN person.StateProvince s on c.CountryRegionCode = s.CountryRegionCode
--22.
SELECT c.Name as Country, s.Name as Province
FROM person.CountryRegion c JOIN person.StateProvince s on c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name = 'Germany' or c.Name = 'Canada'
--23.
SELECT ProductID
FROM dbo.Orders o JOIN dbo.[Order Details] od on o.OrderID = od.OrderID
WHERE GETDATE() - OrderDate >= 25
--24.
SELECT  Top 5 count(ShipPostalCode) as SoldCount, ShipPostalCode
FROM dbo.Orders
GROUP BY ShipPostalCode
Order BY SoldCount Desc
--25.
SELECT  Top 5 count(ShipPostalCode) as SoldCount, ShipPostalCode
FROM dbo.Orders
WHERE GETDATE() - OrderDate >= 25
GROUP BY ShipPostalCode
Order BY SoldCount Desc
--26.
SELECT City, COUNT(City) as CustomerNumber
FROM dbo.Customers
GROUP BY City
--27.
SELECT City, COUNT(City) as CustomerNumber
FROM dbo.Customers
GROUP BY City
HAVING COUNT(City) > 2
--28.
SELECT CompanyName
FROM dbo.Customers c JOIN dbo.Orders o on c.CustomerID = o.CustomerID
WHERE OrderDate > '1998-01-01'
--29.
SELECT o.OrderDate, c.CompanyName 
FROM dbo.Customers c JOIN dbo.Orders o on c.CustomerID = o.CustomerID
WHERE o.OrderDate in (
        SELECT MAX(OrderDate)
        FROM dbo.Orders)
--30.
SELECT CompanyName, COUNT(Quantity) as CountProduct
FROM (  SELECT c.CustomerID, c.CompanyName, o.OrderID
        FROM dbo.Customers c LEFT JOIN dbo.Orders o ON c.CustomerID = o.CustomerID) AS co
JOIN dbo.[Order Details] od ON co. OrderID = od.OrderID
GROUP BY CompanyName
--31.
SELECT CustomerID
FROM (  SELECT c.CustomerID, c.CompanyName, o.OrderID
        FROM dbo.Customers c LEFT JOIN dbo.Orders o ON c.CustomerID = o.CustomerID) AS co
JOIN dbo.[Order Details] od ON co. OrderID = od.OrderID
GROUP BY CustomerID
HAVING COUNT(Quantity) >100
--32.
SELECT sh.CompanyName as [Supplier Company Name], su.CompanyName as [Shipping Company Name]
FROM dbo.Shippers sh Cross JOIN dbo.Suppliers su
--33.
SELECT OrderDate, ProductName
FROM (SELECT o.OrderID, o.OrderDate, od.ProductID
    FROM dbo.Orders o JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID) x 
    JOIN dbo.Products p On x.ProductID = p.ProductID
ORDER BY OrderDate ASC
--34.
Select e1.FirstName+' '+e1.LastName as FullName1, e2.FirstName+' '+e2.LastName as FullName2
FROM Employees e1 CROSS JOIN Employees e2
where e1.Title = e2.Title
--35.
SELECT FirstName + ' ' + LastName as FullName, COUNT(ReportsTo) as ReportsTo
FROM Employees
GROUP By FirstName + ' ' + LastName, ReportsTo
--36/37.
SELECT City, CompanyName as Name, ContactName as [Contact Name], Type = 'Customer'
FROM Customers
UNION
SELECT City, CompanyName as Name, ContactName as [Contact Name], Type = 'Suppliers'
FROM Suppliers









