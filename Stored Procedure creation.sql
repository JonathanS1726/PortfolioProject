-- DATABASE CREATION PROJECT - Jonathan Sanchez Cabreja

Skills used: STORED PROCEDURES, VARIABLES, BEGIN TRAN, TRY/CATCH, INSERT INTO, SCOPE_IDENTITY

--********************************* Stored Procedures creation *************************************


-- INSERT A SALE RECORD

CREATE PROCEDURE sp_NewSaleRegistration
@SalesPersonID_Sales INT,
@ModelID_Sales INT,
@NewClientID INT,
@ProductTypeID_Sales INT,
@Quantity_Sales INT,
@UnitPrice_Sales MONEY,
@StoreID_Sales INT, 
@EmpCashier_Sales INT

AS 

DECLARE 
@DATE DATE,
@Total_Sales MONEY
	
SET @DATE = GETDATE()
SET @Total_Sales = @Quantity_Sales * @UnitPrice_Sales

BEGIN TRANSACTION
	BEGIN TRY

-- Insert a sale into Sales_tbl

INSERT INTO Sales_tbl (SalesPerson_ID, Model_ID, Client_ID, ProductType_ID, Quantity, Unit_Price, Total, Store_ID, EmpCashier, Modification_Date)
VALUES (@SalesPersonID_Sales, @ModelID_Sales, @NewClientID, @ProductTypeID_Sales, @Quantity_Sales, @UnitPrice_Sales, @Total_Sales, @StoreID_Sales, @EmpCashier_Sales, @DATE)

SELECT * FROM Sales_tbl
WHERE Client_ID = @NewClientID AND Modification_Date = @DATE 

COMMIT TRAN
END TRY

BEGIN CATCH 
-- Error message if occurred

ROLLBACK TRANSACTION
PRINT 'An error has occurred!'

END CATCH

EXEC sp_NewSaleRegistration @SalesPersonID_Sales = 4, @ModelID_Sales = 5, @NewClientID = 118,  @ProductTypeID_Sales = 1 , @Quantity_Sales = 6, @UnitPrice_Sales = 1000 , 
@StoreID_Sales = 1 , @EmpCashier_Sales = 11 



-- INSERT AN EMPLOYEE

CREATE PROCEDURE sp_NewEmployee
@EmpID INT, 
@Name VARCHAR (25),
@LastName VARCHAR (25),
@Position VARCHAR (25),
@PhoneNumber_ID INT,
@Email VARCHAR(50),
@Address VARCHAR (255),
@City VARCHAR (25),
@MaritalStatus VARCHAR (20),
@DOB date,
@Genre VARCHAR (10),

@PhoneNumber VARCHAR (15)

AS

DECLARE 
@HireDate DATE,
@ModificationDate DATE

SET @HireDate = GETDATE()
SET @ModificationDate = GETDATE()

BEGIN TRANSACTION 
	BEGIN TRY

-- Insert a record to Employees_tbl

INSERT INTO Employees_tbl (Emp_ID, Name , LastName, Position, PhoneNumber_ID, Email, Address, City, Marital_Stauts, DOB, Genre, Hire_Date, Modification_Date) 
VALUES (@EmpID, @Name, @LastName, @Position, @PhoneNumber_ID, @Email, @Address, @City, @MaritalStatus, @DOB, @Genre, @HireDate, @ModificationDate) 

SET @EmpID = SCOPE_IDENTITY()

SELECT * FROM Employees_tbl 
WHERE Emp_ID = @EmpID 

-- Insert a record to EmployeesPhoneNumber_tbl

INSERT INTO EmployeesPhoneNumber_tbl (Emp_ID, PhoneNumber, PhoneNumber_ID, Modification_Date)
VALUES (@EmpID, @PhoneNumber,@PhoneNumber_ID, @ModificationDate)

SET @EmpID = SCOPE_IDENTITY()

SELECT * FROM EmployeesPhoneNumber_tbl 
WHERE PhoneNumber = @PhoneNumber 

COMMIT TRANSACTION 
	END TRY

BEGIN CATCH 
-- Error message if occurred

ROLLBACK TRANSACTION
PRINT 'An error has occurred!'

END CATCH

EXEC sp_NewEmployee @EmpID = 195, @Name = 'JuanPerez', @LastName = 'Lovely', @Position = 'SalesPerson', @PhoneNumber_ID = 1, @Email = 'JuanPerez@correo.com', 
@Address = 'Calle 52 no.5', @City = 'Santiago', @MaritalStatus = 'Single', @DOB = '04/04/2000', @Genre = 'Male', @PhoneNumber = '1-809-123-1111'

--Set identity_insert Employees_tbl on




-- INSERT A PRODUCT

CREATE PROCEDURE sp_NewProduct
@ModelID INT, 
@Model VARCHAR (50),
@Price MONEY, 
@Color VARCHAR (15),
@ProductID INT, 
@InventoryID INT, 
@Manufacture_Date DATE 

AS

DECLARE 
@InsertDate DATE

SET @InsertDate = GETDATE()

BEGIN TRANSACTION 
	BEGIN TRY

-- Insert a record to Employees_tbl

INSERT INTO Products_tbl (Model_ID, Model, Unit_Price, Color, ProductType_ID, Inventory_ID, Manufacture_Date, Modification_Date) 
VALUES (@ModelID, @Model, @Price, @Color, @ProductID, @InventoryID, @Manufacture_Date, @InsertDate) 

SET @ModelID = SCOPE_IDENTITY()

SELECT * FROM Products_tbl 
WHERE Modification_Date = @InsertDate AND Model = @Model

COMMIT TRANSACTION 
	END TRY

BEGIN CATCH 
--  Error message if occurred 

ROLLBACK TRANSACTION
PRINT 'An error has occurred!'

END CATCH

EXEC sp_NewProduct @ModelID = 50, @Model = 'Xerox ColorQube', @Price = 1500, @Color = 'White', @ProductID = 1, @InventoryID = 1, @Manufacture_Date= '01/01/2010'



-- UPDATE THE INVENTORY QUANTITY OF A PRODUCT REGISTERING THE PERSON WHO UPDATE IT.

CREATE PROCEDURE sp_InventoryUpdate
@ModelID_Inventory INT,
@Quantity_Inventory INT,
@ModifiedBy VARCHAR (25)

AS 

DECLARE 
@DATE DATE
SET @DATE = GETDATE()

BEGIN TRANSACTION
	BEGIN TRY

-- Extract Quantity/Product of ProductsInventory_tbl

UPDATE ProductsInventory_tbl
SET Quantity =  @Quantity_Inventory, Modification_Date = @DATE, [ModifiedBy] = @ModifiedBy Where Inventory_ID = @ModelID_Inventory 

SELECT * FROM ProductsInventory_tbl
WHERE Model_ID = @ModelID_Inventory AND Modification_Date = @DATE 

COMMIT TRAN
END TRY

BEGIN CATCH 
--  Error message if occurred 

ROLLBACK TRANSACTION
PRINT 'An error has occurred!'

END CATCH

EXEC sp_InventoryUpdate @ModelID_Inventory = 3, @Quantity_Inventory = 57, @ModifiedBy = 'Jonathan'



-- FILTER CLIENT BY CITY.

CREATE PROCEDURE sp_ClientsByCity
@City VARCHAR(25)
AS 
SELECT Client_ID, [Name]+' '+ LastName AS [Full Name], PhoneNumber_Primary AS PhoneNumber, City, Email, Modification_Date
FROM Clients_tbl
WHERE @City = City 

Exec sp_ClientsByCity @City = 'Quenast'
