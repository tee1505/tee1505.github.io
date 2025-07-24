SELECT*
FROM Employees

SELECT EmployeeID, TitleOfCourtesy, FirstName, LastName
FROM Employees
WHERE Country = 'USA';

SELECT *
FROM Products
WHERE CategoryID IN (1, 2, 4, 8)
AND UnitPrice BETWEEN 100 AND 200;


SELECT Country, City, CompanyName, ContactName, Phone
FROM Customers
WHERE Region = 'WA' or Region = ' WY' 


SELECT *
FROM products
WHERE (CategoryID = 1 AND UnitPrice <= 20)
   OR (CategoryID = 8 AND UnitPrice >= 150);


SELECT CompanyName
FROM Customers
WHERE Country = 'USA' and fax is NULL
order by CompanyName

Select*
from Customers
where CompanyName like '%Com%';
