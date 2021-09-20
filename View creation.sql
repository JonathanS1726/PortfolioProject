-- DATABASE CREATION PROJECT - Jonathan Sanchez Cabreja

Skills used: VIEWS, JOINS, STRING FUNCTIONS

--********************************* VIEW CREATION TO STORE DATA FOR VISUALIZATION *************************************


--1.	List orders with details

USE Printers_JS

CREATE VIEW Orders_Details_V
AS
SELECT
	s.Order_Number AS [Orden #], 
	s.Quantity, 
	pt.Type AS Category, 
	p.Model, 
	FORMAT(s.Unit_Price, '$0,##') AS Price, 
	FORMAT(s.Total, '$0,##') AS Total, 
	sd.Sales_Date, 
	sd.Payment_Type, 
	v.Name +' '+ CONCAT(LEFT(v.LastName,1),'.') AS SalesPerson, 
	c.Name +' '+ CONCAT(LEFT(c.LastName,1),'.') AS Cashier,
	t.Store_Name AS [Store Name] 
FROM Sales_tbl s
	LEFT JOIN Employees_tbl V ON (s.SalesPerson_ID = V.Emp_ID)
	LEFT JOIN Employees_tbl C ON (s.EmpCashier = C.Emp_ID)
	INNER JOIN SalesDetails_tbl sd
ON s.Order_Number = sd.Order_Number
	INNER JOIN ProductTypes_tbl pt
ON s.ProductType_ID = pt.ProductType_ID
	INNER JOIN Products_tbl p
ON s.Model_ID = p.Model_ID
	INNER JOIN  Stores_tbl t
ON s.Store_ID = t.Store_ID
ORDER BY sd.Sales_Date DESC
OFFSET 0 ROWS

SELECT * FROM Orders_Details_V



--2. CLIENTS INFO

CREATE VIEW Clients_V
AS 
SELECT
	Client_ID,
	Name+ ' ' + LastName AS [Client Name], 
	PhoneNumber_Primary AS PhoneNumber, 
	Address, 
	City, 
	Email,
	Modification_Date AS [Fecha de Modificacion]
FROM Clients_tbl
ORDER BY [Client Name] 
OFFSET 0 ROWS


SELECT * FROM Clients_V


--3. EMPLOYEES INFO
-- In this view I have added the column [Tenure - Months] using the column Hire_Date and the DATEDIFF function

CREATE VIEW EmployeesInfo_V
AS
SELECT
	e.Emp_ID,
	e.Name+' ' +e.LastName AS [EmployeeName],
	e.Position,
	et.PhoneNumber,
	ec.Phone_Type AS [Type de PhoneNumber],
	e.Email,
	e.Address,
	e.City,
	e.Marital_Stauts AS [Estado Civil],
	e.DOB AS [Birthdate],
	e.Genre,
	e.Hire_Date AS [Hire Date],
	DATEDIFF(MONTH, e.Hire_Date, GETDATE()) AS [Tenure - Months],
	e.Modification_Date AS [Modification Date]
FROM Employees_tbl e
	INNER JOIN EmployeesPhoneNumber_tbl et
ON e.Emp_ID = et.Emp_ID
	INNER JOIN EmployeesContact_tbl ec
ON e.PhoneNumber_ID = ec.PhoneNumber_ID
	
SELECT * FROM EmployeesInfo_V



--4.	CLIENTS WITH MORE ORDERS

CREATE VIEW ClientsOrders_V
AS
SELECT TOP 5
	v.Client_ID AS ID,
	v.Order_Number AS [Order Number],
	c.Name+' '+C.LastName AS [Client Name],
	SUM(V.Quantity) AS Quantity,
	FORMAT(SUM(v.Total),'$0,##') AS [Total Sales],
	p.Type AS Category
FROM Sales_tbl AS v
	INNER JOIN Clients_tbl AS c
ON v.Client_ID = c.Client_ID
	INNER JOIN ProductTypes_tbl p 
ON v.ProductType_ID = p.ProductType_ID
GROUP BY v.Client_ID, v.Order_Number, c.Name+' '+C.LastName, p.Type
ORDER BY Quantity DESC


SELECT * FROM ClientsOrders_V

