SELECT * FROM Products
SELECT * FROM Employees
SELECT EmployeeID,FirstName,LastName from Employees
-- ต้องการข้อมูลทั้งหมด
SELECT*
FROM Employees

SELECT *
FROM Employees
WHERE City = 'London'

SELECT * FROM Employees WHERE City = 'london'

SELECT EmployeeID,FirstName,Lastname
FROM Employees
WHERE City = 'London'


--การกำจัดแถวข้อมูลที่ซ้ากัน
SELECT  City, Country
FROM Customers

SELECT DISTINCT City, Country
FROM Customers

