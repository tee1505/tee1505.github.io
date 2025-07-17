SELECT * FROM Products
SELECT * FROM Employees
SELECT EmployeeID,FirstName,LastName from Employees
-- ต้องการข้อมูลทั้งหมด
SELECT*
FROM Employees

SELECT *
FROM Employees
WHERE City = 'London'

--แสดงข้อมูลทุกอย่างของพนักงาน
ที่อยู่ในเมือง London
SELECT * FROM Employees WHERE City = 'london'


--แสดงข้อมูลรหัสพนักงาน , ชื่อ และนามสกุล
ของพนักงานที่อยู่ในเมือง London

SELECT EmployeeID,FirstName,Lastname
FROM Employees
WHERE City = 'London'
้้

--การกำจัดแถวข้อมูลที่ซ้ากัน
SELECT  City, Country
FROM Customers

SELECT DISTINCT City, Country
FROM Customers

SELECT * 
from Products
where UnitPrice > 200

SELECT *
FROM Customers
WHERE City ='London'
OR City ='Vancouver'

SELECT *
FROM Customers
WHERE Country = 'USA'
OR City = 'Vancouver'

SELECT *
FROM Products
WHERE UnitPrice >=50
AND UnitsInStock<20


--แสดงข้อมูลสินค้าที่มีจำนวนคงเหลือต่ำกว่า 20 
--หรือ มีจำนวนคงเหลือน้อยกว่าระดับการสั่งซื้อ
SELECT * from Products
WHERE UnitsInStock<20 or UnitsInStock <= ReorderLevel

SELECT * 
FROM Products
WHERE UnitPrice BETWEEN 50 and 100

SELECT * 
FROM Products
WHERE UnitPrice >= 50 and UnitPrice <= 100

SELECT * 
FROM Customers
WHERE Country IN ('Brazil','Argentina','Mexico');

SELECT * 
FROM Employees
WHERE FirstName LIKE 'N%'

SELECT * from Customers
where CompanyName LIKE 'A%'

SELECT * from Customers
where CompanyName LIKE '%Y'

SELECT firstname, lastname from Employees
where FirstName like '%an%'
