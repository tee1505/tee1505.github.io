Select Region, country, City, CompanyName, phone
from Customers
order by 1 asc, 2 asc,3 asc


select PRODUCTID หรัส, PRODUCTName สินค้า, 
  Unitprice ราคา,Unitsinstock จำนวน,
  unitprice* Unitsinstock AS [stockValue]
  from Products


SELECT 
    ProductID AS รหัส, 
    ProductName AS สินค้า,
    UnitsInStock + UnitsOnOrder AS จำนวนคงเหลือทั้งหมด,
    ReorderLevel AS จุดสั่งซื้อ
FROM Products
WHERE (UnitsInStock + UnitsOnOrder) < ReorderLevel


SELECT 
    ProductID, 
    ProductName,
    UnitPrice, 
    ROUND(UnitPrice * 0.07, 2) AS Vat
FROM Products;


SELECT 
    EmployeeID,
    TitleOfCourtesy + ' ' + FirstName + SPACE(1) + LastName AS [Employees Name]
FROM Employees;

SELECT OrderID,ProductID,UnitPrice,Quantity,Discount,
    (UnitPrice * Quantity) as TotalPrice,
    (UnitPrice* Quantity)-(UnitPrice* Quantity* Discount) AS NetPrice
FROM [Order Details]

--ราคาจริง = ราเต็ม - ส่วนลด
--ราคาเต็ม = ราคา* จำนวน
--ส่วนลด = ราคาเต็ม * ส่วนลด
--ราคาจริง = (ราคา * จำนวน) - (ราคา * จำนวน * ลด)
--ราคาจริง = ราคา * จำนวน * (1-ลด)

--อันนี้เกี่ยวกับคำนวน
select(42.40*35)-(42.40*35*0.15)


SELECT OrderID,ProductID,UnitPrice,Quantity,Discount,
    (UnitPrice * Quantity) as TotalPrice,
    (UnitPrice* Quantity)*(1-Discount) AS NetPrice
FROM [Order Details]

--ต้องการทราบอายุ
SELECT employeeID, FirstName, BirthDate,DATEDIFF(YEAR, BirthDate, '2024-12-31') AVG,HireDate, DATEDIFF(YEAR, HireDate, GETDATE()) YearlnOffice
FROM Employees;

select GETDATE()

SELECT COUNT(*) AS จำนวนสินค้า, count(ProductID), count(ProductName),count(UnitPrice)
from products
where UnitsInStock < 15

SELECT COUNT(*) AS จำนวนลูกค้า_USA
FROM Customers
WHERE Country = 'USA';

SELECT COUNT(*) 
FROM Customers
WHERE Country = 'USA';

SELECT COUNT(*) AS จำนวนพนักงานในลอนดอน
FROM Employees
WHERE City = 'London';

SELECT COUNT(*) AS จำนวนการสั่งซื้อในปี1997
FROM Orders
WHERE YEAR(OrderDate) = 1997;

select COUNT(*)
From [Order Details] where ProductID = 1

--fnuction SUM
--จำนวนสินค้าที่ขายได้ทั้งหมด
Select sum(quantity)
from [Order Details] where ProductID = 2

--มูลคค่าสิ้นค้าในคลังทั้งหมด
SELECT sum(UnitPrice * UnitsInStock)
from Products

--จำนวนสินค้าหรัสประเภท 8 ที่สังซื้อไปแล้ว
select sum(UnitsOnOrder)
FROM Products
WHERE CategoryID = 8

--function Max,Min
--ราคาสินค้าหรัส 1 ที่ขายได้้ราคาสูงสุดและต่ำสุด

SELECT max(UnitPrice),min(UnitPrice)
FROM [Order Details]
WHERE ProductID = 71

--Function AVG
--ราคาสินค้าเฉลี่ยทั้งหมดที่เคยขายได้ เฉพาะสินค้าหรัส 5
SELECT AVG(UnitPrice),min(UnitPrice),max(UnitPrice)
FROM [Order Details]
WHERE ProductID = 5;


--Group By
--ประเทศ และจำนวนลูกค้า

SELECT COUNTRY , COUNT(*) AS [Num of Customers]
FROM Customers
GROUP BY Country

--หรัสประเภทสินค้า ราคาเฉลี่ยของสินค้าประเภทเดียวกัน
Select categoryID, AVG(UnitPrice),min(UnitPrice),max(UnitPrice)
FROM Products
GROUP BY CategoryID

--รายการสินค้าในใบสั้งซื้อทุกใบ [order details ]
--เฉพาะในใบสั่งซื้อที่มีสินค้ามากกว่า 3 ชนิด

Select OrderID, COUNT(*)
FROM [Order Details]
GROUP BY OrderID
HAVING COUNT(*) > 3;

--ประะเทศปลายทาง และใบสั่งซื้อที่ส่งสินค้าไปถึงป้ายทาง
--ต้องการเฉพาะที่มีจำนวนใบสั่งซื้อ ตั่งแต่ 100 ขึ้นไป
select ShipCountry, COUNT(*) numOfOrders
from Orders
Group BY ShipCountry 
HAVING COUNT(*) >= 100;
--
SELECT country, COUNT(*)as [Num of Customers]
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 5;


--ข้อมูลหรัสใบสั่งซื้อ ยอดเงินรวมในใบสั่งซื้อนั้น แสดงเฉพาะใบสั่งซื้อที่มียอดเงินน้อยกว่า 100 [order details]
select orderID, sum(UnitPrice* Quantity*(1-Discount))
from [Order Details]
GROUP BY OrderID
HAVING sum(UnitPrice* Quantity*(1-Discount)) < 100;

--ประเทศใดที่มีจำนวนใบสั่งซื้อที่ส่งสินค้าไปปลายทางต่ำกว่า 20 รายการ ในปี 1997
Select ShipCountry, COUNT(*) AS [Num of Orders]
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipCountry
HAVING COUNT(*) < 20
ORDER BY COUNT(*) DESC

--ใบสั่งซื้อใดมียอดขายสูงที่สุด แสดงหรัสใบสั่งซื้อและยอดขาย
select top 1 orderID, sum(UnitPrice* Quantity*(1-Discount)) as total
from [Order Details]
GROUP BY OrderID
order by total DESC

--ใบสั่งซื้อใดมียอดขายต่ำที่สุด แสดงหรัสใบสั่งซื้อและยอดขาย
select top 5 orderID, sum(UnitPrice* Quantity*(1-Discount)) as total
from [Order Details]
GROUP BY OrderID
order by total asc
