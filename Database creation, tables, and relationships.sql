-- FINAL PROJECT - Jonathan Sanchez Cabreja


--************************* Database creation, tables, and relationships ************************************

-- Database creation
CREATE DATABASE Printers_JS

-- Employees_tbl creation
-- (Emp_ID, Name, LastName, Position, PhoneNumber_ID, Email, Address, City, Marital_Stauts, DOB, Genre, Hire_Date, Modification_Date)

USE Printers_JS

CREATE TABLE Employees_tbl (
	Emp_ID INT IDENTITY (1,1) PRIMARY KEY,
	Name VARCHAR (25) NOT NULL,
	LastName VARCHAR (25) NOT NULL,
	Position VARCHAR (25),
	PhoneNumber_ID INT NOT NULL,
	Email VARCHAR (50),
	Address VARCHAR (255),
	City VARCHAR (25),
	Marital_Stauts VARCHAR (20), 
	DOB DATE	NOT NULL, 
	Genre VARCHAR (10) NOT NULL, 
	Hire_Date DATE NOT NULL,
	Modification_Date DATE NOT NULL
)

ALTER TABLE Employees_tbl
ADD FOREIGN KEY (PhoneNumber_ID) REFERENCES EmployeesContact_tbl(PhoneNumber_ID);



-- EmployeesContact_tbl creation
-- (PhoneNumber_ID, Phone_Type, Modification_Date)

CREATE TABLE EmployeesContact_tbl (
	PhoneNumber_ID INT PRIMARY KEY,
	Phone_Type VARCHAR (10) NOT NULL,
	Modification_Date DATE
)



-- EmployeesPhoneNumber_tbl creation
-- (Emp_ID, PhoneNumber, PhoneNumber_ID, Modification_Date)

CREATE TABLE EmployeesPhoneNumber_tbl (
	Emp_ID INT PRIMARY KEY,
	PhoneNumber VARCHAR (15) NULL,
	PhoneNumber_ID INT,
	Modification_Date DATE
)



-- Sales_tbl creation
-- (Order_Number, SalesPerson_ID, Model_ID, ProductType_ID, Quantity, Unit_Price, Total, Store_ID, Cashier_ID, Modification_Date)

CREATE TABLE Sales_tbl (
	Order_Number INT PRIMARY KEY IDENTITY (1,1),
	SalesPerson_ID INT FOREIGN KEY REFERENCES Employees_tbl(Emp_ID),
	Model_ID INT NOT NULL FOREIGN KEY REFERENCES Products_tbl(Model_ID), 
	Client_ID INT NOT NULL FOREIGN KEY REFERENCES Clients_tbl(Client_ID),
	ProductType_ID INT NOT NULL FOREIGN KEY REFERENCES ProductTypes_tbl(ProductType_ID),
	Quantity INT,
	Unit_Price MONEY,
	Total MONEY, 
	Store_ID INT NOT NULL, 
	EmpCashier INT FOREIGN KEY REFERENCES Employees_tbl(Emp_ID),
	Modification_Date DATE
)



-- Clients_tbl creation
-- (Client_ID, Name, LastName, PhoneNumber_Primary, Address, City, Email, Modification_Date)

CREATE TABLE Clients_tbl (
	Client_ID  INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Name VARCHAR (25) NOT NULL,
	LastName VARCHAR (25) NOT NULL, 
	PhoneNumber_Primary VARCHAR (15) NOT NULL,
	Address VARCHAR (255),
	City VARCHAR (25),
	Email VARCHAR (50),
	Modification_Date DATE
)



-- SalesDetails_tbl creation
-- (Detail_Number, Order_Number, Sales_Date, Payment_Type, Modification_Date)

CREATE TABLE SalesDetails_tbl (
	Detail_Number INT PRIMARY KEY IDENTITY (1,1),
	Order_Number INT FOREIGN KEY REFERENCES Sales_tbl(Order_Number),
	Sales_Date DATE, 
	Payment_Type VARCHAR (25) NOT NULL,
	Modification_Date DATE,
)



-- Stores_tbl creation
-- (Store_ID, Store_Name, City, Opening_Date, TotalEmployees, Modification_Date)

CREATE TABLE Stores_tbl (
	Store_ID INT PRIMARY KEY NOT NULL, 
	Store_Name VARCHAR (25),
	City VARCHAR (25),
	Opening_Date DATE,
	TotalEmployees INT NOT NULL,
	Modification_Date DATE
)



-- Products_tbl creation
-- (Model_ID, Model, Unit_Price, Color, ProductType_ID, Inventory_ID, Manufacture_Date, Modification_Date)

CREATE TABLE Products_tbl (
	Model_ID INT PRIMARY KEY NOT NULL,
	Model VARCHAR (50), 
	Unit_Price MONEY,
	Color VARCHAR (15),
	ProductType_ID  INT NOT NULL FOREIGN KEY REFERENCES ProductTypes_tbl(ProductType_ID),
	Inventory_ID INT NOT NULL FOREIGN KEY REFERENCES ProductsInventory_tbl(Inventory_ID),
	Manufacture_Date DATE,
	Modification_Date DATE
)



-- ProductTypes_tbl creation
-- (ProductType_ID, Type, Modification_Date)

CREATE TABLE ProductTypes_tbl (
	ProductType_ID INT PRIMARY KEY NOT NULL,
	[Type] VARCHAR (50),
 	Modification_Date DATE
)



-- ProductsInventory_tbl creation
-- (Inventory_ID, Quantity, Warehouse, Modification_Date)

CREATE TABLE ProductsInventory_tbl (
	Inventory_ID INT PRIMARY KEY IDENTITY (1,1),
	Quantity INT, 
	Warehouse VARCHAR (15),
	Modification_Date DATE,
	Model_ID INT NOT NULL
)

ALTER TABLE ProductsInventory_tbl
ADD ModifiedBy VARCHAR (25)




--******************************** Insert data into tables ***************************************


-- Insert into Employees_tbl

INSERT INTO Employees_tbl([Name],[LastName],[Position],[PhoneNumber_ID],[Email],[Address],[City],[Marital_Stauts],[DOB],[Genre],[Hire_Date],[Modification_Date]) 
VALUES	('Jonathan','Sanchez','CEO',2,'js.CEO@Printers_JS.com','4258 Aliquam St.','Santo Domingo','Married','09/16/1990','Male','01/01/2015','08/23/2021'),
	('Barbara','Dawson','SalesPerson',2,'tincidunt@magna.com','Ap #457-5723 Arcu Avenue','Santo Domingo','Single','11/29/1999','Male','08/13/2020','06/04/2021'),
	('Thaddeus','Hodges','SalesPerson',1,'laoreet.ipsum.Curabitur@Sed.org','P.O. Box 447, 4551 Sapien Ave','Santo Domingo','Married','12/20/1990','Female','09/13/2021','04/08/2022'),
	('Jessamine','Weeks','SalesPerson',2,'neque@quamCurabiturvel.ca','P.O. Box 238, 1984 Elit, Rd.','Santo Domingo','Married','06/06/1992','Female','03/16/2022','06/14/2022'),
	('Aiko','Lewis','SalesPerson',2,'lectus.pede@commodotinciduntnibh.edu','Ap #425-5814 Urna. Rd.','Santo Domingo','Widowed','02/13/1997','Male','10/01/2021','09/03/2021'),
	('Reagan','Mclaughlin','SalesPerson',2,'Cras.sed.leo@duiFuscealiquam.co.uk','P.O. Box 396, 1427 Auctor. Street','Santiago','Widowed','09/06/1995','Male','07/09/2021','04/28/2021'),
	('Victoria','Wade','SalesPerson',1,'magna@mollis.co.uk','P.O. Box 857, 8122 Commodo Ave','Santiago','Widowed','06/06/1991','Female','06/02/2021','07/22/2021'),
	('Charlotte','Dejesus','SalesPerson',3,'Ut.semper.pretium@aceleifend.org','P.O. Box 412, 8533 Orci Rd.','Santiago','Single','10/28/1991','Female','05/19/2021','04/21/2021'),
	('James','Mcintosh','SalesPerson',1,'a.malesuada@Sedcongueelit.ca','887-9817 Egestas. Rd.','Santiago','Single','12/04/2002','Male','03/22/2022','07/28/2022'),
	('Kyla','Salas','SalesPerson',2,'erat@adipiscinglacus.net','5332 Faucibus St.','Santiago','Married','06/01/2001','Male','04/09/2021','03/24/2022'),
	('Denton','Dawson','Cashier',1,'non.cursus@Quisque.net','Ap #133-458 Metus. St.','La Vega','Married','09/13/2000','Female','11/13/2020','11/22/2021'),
	('Plato','Huber','Cashier',2,'vitae.risus.Duis@quamafelis.net','2408 Neque Rd.','La Vega','Single','11/27/1991','Female','04/03/2021','06/30/2021'),
	('Quamar','Frye','Cashier',2,'id.ante.Nunc@nonmagna.edu','P.O. Box 647, 4552 Imperdiet St.','La Vega','Widowed','12/05/1996','Male','11/19/2020','10/14/2021'),
	('Hillary','Sawyer','Cashier',3,'ante.bibendum@nec.edu','513-8406 Imperdiet, Street','La Vega','Widowed','03/11/1995','Male','11/10/2020','10/07/2021'),
	('Carl','Hyde','Cashier',1,'quis.tristique@urnajusto.ca','197-431 Aliquam Rd.','La Vega','Single','04/08/2002','Female','07/09/2021','07/07/2022'),
	('Jermaine','Cruz','Cashier',2,'amet.risus@lobortisnisinibh.com','955-4216 Cras Rd.','Bonao','Widowed','07/22/1999','Female','07/20/2022','05/23/2021'),
	('Stacey','Nash','Cashier',1,'ornare.In.faucibus@mollis.ca','Ap #138-4232 Quisque Rd.','Bonao','Single','06/05/2003','Male','11/22/2020','09/06/2020'),
	('Jack','Knox','Cashier',2,'pede@ascelerisque.net','P.O. Box 344, 5158 Enim. Avenue','Bonao','Single','04/17/2003','Male','06/11/2021','08/12/2021'),
	('Yardley','Clark','Cashier',1,'risus.at.fringilla@interdumenim.net','5234 Leo, Avenue','Bonao','Widowed','07/09/2003','Female','07/18/2021','04/27/2021'),
	('Pascale','Meyer','Cashier',2,'gravida.molestie.arcu@Aeneansedpede.edu','P.O. Box 491, 1296 Elit, Av.','Bonao','Widowed','01/24/1997','Female','05/14/2022','02/12/2022'),
	('Isabelle','Cruz','Recursos Humanos',2,'natoque.penatibus@vitaeposuereat.co.uk','4792 Gravida Avenue','San Juan','Married','09/02/2001','Male','07/30/2022','10/15/2021'),
	('Wilma','Witt','Recursos Humanos',2,'vulputate.nisi.sem@elitfermentumrisus.net','P.O. Box 281, 4831 Tellus Street','San Juan','Widowed','06/17/2000','Male','02/04/2022','11/05/2021'),
	('Lynn','Diaz','Recursos Humanos',2,'fermentum.arcu@Suspendissesagittis.co.uk','Ap #327-5691 Phasellus Street','San Juan','Widowed','03/09/1998','Female','12/08/2020','05/10/2022'),
	('Patricia','Higgins','Recursos Humanos',2,'augue.eu.tempor@pedesagittis.edu','P.O. Box 544, 5880 Commodo Av.','San Juan','Widowed','11/29/1999','Female','09/17/2020','02/21/2022'),
	('Eric','Aguirre','Recursos Humanos',2,'et@feugiat.co.uk','Ap #498-1377 Blandit St.','San Juan','Married','04/12/1990','Male','08/10/2021','03/19/2021'),
	('Christopher','Kline','Recursos Humanos',2,'mi.eleifend.egestas@egestas.com','Ap #645-5398 Adipiscing Rd.','Bani','Widowed','05/23/1992','Male','09/11/2020','10/07/2021'),
	('Amir','Nash','Recursos Humanos',2,'dui.nec@sempereratin.edu','P.O. Box 488, 8228 Arcu. St.','Bani','Single','12/17/1996','Female','06/27/2021','12/20/2020'),
	('Porter','Lynch','Recursos Humanos',2,'arcu.imperdiet@Aliquamauctor.net','P.O. Box 880, 7843 Ultrices, Ave','Bani','Widowed','06/07/1991','Female','06/08/2021','03/03/2022'),
	('Bianca','Glover','Recursos Humanos',2,'nec@elementumsem.co.uk','P.O. Box 593, 1096 Enim Street','Bani','Widowed','05/16/2002','Male','07/24/2021','06/22/2022'),
	('Abraham','Berg','Recursos Humanos',3,'eros.turpis.non@mattisvelit.ca','Ap #568-4285 Ut, St.','Bani','Married','01/14/1993','Male','12/30/2021','12/25/2020'),
	('Chloe','Pearson','Gerente General',3,'ipsum@mollis.edu','P.O. Box 208, 9309 Sed Rd.','Santo Domingo','Widowed','08/12/1998','Female','08/01/2022','08/17/2020'),
	('Evelyn','Foreman','SalesPerson',3,'eu.elit.Nulla@necmollis.edu','495-5908 Nunc Avenue','Santo Domingo','Single','04/24/1998','Female','12/17/2021','03/27/2021'),
	('Ali','Ashley','SalesPerson',3,'ullamcorper@Donecestmauris.co.uk','505-8598 Pharetra, Street','Santo Domingo','Widowed','06/23/1990','Male','05/06/2022','11/21/2020'),
	('Jamal','Mccormick','SalesPerson',2,'malesuada.fames@nisidictumaugue.edu','8427 Rutrum Avenue','Santo Domingo','Single','03/05/2000','Male','12/21/2020','10/23/2020'),
	('Allen','Lowe','SalesPerson',3,'consequat@commodoat.co.uk','440-850 Malesuada Rd.','Santo Domingo','Widowed','04/18/1995','Female','06/29/2021','03/11/2021'),
	('Laurel','Valenzuela','SalesPerson',1,'at.risus.Nunc@nonhendreritid.com','425-4047 Quis, Street','Santiago','Single','03/02/1999','Female','11/01/2020','05/17/2021'),
	('Victor','Dudley','SalesPerson',1,'velit.dui@Integeraliquam.com','387-2436 Pellentesque Street','Santiago','Married','11/27/1995','Male','05/12/2021','05/17/2021'),
	('Abdul','Kaufman','SalesPerson',3,'gravida@neccursus.ca','Ap #542-5389 Auctor, Rd.','Santiago','Widowed','01/14/1991','Male','04/19/2021','07/10/2022'),
	('Wing','Mccarthy','SalesPerson',3,'lorem.eu@pede.ca','P.O. Box 836, 8586 Vulputate Rd.','Santiago','Married','04/19/1994','Female','05/13/2021','08/11/2020'),
	('Barrett','Kirby','SalesPerson',2,'purus.accumsan.interdum@orciDonec.net','P.O. Box 453, 2419 Donec Av.','Santiago','Widowed','02/03/2000','Female','05/10/2022','04/18/2021'),
	('Simon','Mercer','Mantenimiento',2,'eget.metus.eu@leoelementum.org','1412 Nulla Rd.','La Vega','Widowed','06/15/1994','Male','08/01/2021','03/02/2022'),
	('Edan','Rodgers','Mantenimiento',2,'sagittis.semper.Nam@sem.co.uk','952-5289 Non Street','La Vega','Single','10/09/1995','Male','08/05/2022','06/04/2021'),
	('Abra','Henson','Mantenimiento',3,'velit.eu.sem@Sedeget.co.uk','823-5076 Augue Rd.','La Vega','Single','09/14/1993','Female','01/07/2022','04/01/2021'),
	('Quinlan','Myers','Mantenimiento',2,'a.aliquet@urnasuscipit.net','Ap #489-3225 Ligula. St.','La Vega','Married','10/06/1995','Female','05/04/2021','01/16/2022'),
	('Orson','French','Mantenimiento',2,'eu.eleifend.nec@nuncest.org','P.O. Box 489, 3476 Velit. Street','La Vega','Single','01/14/1998','Male','07/06/2022','03/10/2022'),
	('Brock','Waters','Mantenimiento',2,'Morbi@Curabiturutodio.com','Ap #287-337 Lectus. St.','Bonao','Married','01/15/1996','Male','03/16/2022','05/26/2022'),
	('Elton','Mullen','SalesPerson',2,'ipsum.cursus.vestibulum@vestibulumMaurismagna.com','115-9953 Nunc Av.','Bonao','Widowed','06/28/1997','Female','12/09/2021','11/05/2021'),
	('Daryl','Sloan','SalesPerson',1,'facilisi.Sed.neque@rhoncus.net','Ap #342-2846 At St.','Bonao','Widowed','08/18/1998','Female','04/07/2022','06/26/2022'),
	('Serena','May','SalesPerson',1,'nec.eleifend.non@Donec.net','Ap #599-2556 Vivamus St.','Bonao','Widowed','02/19/1996','Male','04/18/2021','10/09/2021'),
	('Brent','Dominguez','SalesPerson',1,'nunc.interdum@aultricies.edu','9154 Elit, St.','Bonao','Widowed','09/28/1997','Male','01/10/2022','04/26/2021'),
	('Hu','Villarreal','Contable',1,'Nam@lorem.ca','854-382 Nam Ave','San Juan','Widowed','04/18/1990','Female','06/29/2021','12/18/2021'),
	('Laura','Chase','Contable',2,'eu.tellus@tellus.net','5457 Fermentum St.','San Juan','Widowed','03/04/1993','Female','07/12/2022','07/13/2021'),
	('Dante','Mccarty','Contable',3,'aliquam@euturpis.edu','5584 Aliquet. St.','San Juan','Married','05/04/2001','Male','05/26/2021','02/04/2021'),
	('Madeson','Stark','Contable',2,'pede.Suspendisse@eget.net','P.O. Box 892, 7811 Tellus. Rd.','San Juan','Married','08/07/1990','Male','01/07/2021','02/26/2022'),
	('Azalia','Robertson','Contable',2,'Sed.eget.lacus@miDuisrisus.ca','433-5742 Adipiscing St.','San Juan','Married','01/07/1992','Female','02/24/2022','08/08/2021'),
	('Lev','Lancaster','Contable',2,'ipsum@scelerisquescelerisquedui.net','340-3243 Mauris Street','Bani','Widowed','03/20/1995','Female','04/09/2021','10/04/2020'),
	('Shelly','Rose','SalesPerson',2,'eu@estNunc.org','789-477 Duis Av.','Bani','Widowed','03/15/1990','Male','03/17/2022','12/25/2020'),
	('Damon','Jacobson','SalesPerson',3,'et.ultrices@adipiscinglobortisrisus.net','Ap #199-2456 Nulla Avenue','Bani','Widowed','07/22/2000','Male','10/09/2020','09/26/2021'),
	('Chandler','Nicholson','SalesPerson',2,'in@pellentesque.com','8352 Egestas St.','Bani','Widowed','06/23/2002','Female','01/30/2021','04/15/2021'),
	('Oleg','Patterson','SalesPerson',2,'id@dignissimmagna.ca','P.O. Box 578, 1358 Cubilia Street','Bani','Single','05/31/1993','Female','01/12/2022','10/22/2020'),
	('Devin','Snider','Sales Manager',1,'Aliquam@non.net','5043 Elit St.','Santo Domingo','Married','03/28/2001','Male','11/14/2021','01/25/2021'),
	('Arthur','Fuentes','Sales Manager',2,'tellus.Nunc.lectus@enimnisl.co.uk','5984 Auctor. Rd.','Santo Domingo','Widowed','02/27/1999','Male','06/06/2021','01/12/2021'),
	('Steven','Meyer','Sales Manager',3,'Nunc@Vivamusnisi.com','Ap #578-4789 Consectetuer Av.','Santo Domingo','Widowed','12/18/2003','Female','07/04/2021','06/17/2022'),
	('Orla','Rich','Sales Manager',2,'metus.vitae.velit@nonduinec.co.uk','5151 Purus Avenue','Santo Domingo','Single','08/18/1993','Female','09/14/2021','03/30/2021'),
	('Wylie','Munoz','SalesPerson',2,'Etiam@sit.com','241-4800 Pharetra, Avenue','Santo Domingo','Married','06/13/1992','Male','04/13/2022','09/28/2020'),
	('Russell','Bryan','Sales Manager',2,'ante.ipsum.primis@orciUt.org','P.O. Box 136, 1530 Nisi. Av.','Santiago','Widowed','09/15/2001','Male','02/11/2022','01/07/2021'),
	('Andrew','Buck','Sales Manager',2,'id.mollis.nec@sedest.net','Ap #245-577 Semper St.','Santiago','Married','07/14/1990','Female','07/06/2021','01/02/2021'),
	('Aileen','Lewis','SalesPerson',2,'Curabitur.sed@enimSuspendissealiquet.com','453-4377 Ante. St.','Santiago','Widowed','07/03/1994','Female','09/26/2020','06/14/2021'),
	('Priscilla','Kidd','Recursos Humanos',2,'nisi.Mauris@egestasurnajusto.com','Ap #395-8096 Morbi Road','Santiago','Widowed','10/18/2002','Male','12/11/2021','02/28/2022'),
	('Nash','Burris','Recursos Humanos',2,'Ut.nec.urna@SuspendisseduiFusce.ca','Ap #137-9423 Interdum St.','Santiago','Widowed','12/21/1994','Male','01/29/2022','08/21/2020'),
	('Gay','Parrish','Cashier',1,'cursus.et.magna@dignissimMaecenas.co.uk','P.O. Box 235, 8571 Odio. St.','La Vega','Married','11/25/1991','Female','09/21/2020','07/27/2021'),
	('Daquan','Wilkerson','SalesPerson',2,'posuere.at.velit@felis.org','P.O. Box 526, 3007 Natoque Rd.','La Vega','Single','05/23/1995','Female','05/22/2021','12/29/2020'),
	('Jasmine','Macias','Cashier',3,'ipsum.leo.elementum@Mauris.co.uk','990-2493 Natoque Av.','La Vega','Married','06/30/1991','Male','02/01/2022','12/18/2020'),
	('Kareem','Small','SalesPerson',2,'nonummy@Quisqueac.ca','Ap #497-8157 Semper, St.','La Vega','Widowed','08/21/1992','Male','11/04/2021','09/29/2020');

SELECT * FROM Employees_tbl



-- Insert into EmployeesContact_tbl

INSERT INTO EmployeesContact_tbl 
VALUES	(1,'Casa','08/11/2021'),
	(2,'Celular','08/11/2021'),
	(3,'Otro','08/11/2021');

SELECT * FROM EmployeesContact_tbl



-- Insert into EmployeesPhoneNumber_tbl

INSERT INTO EmployeesPhoneNumber_tbl([Emp_ID],[PhoneNumber],[PhoneNumber_ID],[Modification_Date]) 
VALUES	(1,'1-648-431-9249','1','11/07/2016'), (2,'1-140-499-2379','1','05/20/2020'), (3,'1-423-440-1594','1','03/10/2021'), (4,'1-410-479-9989','2','05/06/2016'),
	(5,'1-378-387-2012','2','05/16/2018'), (6,'1-907-386-1829','2','07/10/2015'), (7,'1-857-947-5349','3','06/21/2021'), (8,'1-443-438-1400','3','02/03/2021'),
	(9,'1-354-334-9545','3','07/01/2020'), (10,'1-508-950-8084','1','02/06/2018'), (11,'1-391-304-5656','1','11/06/2019'), (12,'1-791-146-8022','1','08/31/2016'),
	(13,'1-452-110-0343','2','08/28/2015'), (14,'1-406-476-2037','2','06/11/2018'), (15,'1-549-166-5047','2','01/02/2020'), (16,'1-512-488-0300','3','07/12/2020'),
	(17,'1-233-424-0942','3','08/03/2020'), (18,'1-559-440-2995','3','11/16/2020'), (19,'1-792-572-5201','1','05/17/2015'), (20,'1-189-406-4076','1','01/30/2016'),
	(21,'1-516-572-8018','1','05/21/2015'), (22,'1-517-537-8409','2','12/19/2017'), (23,'1-420-141-3542','2','08/08/2017'), (24,'1-429-394-0284','2','12/04/2019'),
	(25,'1-431-344-9405','3','01/16/2018'), (26,'1-133-247-0495','3','06/07/2015'), (27,'1-569-540-4515','3','02/11/2018'), (28,'1-429-354-1456','1','02/13/2021'),
	(29,'1-540-457-2541','1','06/22/2017'), (30,'1-248-515-0396','1','06/18/2018'), (31,'1-984-791-5642','2','08/01/2020'), (32,'1-312-153-9248','2','11/27/2017'),
	(33,'1-213-562-5113','2','12/18/2020'), (34,'1-358-517-1507','3','07/09/2015'), (35,'1-543-377-9441','3','06/13/2016'), (36,'1-199-396-5307','3','04/07/2016'),
	(37,'1-289-535-8213','1','11/08/2017'), (38,'1-125-507-9832','1','06/04/2019'), (39,'1-340-180-0122','1','12/14/2017'), (40,'1-898-356-8951','2','03/16/2020'),
	(41,'1-951-515-8197','2','12/21/2018'), (42,'1-898-538-0439','2','03/25/2021'), (43,'1-890-217-9571','3','03/18/2020'), (44,'1-644-313-0847','3','06/01/2020'),
	(45,'1-883-312-3923','3','06/08/2018'), (46,'1-177-907-3221','1','06/07/2021'), (47,'1-424-551-8948','1','05/18/2018'), (48,'1-512-242-5496','1','01/11/2017'),
	(49,'1-324-814-2518','2','04/07/2018'), (50,'1-200-424-2895','2','01/07/2021'), (51,'1-216-877-0857','2','10/24/2020'), (52,'1-429-240-7831','3','05/28/2016'),
	(53,'1-576-538-4491','3','10/17/2019'), (54,'1-450-466-5033','3','05/08/2015'), (55,'1-425-905-4166','1','07/24/2017'), (56,'1-568-405-9525','1','08/18/2015'),
	(57,'1-896-209-0848','1','08/15/2015'), (58,'1-912-996-0757','2','03/15/2015'), (59,'1-577-563-4039','2','02/12/2018'), (40,'1-552-486-4085','2','02/25/2017'), 
	(41,'1-289-223-9947','3','08/10/2018'), (42,'1-948-129-2824','3','10/05/2018'), (43,'1-483-843-5953','3','04/09/2020'), (44,'1-497-499-0976','1','07/12/2017'),
	(45,'1-852-570-5223','1','05/02/2017'), (66,'1-980-932-0457','1','12/17/2018'), (47,'1-316-441-1572','2','02/11/2021'), (48,'1-599-195-8415','2','04/06/2020'),
	(49,'1-561-198-8985','2','02/20/2018'), (50,'1-538-994-1448','3','06/21/2019'), (51,'1-286-541-4285','3','01/20/2016'), (52,'1-438-589-5593','3','03/23/2015'),
	(53,'1-206-258-9343','1','12/01/2019'), (56,'1-382-114-8535','1','07/08/2016');

SELECT * FROM EmployeesPhoneNumber_tbl



-- Insert into Sales_tbl

INSERT INTO Sales_tbl ([SalesPerson_ID],[Model_ID],[Client_ID],[ProductType_ID],[Quantity],[Unit_Price],[Store_ID],[EmpCashier],[Modification_Date]) 
VALUES	(2,1,2,2,4,593,4,11,'08/01/2018'), (2,11,2,1,3,573,5,11,'12/10/2020'), (3,25,3,1,5,344,6,11,'08/09/2015'), (3,25,4,6,3,793,3,12,'03/10/2020'), 
	(4,9,5,1,6,785,3,12,'08/25/2015'), (4,18,6,2,7,986,6,12,'12/11/2015'), (5,16,7,5,5,563,4,13,'10/22/2020'), (5,3,8,1,4,856,6,13,'02/28/2018'), 
	(6,3,9,6,5,560,6,13,'09/27/2020'), (6,21,10,6,4,1089,1,14,'12/04/2020'), (7,20,11,3,4,561,3,14,'03/10/2019'), (7,15,12,3,7,426,2,14,'08/10/2016'), 
	(8,5,13,3,3,1003,6,15,'05/29/2020'), (8,2,14,2,1,353,3,15,'01/10/2021'), (9,19,15,1,1,832,3,15,'08/09/2015'), (9,26,16,3,3,880,1,16,'04/20/2015'), 
	(10,13,17,3,5,816,5,16,'08/28/2018'), (10,15,18,6,2,422,4,16,'10/10/2020'), (32,26,19,1,6,829,5,17,'10/04/2018'), (32,7,20,2,5,819,2,17,'08/10/2019'), 
	(33,21,21,2,1,457,1,17,'02/22/2021'), (33,21,22,1,1,348,5,18,'07/22/2018'), (34,3,23,2,6,202,5,18,'03/10/2021'), (34,17,24,5,4,384,4,18,'07/04/2017'), 
	(35,12,25,2,7,321,1,19,'02/04/2015'), (35,6,26,4,6,524,1,19,'01/19/2016'), (36,21,27,2,6,200,2,19,'01/07/2019'), (36,13,28,4,7,286,4,20,'02/10/2018'), 
	(37,15,29,2,4,481,2,20,'04/11/2021'), (37,2,30,5,2,344,4,20,'03/15/2015'), (38,20,31,3,7,815,5,51,'08/11/2015'), (38,15,32,2,3,846,1,51,'01/08/2019'), 
	(39,21,33,3,3,304,6,51,'10/24/2018'), (39,21,34,2,5,928,1,53,'01/23/2016'), (40,23,35,3,1,920,1,53,'03/29/2019'), (40,2,36,3,4,477,4,53,'05/18/2019'), 
	(47,20,37,5,2,649,6,11,'02/23/2017'), (47,27,38,1,6,336,4,11,'04/07/2016'), (48,17,39,3,3,543,2,11,'11/06/2018'), (48,18,40,6,5,352,5,12,'04/27/2017'), 
	(49,9,41,2,6,330,1,12,'06/14/2021'), (49,9,42,1,3,593,2,12,'03/28/2020'), (50,21,43,6,5,550,3,13,'08/31/2017'), (50,17,44,6,5,1076,2,13,'11/17/2017'), 
	(57,10,45,3,3,1052,1,13,'08/21/2015'), (57,26,46,2,6,481,1,14,'06/05/2018'), (58,20,47,6,5,282,5,14,'11/08/2017'), (58,2,48,1,7,1056,4,14,'04/16/2018'), 
	(59,7,49,5,1,982,3,15,'02/28/2015'), (59,3,50,1,1,226,1,15,'04/02/2017'), (40,17,51,2,6,249,2,15,'02/11/2017'), (40,20,52,6,7,585,6,16,'02/28/2016'), 
	(45,13,53,5,1,984,5,16,'06/02/2017'), (45,8,54,5,7,283,1,16,'08/14/2018'), (48,12,55,6,2,555,6,17,'12/26/2015'), (48,26,56,6,5,1058,5,17,'08/29/2016'), 
	(52,19,57,1,3,809,3,17,'05/10/2019'), (52,11,58,3,3,314,6,18,'08/01/2017'), (56,27,59,5,1,1000,4,18,'11/08/2019'), (56,12,40,5,1,1002,3,18,'11/29/2019'), 
	(2,25,41,6,2,496,3,19,'06/01/2016'), (2,5,42,1,2,966,3,19,'09/26/2017'), (3,17,43,5,3,376,6,19,'04/05/2020'), (3,10,44,5,7,825,1,20,'03/13/2019'), 
	(4,2,45,6,7,309,1,20,'03/04/2016'), (4,27,66,1,7,280,1,20,'06/02/2017'), (5,19,47,6,6,900,1,51,'11/10/2016'), (5,4,48,6,6,242,2,51,'04/19/2016'), 
	(6,21,49,2,1,904,2,51,'03/07/2017'), (6,21,50,6,7,888,1,53,'05/16/2015'), (7,23,51,4,2,989,1,53,'09/09/2019'), (7,22,52,4,5,427,3,53,'03/19/2015'), 
	(8,7,53,4,3,284,3,11,'01/28/2021'), (8,5,56,2,3,913,6,11,'04/29/2020'), (9,16,57,1,7,522,6,11,'08/05/2015'), (9,2,76,1,6,1081,3,12,'01/27/2020'), 
	(10,15,77,1,4,1089,3,12,'12/22/2019'), (10,14,78,5,6,497,4,12,'08/05/2017'), (32,18,79,2,4,527,5,13,'09/27/2017'), (32,15,80,4,4,929,3,13,'07/15/2021'), 
	(33,4,81,1,6,305,6,13,'03/02/2021'), (33,11,82,1,4,1040,4,14,'01/17/2020'), (34,11,83,1,7,1097,1,14,'07/08/2019'), (34,19,84,1,7,805,4,14,'12/09/2019'), 
	(35,2,85,5,2,985,3,15,'01/14/2015'), (35,17,86,2,2,341,1,15,'12/08/2018'), (36,12,87,1,6,1048,2,15,'05/22/2016'), (36,16,88,4,4,443,6,16,'02/18/2015'), 
	(37,3,89,1,7,396,2,16,'10/26/2016'), (37,25,90,1,2,849,6,16,'09/12/2020'), (38,23,91,1,2,598,3,17,'08/04/2018'), (38,7,92,3,1,791,2,17,'09/30/2019'), 
	(39,11,93,1,2,509,1,17,'03/30/2016'), (39,4,94,6,1,940,5,18,'07/19/2017'), (40,15,95,3,4,537,1,18,'01/29/2021'), (40,12,96,2,5,314,1,18,'12/09/2016'), 
	(47,5,97,2,4,457,3,19,'08/21/2019'), (47,10,98,5,1,912,3,19,'10/01/2020'), (48,5,99,5,3,545,5,19,'04/08/2020'), (48,28,100,2,1,928,3,20,'12/17/2015'), 
	(2,8,101,2,1,899,5,11,'08/28/2016'), (2,12,102,2,4,413,2,11,'08/28/2017'), (3,8,103,3,7,457,1,11,'06/03/2017'), (3,28,104,3,5,341,3,12,'11/22/2018'), 
	(4,9,105,1,1,528,5,12,'05/22/2015'), (4,23,106,1,1,1002,3,12,'12/27/2016'), (5,23,107,3,2,855,3,13,'12/27/2019'), (5,22,108,1,6,882,6,13,'12/08/2019'), 
	(6,9,109,1,6,908,5,13,'03/31/2016'), (6,17,110,5,6,1007,1,14,'08/25/2016'), (7,13,111,6,1,353,4,14,'06/28/2017'), (7,26,112,1,6,381,3,14,'03/22/2017'), 
	(8,21,113,2,4,957,6,15,'08/08/2021'), (8,16,114,1,4,919,3,15,'09/07/2019'), (9,28,115,4,5,247,5,15,'10/03/2020'), (9,26,116,6,4,436,5,16,'04/18/2021'), 
	(10,2,117,2,4,303,3,16,'04/30/2018'), (10,7,118,6,4,933,5,16,'04/15/2015'), (32,15,119,1,1,450,3,17,'04/25/2019'), (32,26,120,6,5,424,4,17,'02/02/2016'),
	(33,13,121,3,4,500,6,17,'11/15/2017'), (33,4,122,2,3,898,2,18,'05/24/2020'), (34,3,123,2,7,202,2,18,'01/04/2015'), (34,10,124,3,2,544,2,18,'11/15/2017'), 
	(35,11,125,6,5,207,3,19,'05/27/2020'), (35,1,126,4,2,544,4,19,'05/11/2021'), (36,3,127,4,7,578,6,19,'11/27/2018'), (36,4,128,2,2,854,4,20,'11/30/2019'), 
	(37,10,129,3,1,910,4,20,'08/04/2016'), (37,11,130,1,4,347,1,20,'08/15/2015'), (38,2,131,1,2,592,5,51,'05/20/2017'), (38,8,132,5,7,597,3,51,'12/06/2019'), 
	(39,2,133,2,7,1017,3,51,'02/15/2021'), (39,2,134,3,6,1030,5,53,'04/02/2021'), (40,5,135,6,4,1039,3,53,'04/20/2017'), (40,1,136,2,4,666,5,53,'10/21/2016'), 
	(47,19,137,4,3,278,3,11,'01/31/2015'), (47,16,138,3,4,225,3,11,'10/14/2018'), (48,20,139,4,7,259,1,11,'07/13/2019'), (48,15,140,3,5,456,5,12,'02/20/2019'), 
	(49,17,141,1,2,253,6,12,'10/25/2020'), (49,14,142,2,6,915,2,12,'03/30/2019'), (50,4,143,5,5,1024,5,13,'06/30/2021'), (50,7,144,1,6,1028,2,13,'12/18/2019'), 
	(57,5,145,6,5,585,1,13,'03/05/2018'), (57,11,146,6,3,847,1,14,'03/18/2021'), (58,25,147,6,6,346,6,14,'05/25/2021'), (58,20,148,2,7,1044,6,14,'12/07/2016'), 
	(59,6,149,3,7,522,2,15,'08/17/2015'), (59,13,150,1,7,443,1,15,'05/28/2016'), (40,27,151,6,2,827,4,15,'02/05/2021'), (40,21,152,6,4,322,3,16,'06/30/2015'), 
	(45,17,153,3,5,895,3,16,'11/19/2019'), (45,25,154,1,6,539,1,16,'11/25/2017'), (48,2,155,6,7,213,5,17,'07/07/2019'), (48,1,156,2,7,1057,5,17,'05/14/2020'), 
	(52,15,157,2,2,489,5,17,'08/24/2018'), (52,26,158,1,3,296,1,18,'05/31/2020'), (56,7,159,3,6,552,2,18,'05/27/2016'), (56,3,140,6,1,921,1,18,'12/31/2018'), 
	(2,25,141,5,5,445,5,19,'10/27/2019'), (2,1,142,4,4,252,1,19,'08/20/2017'), (3,7,143,5,4,816,4,19,'07/31/2015'), (3,18,144,5,5,483,5,20,'06/19/2019'), 
	(4,25,145,5,1,330,5,20,'05/20/2017'), (4,14,166,6,2,485,4,20,'08/15/2015'), (5,4,147,1,2,487,2,51,'11/28/2016'), (5,19,148,2,6,513,4,51,'01/15/2018'), 
	(6,22,149,3,2,984,5,51,'02/12/2021'), (6,13,150,4,5,514,4,53,'05/09/2016'), (7,21,151,5,1,481,3,53,'05/22/2020'), (7,1,152,3,7,902,1,53,'08/22/2020'), 
	(8,24,153,3,4,250,4,11,'08/18/2017'), (8,1,156,2,2,247,3,11,'08/26/2015'), (9,17,157,6,6,502,5,11,'03/30/2019'), (9,18,176,6,4,1084,2,12,'07/16/2020'), 
	(10,16,177,6,4,894,5,12,'05/31/2016'), (10,17,178,6,7,540,6,12,'04/07/2015'), (32,9,179,1,6,570,1,13,'11/24/2016'), (32,18,180,3,3,400,3,13,'07/25/2020'), 
	(33,4,181,5,6,1016,3,13,'03/28/2021'), (33,3,182,2,5,807,4,14,'03/15/2019'), (34,1,183,2,5,571,2,14,'09/12/2020'), (34,5,184,5,2,813,1,14,'10/02/2015'), 
	(35,22,185,5,6,1014,3,15,'12/24/2018'), (35,10,186,5,7,357,1,15,'08/02/2017'), (36,20,187,5,6,516,2,15,'09/25/2016'), (36,27,188,1,6,449,1,16,'07/15/2016'), 
	(37,7,189,2,3,427,3,16,'12/03/2017'), (37,25,190,4,1,1076,2,16,'08/16/2019'), (38,9,191,4,1,568,1,17,'05/17/2021'), (38,20,192,4,1,1049,4,17,'01/31/2021'), 
	(39,26,193,1,4,499,1,17,'05/09/2017'), (39,13,194,4,7,406,6,18,'07/30/2020'), (40,25,195,2,2,825,3,18,'02/25/2018'), (40,27,196,6,2,458,3,18,'04/20/2021'), 
	(47,25,197,6,6,437,4,19,'05/11/2015'), (47,6,198,2,4,847,5,19,'05/20/2017'), (48,10,199,2,7,251,6,19,'12/12/2015'), (48,10,200,6,1,948,1,20,'08/26/2018')

UPDATE Sales_tbl
SET Total = Quantity * Unit_Price

SELECT * FROM Sales_tbl



-- Insert into Clients_tbl

INSERT INTO Clients_tbl([Name],[LastName],[PhoneNumber_Primary],[Address],[City],[Email],[Modification_Date]) 
VALUES('Nerea','Rosa','1-353-141-2487','Apdo.:570-4903 Aliquet Ctra.','Quinta Normal','sit.amet@ultricesVivamusrhoncus.org','11/04/2017'), ('Porter','Pratt','1-935-822-4444','440-9356 Vitae, Av.','Seattle','Proin@Donecsollicitudin.org','03/19/2016'),
('Angela','Cantrell','1-293-118-2047','Apartado núm.: 499, 8581 Quam Avenida','Beverley','malesuada.vel.convallis@adipiscingnonluctus.org','08/05/2019'), ('Garrison','Smith','1-821-434-4535','Apdo.:438-2827 Lectus Avenida','Aubange','mollis.vitae.posuere@et.net','01/08/2017'),
('Erasmus','Copeland','1-299-893-2404','569-9185 Donec C.','Leval-Chaudeville','Donec.tempor@arcuetpede.edu','04/25/2019'), ('Chaim','Coleman','1-253-569-1387','Apdo.:312-2188 A C.','Lives-sur-Meuse','sit.amet@maurisMorbi.net','05/01/2019'),
('Kuame','Miranda','1-313-524-0850','Apartado núm.: 331, 4257 Vel, ','Rapagnano','pharetra@gravida.org','05/16/2021'), ('Kathleen','Washington','1-809-947-2229','Apdo.:552-9491 Et, Carretera','Follina','adipiscing.lobortis.risus@duiFusce.net','08/03/2018'),
('Summer','Wiggins','1-245-113-3508','566-4934 Commodo ','Vejalpur','at.nisi.Cum@inmagnaPhasellus.com','05/01/2020'), ('Brynn','Mcconnell','1-512-147-9551','428-2998 Eu C/','Puri','mauris.ipsum.porta@aliquet.net','11/16/2017'),
('Serena','Finch','1-182-421-5443','166-4840 Semper Asda.','Hillsboro','vulputate@semvitae.co.uk','07/08/2017'), ('Yoko','Crane','1-247-943-9322','2029 Ligula. Calle','Dos Hermanas','Cum@Proin.ca','10/04/2015'),
('Yasir','Orr','1-421-983-2178','Apdo.:258-5638 Eu Carretera','Desteldonk','felis.ullamcorper@a.net','04/15/2020'), ('Evan','Riggs','1-844-420-3552','952-5023 Molestie Avenida','Wardha','natoque@id.org','07/06/2019'),
('Ivory','Gould','1-569-327-9924','Apartado núm.: 325, 5811 Mauris C.','North Barrackpur','odio.a@Sedcongue.co.uk','11/12/2016'), ('Nissim','Melendez','1-404-570-0956','5747 Tortor. Avenida','Chandrapur','tellus.imperdiet@Phasellusin.org','02/01/2015'),
('Herrod','Hess','1-911-991-4007','103-3478 Ultricies Av.','Novozybkov','vel@ac.ca','06/12/2021'), ('Ferdinand','Powers','1-302-804-4504','Apdo.:509-3443 Gravida Asda.','Marke','faucibus.leo@sociisnatoquepenatibus.co.uk','07/19/2017'),
('Raja','Bush','1-914-444-4893','539-191 Eleifend Calle','Sialkot','ut@vulputateveliteu.com','01/22/2020'), ('Chadwick','Rivera','1-292-912-5710','8318 Non, C/','Denny','Curabitur.vel.lectus@sitamet.ca','06/04/2018'),
('Aileen','Melendez','1-406-235-4413','571-5344 Eros. Av.','Corswarem','ac.libero@fermentumfermentum.edu','11/13/2015'), ('Violet','Mooney','1-544-231-0290','954-5680 Euismod ','Sepino','magna@vitae.edu','05/11/2017'),
('Raymond','Byers','1-566-951-1379','5293 Risus. Calle','Darlington','ipsum.Suspendisse.non@purusin.ca','04/12/2016'),('Cairo','Douglas','1-827-819-4811','Apdo.:452-9357 Penatibus C/','Plancenoit','ullamcorper@sed.org','09/15/2015'),
('Kyra','Delacruz','1-349-412-0391','Apartado núm.: 105, 3588 Augue Avenida','Jefferson City','egestas.a@pulvinar.org','06/11/2020'),('Stone','Sears','1-985-908-4801','Apdo.:485-9919 Magnis C.','Ankara','ac@Donec.org','12/27/2016'),
('Dolan','Abbott','1-123-820-1125','Apartado núm.: 454, 7943 Enim Carretera','Pereira','Maecenas.malesuada@scelerisqueloremipsum.org','04/27/2016'),('Nolan','Edwards','1-496-487-9225','Apdo.:989-9595 Et Carretera','HavrŽ','amet.dapibus.id@ornareelit.org','02/18/2016'),
('Christian','Bates','1-303-575-8140','Apartado núm.: 420, 4005 Magna. Asda.','Pont-ˆ-Celles','pede.et@pharetraQuisqueac.net','10/01/2015'),('Elijah','Haney','1-525-911-7949','5486 Non, C/','Colina','a.dui@perinceptos.co.uk','09/02/2015'),
('Bianca','Stone','1-432-783-1796','9113 Dolor. Avenida','Grantham','lectus.convallis@natoque.ca','06/05/2018'),('Chaim','Mayo','1-914-505-5784','256-8855 Nunc Carretera','LouveignŽ','eros@senectuset.org','02/01/2021'),
('Celeste','Ryan','1-889-191-4084','5221 Diam ','Motala','sit@metussitamet.net','09/06/2019'),('Elliott','Mcintyre','1-905-135-1409','Apdo.:500-8340 Erat Ctra.','Te Awamutu','risus@arcuVivamus.ca','03/26/2016'),
('Galvin','Owen','1-521-477-8433','944 Rutrum, Carretera','Ottignies','eu.eros@Donecest.org','10/19/2018'),('Dai','Cook','1-253-140-0351','412-2037 Arcu Av.','Waiblingen','at@pellentesqueSed.ca','11/10/2020'),
('Melanie','Love','1-525-564-2431','2151 Elit, Asda.','Obaix','Sed.nec@sagittis.net','01/27/2017'),('Celeste','Glass','1-328-894-5813','543-443 Pharetra, ','Fort Simpson','cubilia.Curae.Phasellus@Vestibulum.co.uk','04/12/2021'),
('Jelani','Hobbs','1-943-766-2599','5834 Odio Avenida','Ipswich','malesuada.vel.venenatis@sitamet.com','03/21/2020'),('Keith','Mullen','1-799-140-4348','Apartado núm.: 553, 5101 Ultrices Ctra.','Wrigley','tempor@etrutrum.co.uk','07/07/2018'),
('Mufutau','Landry','1-539-556-4827','Apdo.:453-9328 Blandit. Calle','Ribeirão das Neves','Phasellus.dolor.elit@vitaediam.org','09/09/2019'),('Amery','Guzman','1-882-798-0423','482-9202 Sed C/','High Level','adipiscing.elit@Nullatincidunt.net','04/06/2016'),
('Anne','Melton','1-143-479-2201','9429 Non Calle','Quenast','in@pellentesqueegetdictum.com','04/13/2016'),('Blaze','Dejesus','1-535-218-0282','3526 Bibendum Ctra.','Bajardo','Quisque.fringilla.euismod@Crasvehiculaaliquet.ca','12/12/2018'),
('Samantha','Leonard','1-456-866-4525','Apartado núm.: 521, 4486 Dui Calle','Malderen','ac.metus@vestibulumlorem.ca','09/25/2019'),('Addison','Estrada','1-447-409-5702','5293 Non Asda.','Lestizza','Cum.sociis@musAeneaneget.co.uk','09/07/2020'),
('Boris','Coffey','1-541-119-1540','243-5949 Scelerisque C.','Çeşme','et.ipsum.cursus@loremvehiculaet.edu','03/01/2019'),('Kenneth','Schultz','1-319-905-4999','Apdo.:345-8854 Nec, Avenida','Seilles','Curabitur.massa.Vestibulum@Uttinciduntorci.edu','08/01/2021'),
('Isadora','Stuart','1-836-923-5544','Apdo.:998-2334 Molestie C.','Durg','vel@eunulla.org','01/23/2021'),('Hyatt','Lynch','1-455-884-8826','Apdo.:425-5151 Erat ','Parrano','accumsan.convallis@Donec.net','09/11/2019'),
('Desirae','Randall','1-952-791-1994','459-1183 Risus, ','Seosan','consectetuer@nec.ca','04/27/2020'),('Erasmus','Dyer','1-410-425-8483','Apartado núm.: 802, 2945 Vel Calle','Colledimacine','a.nunc@Suspendisse.edu','08/14/2018'),
('Wanda','Nichols','1-420-533-7813','Apdo.:190-5457 Gravida. Av.','Wichelen','nec.ligula.consectetuer@tellus.org','07/28/2020'),('Veda','Carroll','1-843-421-9455','3498 Ornare Asda.','Baschi','felis.Nulla@commodoipsumSuspendisse.org','02/28/2019'),
('Tanek','Thompson','1-351-149-7572','5450 Tristique ','Stirling','Maecenas.malesuada@Suspendissecommodotincidunt.net','10/24/2015'),('Ebony','Bradley','1-480-948-9255','Apartado núm.: 803, 8419 Dolor Calle','Romeral','quis.lectus.Nullam@scelerisque.edu','03/11/2021'),
('Emma','Head','1-409-477-4059','418-405 Lorem Ctra.','Ipiales','lectus.a@Suspendissesed.net','10/19/2020'),('Todd','Luna','1-450-776-2007','359-1549 Nullam Ctra.','Calbuco','nunc@fringillamilacinia.net','01/05/2017'),
('Aurelia','Browning','1-563-252-8143','Apartado núm.: 992, 2918 Adipiscing Avenida','Frankenthal','leo@dictumultricies.edu','10/09/2016'),('Lesley','Holman','1-214-839-4545','4283 Lorem. C/','Frauenkirchen','eu.arcu@Nullatinciduntneque.net','10/28/2017'),
('Irene','Conway','1-534-123-4257','Apartado núm.: 354, 4544 Enim. C/','Mandi Bahauddin','metus.Aenean@eunibhvulputate.ca','12/06/2017'),('Rachel','Patton','1-447-382-1495','213-2958 Sed C/','Istanbul','faucibus.leo@duiSuspendisse.com','08/07/2017'),
('Holmes','Sears','1-232-451-2346','950-7981 Risus. Asda.','Diegem','non@lacusUt.co.uk','07/24/2020'),('Lavinia','Luna','1-429-901-4017','514-2876 Arcu. C/','Piotrków Trybunalski','amet.nulla.Donec@nisiaodio.edu','12/25/2020'),
('Peter','Clayton','1-923-422-3043','Apartado núm.: 220, 1495 Mauris ','Vallenar','nunc.id@Inat.edu','11/06/2016'),('Hanna','Mendez','1-982-581-2053','Apdo.:914-9193 Erat Ctra.','Leduc','Proin.ultrices.Duis@diamat.org','10/02/2020'),
('Quin','Phelps','1-882-456-3014','8523 Pharetra. Avenida','Saint-Prime','Cras.pellentesque.Sed@Class.ca','07/21/2016'),('Lacy','Fowler','1-481-385-8153','Apdo.:128-1912 At, Carretera','Klosterneuburg','erat@commodoat.com','08/09/2015'),
('Beverly','Crawford','1-536-941-4500','434-1018 Nulla ','Ettelgem','imperdiet.ullamcorper@Integeraliquam.co.uk','06/04/2021'), ('Hasad','Hancock','1-943-107-1553','Apdo.:113-2583 Egestas, C.','Güstrow','Donec.nibh@Curabitur.co.uk','06/16/2020'), 
('Henry','Osborn','1-588-844-2066','255-4237 Tellus ','La Salle','Nunc.ac.sem@interdumligula.com','02/03/2019'),('Robin','Schmidt','1-416-554-7830','Apartado núm.: 136, 1350 Eu, Ctra.','Cantley','varius.orci.in@imperdieterat.org','11/01/2018'),
('Martina','Mcguire','1-282-594-7947','Apartado núm.: 790, 4984 Enim. Calle','Badajoz','id@duiquis.net','12/19/2016'),('Brittany','Woods','1-841-138-5680','257-4515 Libero Ctra.','Bozeman','blandit.viverra.Donec@mollisnon.edu','01/27/2017'),
('Miranda','Tucker','1-481-480-5443','Apartado núm.: 951, 4914 At Carretera','Canterano','Proin@Integereu.co.uk','03/31/2020'),('Brian','Sutton','1-841-400-8504','Apartado núm.: 291, 9013 Luctus Avenida','Vilna','eget.mollis@nisiCum.com','04/11/2018'),
('Stephen','Solis','1-577-888-4422','449-2510 Quis Asda.','Samsun','egestas@nibhAliquam.org','10/16/2016'),('Nathaniel','Bowman','1-137-247-8480','Apartado núm.: 920, 3910 Nunc ','Fort Smith','id.risus.quis@inconsectetueripsum.co.uk','12/13/2019'),
('Gemma','Spence','1-421-195-3489','Apartado núm.: 288, 1456 At Avenida','Farrukhabad-cum-Fatehgarh','id@quis.org','03/04/2017'),('Vance','Mcmillan','1-996-528-3521','207-4830 Nulla C.','Scunthorpe','quis.massa@vitae.edu','03/08/2021'),
('Hyatt','Cervantes','1-947-146-9209','8298 Aliquet, Carretera','Columbus','Quisque.nonummy@gravida.net','01/03/2015'),('India','Merrill','1-953-336-5596','Apartado núm.: 229, 2357 Velit. C.','Legnica','dictum.mi.ac@leoVivamus.com','04/14/2021'),
('Molly','Vargas','1-435-347-4431','532 Magna. ','Tilff','Vivamus.sit.amet@mollis.ca','10/29/2018'),('Daniel','Hughes','1-925-106-8945','Apdo.:831-9858 Mollis Asda.','Couthuin','Nunc@dolor.co.uk','02/12/2021'),
('Kylan','Orr','1-507-573-7579','Apdo.:454-8998 Pellentesque Carretera','Lummen','mus.Proin@Nuncut.edu','02/21/2018'),('Nathaniel','Saunders','1-576-240-5110','Apdo.:249-2832 Interdum Avenida','Koningshooikt','Aenean.eget@Duissitamet.com','09/05/2019'),
('Charles','Rich','1-125-535-9036','Apartado núm.: 417, 4058 Semper Av.','Russell','Quisque.imperdiet@etcommodo.edu','10/17/2020'),('Scott','Padilla','1-190-212-5456','Apdo.:448-9142 Dignissim ','Sgonico','quam.Curabitur@magnaNamligula.edu','03/17/2017'),
('Aurora','Mcknight','1-533-337-4226','426-288 Sapien. Ctra.','Lillois-WitterzŽe','Nam@dolorFuscefeugiat.edu','12/17/2016'),('Hector','Dotson','1-947-938-4515','5579 Consectetuer C.','Rosenheim','luctus.felis@commodoatlibero.org','06/18/2015'),
('Naida','Irwin','1-457-418-2789','4235 Nunc Carretera','Bossuit','lorem.eu@metusVivamuseuismod.ca','03/29/2021'),('Kalia','Nielsen','1-303-152-8589','Apdo.:590-5217 Ut C/','Varena','non.enim.commodo@idrisus.edu','08/14/2015'),
('Virginia','Wilder','1-319-442-1251','Apartado núm.: 843, 2012 Aliquam Asda.','Leamington','sapien.Nunc@aultriciesadipiscing.com','09/20/2020'),('Zane','Velazquez','1-250-446-5345','Apdo.:430-5642 Lacinia Ctra.','Miranda','luctus.lobortis@nuncullamcorper.com','07/08/2015'),
('Wayne','Arnold','1-436-349-5709','995-5639 Odio. Avenida','Olathe','interdum.libero.dui@Pellentesque.edu','11/08/2020'),('Caleb','Sharpe','1-943-159-4055','Apartado núm.: 815, 2839 Dui. Avenida','Gouvy','dui.Fusce.aliquam@orcitinciduntadipiscing.co.uk','12/12/2019'),
('Lesley','Donovan','1-103-456-9187','8805 Interdum C/','Daska','ornare@justoPraesentluctus.com','09/10/2018'),('Jakeem','Grimes','1-240-107-8586','Apartado núm.: 108, 7958 Lacus. Calle','Detroit','gravida@Nullamvelitdui.com','09/16/2018'),
('Cara','Walton','1-512-575-4836','9237 Tempor C/','Maastricht','Ut@primis.org','03/02/2018'),('Casey','Guy','1-212-454-6487','Apartado núm.: 933, 779 At Avenida','Souvret','ac.facilisis.facilisis@gravidasit.com','11/13/2018'),
('Jonah','Mcclure','1-225-956-5139','1849 Orci, C.','Orp-le-Grand','id.enim@dictum.com','02/26/2018'),('Tyrone','Roach','1-981-757-2876','Apdo.:385-9119 Interdum ','Lac La Biche County','hendrerit.neque.In@Craseutellus.co.uk','02/25/2018'),
('Virginia','Burks','1-394-556-4483','2108 Eu Avenida','Tuktoyaktuk','gravida@nonlobortisquis.co.uk','04/21/2015'),('Dale','Mooney','1-288-487-2541','Apdo.:255-2783 Quisque ','Selva di Cadore','blandit@Duisgravida.net','03/05/2021'),
('Jessamine','Cote','1-236-447-5643','5506 Tellus Av.','Gonnosfanadiga','tristique@estmollisnon.org','09/15/2016'),('Jonah','Wilkins','1-537-882-2234','Apartado núm.: 852, 9570 Eu C.','Burhaniye','parturient.montes@scelerisqueloremipsum.net','10/15/2015'),
('Jasper','Conrad','1-805-122-5286','Apdo.:413-4378 Mauris Asda.','Sachs Harbour','ut.mi.Duis@dictummi.net','11/26/2018'),('Upton','Hurst','1-348-429-4418','Apartado núm.: 405, 2495 Facilisis. C.','Norfolk County','ultricies.sem.magna@metusurnaconvallis.net','06/11/2018'),
('Irma','Mckay','1-243-222-1940','562-3198 Eleifend, Asda.','Rothesay','sed.consequat@ipsumnonarcu.org','05/06/2019'),('Arden','Martinez','1-118-397-3379','4435 Ut C.','Aurora','tellus.id.nunc@nec.ca','02/08/2021'),('Reece','Hicks','1-829-405-5111','Apartado núm.: 576, 2042 Nunc Carretera','Frauenkirchen','eget@pellentesqueegetdictum.edu','03/17/2019'),
('Lane','Kerr','1-995-517-9100','4013 Egestas Carretera','Wilskerke','tempor.bibendum.Donec@amifringilla.edu','07/31/2015'),('Haviva','Gregory','1-241-791-5449','9935 Facilisis Av.','Caxias','Cras.convallis.convallis@loremipsumsodales.com','02/09/2016'),('Lionel','Harrell','1-282-341-3858','Apdo.:345-1476 Ac, ','Noville','Donec@etcommodo.edu','08/12/2019'),
('Audrey','Cardenas','1-324-766-0836','Apartado núm.: 856, 5117 Auctor, C.','Makassar','mus.Aenean@augueac.com','09/14/2017'),('Kuame','Adkins','1-570-451-5247','243-1376 Diam ','Vicuña','cursus.et.magna@quamPellentesquehabitant.net','04/20/2020'),('Maris','Lane','1-335-850-1022','153 Malesuada Av.','Quimbaya','gravida@diam.org','02/25/2019'),
('Christopher','Harris','1-791-843-9886','985-4539 Quisque C.','Granada','facilisis@pedenec.co.uk','02/15/2017'),('Ahmed','Ford','1-431-532-3331','341-4791 Tempus Calle','Independencia','justo.sit.amet@eget.co.uk','05/18/2016'),('Phoebe','Haley','1-151-597-1480','Apartado núm.: 444, 3150 Diam Calle','Strijtem','commodo.hendrerit@eleifendCras.edu','11/27/2019'),
('Ivana','Foster','1-526-357-8452','Apartado núm.: 571, 2334 Penatibus Calle','Pellezzano','dui@Vestibulum.edu','06/26/2018'),('Kalia','Pittman','1-830-573-8253','Apartado núm.: 899, 480 Eleifend Carretera','Worksop','ultricies.sem@odio.com','04/07/2017'),('Alexis','Rosario','1-324-648-9829','321-1490 Nunc Ctra.','Mottola','ligula.consectetuer.rhoncus@est.edu','11/08/2018'),
('Travis','Koch','1-586-126-2793','5940 Tellus. Asda.','Villafranca Tirrena','sed.hendrerit@venenatisvel.edu','09/09/2015'),('Ariel','Hanson','1-594-845-4524','292-2449 Luctus C/','Aklavik','Sed@iaculislacus.org','07/18/2021'),('Zeus','Clemons','1-511-343-4157','Apartado núm.: 428, 5013 At Calle','Loksbergen','nulla@massa.com','01/12/2018'),
('Howard','Harding','1-538-991-0307','Apdo.:180-4797 Nulla Ctra.','Carleton','sapien@vitaesodalesat.co.uk','02/07/2019'),('Abdul','Wilkinson','1-487-551-4447','Apartado núm.: 448, 4419 Nunc ','Pradamano','Mauris.magna@Curabitur.org','03/07/2021'),('Harrison','French','1-305-486-2512','3796 Faucibus. Avenida','San Chirico Nuovo','nulla.In.tincidunt@aodio.ca','08/07/2016'),
('Travis','Wilson','1-916-941-5212','147-8054 Ut Calle','Fort Smith','elementum.at@purusmauris.co.uk','06/23/2015'),('Devin','Mckenzie','1-412-295-4217','8916 Phasellus C/','Charsadda','vulputate@Aeneansedpede.com','05/29/2019'),('Myra','Blankenship','1-314-357-9383','5198 Egestas. ','Borriana','eget@auguescelerisquemollis.edu','01/18/2021'),
('Noelle','Roberts','1-944-453-5014','Apdo.:530-3526 Dolor. C/','Abergavenny','mi.fringilla.mi@pedeNunc.edu','10/03/2017'),('Charissa','Mcdaniel','1-511-353-5435','5114 Convallis Av.','Thurso','cursus.in.hendrerit@dictumcursusNunc.org','03/29/2018'),('Ryder','Gonzalez','1-243-406-1211','Apdo.:366-5077 Dictum. C/','Neuss','ridiculus.mus@Maurismolestie.edu','08/12/2020'),
('Brenden','Wilson','1-382-534-6449','Apartado núm.: 125, 5123 Mauris C.','Poitiers','In@congueelit.edu','02/10/2019'),('Chloe','Beard','1-485-446-4399','3457 Aliquam ','Quarona','egestas@purus.net','12/23/2017'),('Ethan','Peters','1-443-999-7649','3144 Diam ','Ganganagar','elit.a.feugiat@anteNunc.edu','06/15/2019'),
('Hiram','Henson','1-137-931-4565','Apartado núm.: 104, 5704 Est, Avenida','Esen','Proin.sed@lectusCum.com','09/04/2016'),('Griffin','Potter','1-988-235-5134','4955 Sem C/','Tübingen','tempus.risus.Donec@nuncnulla.org','01/27/2019'),('Clare','Riggs','1-250-855-9585','Apartado núm.: 452, 2000 Mi Asda.','Sierra Gorda','nec@interdumfeugiat.co.uk','04/13/2021'),
('Carl','Francis','1-404-350-9451','244-194 Eget Asda.','Astore','Phasellus.in.felis@Nullamsuscipitest.com','08/08/2021'),('Micah','Bernard','1-383-199-0885','597 Metus Ctra.','Gruitrode','hendrerit.id.ante@mieleifend.com','08/08/2017'),('Jesse','Ware','1-114-416-4776','2476 Molestie Carretera','Graz','at@rutrum.edu','06/13/2018'),
('Hamish','Salazar','1-866-811-5639','9312 Neque Avenida','Bonavista','id.blandit.at@liberomauris.net','07/17/2015'),('Abra','Wyatt','1-349-179-3419','Apdo.:146-527 Congue. C.','GŽrompont','dapibus@tristiquepharetra.co.uk','08/20/2017'),('Candice','Ratliff','1-502-934-2857','Apdo.:799-8844 Neque Asda.','Castelluccio Inferiore','lorem@egetdictumplacerat.net','07/01/2015'),
('Nomlanga','Mercer','1-183-280-0401','Apdo.:792-9421 Diam. Avenida','Memphis','nec.tempus@congue.ca','09/10/2017'),('Gray','Sharp','1-551-578-4998','Apartado núm.: 570, 4409 Nulla. Carretera','Stewart','Integer.id@Class.co.uk','01/15/2016'),('Emily','Gross','1-548-253-9353','Apdo.:516-3131 Curabitur C.','Toledo','lorem.Donec@sed.ca','08/01/2021'),
('Alexander','Fry','1-482-149-9298','Apdo.:105-1918 Nec Calle','Rio Saliceto','eget.mollis@pede.org','06/07/2016'),('Russell','Snow','1-316-879-5727','Apartado núm.: 157, 5603 Nunc Ctra.','Sivry-Rance','cursus@nuncrisusvarius.edu','07/06/2015'),('Dane','Brock','1-909-284-0051','Apartado núm.: 987, 5529 Sagittis Avenida','Aparecida de Goiânia','quis.lectus.Nullam@molestiearcuSed.edu','10/29/2018'),
('Margaret','Buchanan','1-156-945-4919','580-4491 A Carretera','Nogales','enim.Etiam.gravida@dignissimpharetra.co.uk','05/19/2018'),('Erich','Marquez','1-991-956-2386','Apartado núm.: 153, 9401 Sem Calle','Zwickau','nulla@Nuncac.org','07/04/2021'),('Holmes','Dorsey','1-518-985-9317','4886 Rutrum. Calle','Champion','pharetra.Nam.ac@tempusrisusDonec.net','08/30/2019'),
('Ulysses','Mckay','1-942-549-5466','4000 Etiam Calle','Moncton','amet.consectetuer.adipiscing@interdumligula.ca','08/31/2017'),('Vivian','Moreno','1-441-347-8027','Apdo.:402-832 Aliquet. C/','Southaven','nec.tellus@morbitristique.org','09/21/2019'),('Ulla','King','1-144-123-7902','Apartado núm.: 407, 6491 Ut Av.','Tebing Tinggi','eu.tellus.eu@quam.ca','04/02/2015'),
('Risa','Page','1-403-185-9931','8077 Quis Carretera','Rüsselsheim','ac.eleifend.vitae@orcisem.co.uk','01/29/2021'),('Brenda','Welch','1-949-986-2213','529-4415 Venenatis Ctra.','Treglio','Phasellus@velitegestaslacinia.co.uk','05/26/2017'),('Robin','Bright','1-552-576-4342','Apartado núm.: 882, 7858 Magnis Carretera','Kahramanmaraş','leo@liberoet.edu','04/07/2020'),
('Jolie','Cote','1-444-341-5637','2214 Sem Av.','Okpoko','laoreet.ipsum@nibhQuisque.co.uk','12/02/2019'),('Sopoline','Meyer','1-573-927-4397','444-5115 Id, Avenida','Hualañé','iaculis.nec.eleifend@Crasvehiculaaliquet.edu','03/31/2019'),('Buffy','Chen','1-951-433-4830','4938 Facilisis Avenida','Grimaldi','sed@quisdiam.co.uk','07/23/2020'),
('Abel','Fleming','1-517-332-7803','Apartado núm.: 529, 528 Sem C.','Oostkerke','lacus.Nulla@metusAenean.com','06/10/2021'),('Fritz','Christensen','1-514-366-5767','Apdo.:446-5547 Nonummy C.','Skegness','ipsum@Maurisvelturpis.com','04/25/2016'),('Craig','Cherry','1-122-991-4832','8400 Class Av.','Labrecque','ullamcorper@ornareelit.org','08/02/2020'),
('Sonia','Hester','1-504-294-5091','Apartado núm.: 477, 9539 Aliquam C.','100 Mile House','eget.magna.Suspendisse@eleifend.co.uk','12/28/2018'),('Dora','Calderon','1-139-540-8518','944-4347 Molestie C/','Lauterach','Praesent.interdum.ligula@cursusNunc.org','07/28/2017'),('Jesse','Ramos','1-116-221-3015','Apdo.:852-5032 Habitant Avenida','Moliterno','Sed@sodales.ca','02/17/2019'),
('Connor','Rasmussen','1-947-987-0379','524-4856 Donec Calle','Aprelevka','rhoncus@feugiatmetus.com','11/27/2015'),('Hannah','Hicks','1-119-514-0836','Apdo.:254-3580 Ac Avenida','Valbrevenna','metus.Aliquam.erat@nuncrisus.edu','12/28/2019'),('Donna','Warren','1-958-280-3885','Apartado núm.: 566, 2390 Ut Asda.','Loppem','egestas.nunc@fermentumfermentum.com','12/01/2020'),
('Teegan','Bray','1-866-444-4459','Apdo.:571-3936 Urna. Carretera','Inuvik','massa.Integer.vitae@Donecatarcu.edu','04/02/2019'),('Eric','Wyatt','1-252-209-9357','Apdo.:511-446 Vulputate C/','Roxburgh','scelerisque.scelerisque.dui@quamCurabitur.org','06/15/2019'),('Juliet','Sutton','1-911-400-8818','4332 Rutrum. Calle','Oelegem','commodo.hendrerit@nonantebibendum.com','07/20/2017'),
('Teegan','Hughes','1-490-423-3438','1040 Leo. C/','Mirpur','Ut.semper.pretium@euodio.net','03/19/2021'),('Gloria','Alexander','1-897-436-1910','Apdo.:433-4044 Aliquam C.','San Lazzaro di Savena','quam.quis@Quisque.org','06/28/2018'),('Irene','Gates','1-559-244-4565','832-2542 Lectus. ','Saint-Remy','magnis.dis@lectusjustoeu.co.uk','02/21/2016'),
('Quintessa','Pena','1-138-981-8457','Apdo.:146-407 Sed, C/','Taber','fringilla@erat.org','10/20/2019'),('Linus','Forbes','1-951-445-1057','118-9145 Adipiscing Ctra.','Nieuwmunster','auctor.velit@laciniavitae.edu','02/01/2016'),('Chanda','Vang','1-915-887-4214','397-5247 Suspendisse Avenida','Rio de Janeiro','ipsum.Suspendisse@consectetuer.com','11/14/2017'),
('Imelda','Harrington','1-401-348-1207','947-5543 Lacus Ctra.','Woutersbrakel','suscipit@torquent.co.uk','05/15/2021'),('Beverly','Cooke','1-452-266-5577','Apartado núm.: 281, 4529 Erat, Calle','Beervelde','eget.metus.eu@liberomauris.org','01/12/2018'),('Amanda','Morris','1-452-781-8478','Apdo.:922-1084 Feugiat. C.','Rapagnano','lacinia@inceptos.edu','09/01/2020'),
('Lucian','Medina','1-450-526-3332','Apartado núm.: 516, 520 Nisl. Carretera','Solesino','euismod.in.dolor@maurisutmi.com','01/10/2020'),('Fay','Herrera','1-290-351-0666','Apartado núm.: 458, 4119 Cum Asda.','Llanquihue','accumsan.laoreet.ipsum@Etiamvestibulum.co.uk','01/19/2019'),('Tanner','Rush','1-145-477-2247','956-844 Natoque C.','Villanova d''Albenga','convallis.ante.lectus@tristiqueneque.ca','08/06/2018'),
('Olivia','Patton','1-316-438-2568','Apartado núm.: 544, 3118 Donec C/','Palangka Raya','tempus@risusNullaeget.org','05/05/2021'),('Marshall','Howell','1-180-783-9912','Apdo.:908-7991 Sit C.','Darlington','nunc@magna.co.uk','07/16/2016'),('Beatrice','Frederick','1-340-537-1345','Apdo.:120-5747 Commodo Ctra.','Los Álamos','pede@Vivamusnibh.ca','12/10/2015'),
('Alden','Salinas','1-256-431-1953','3502 Condimentum Avenida','Heppignies','Sed.eu@arcuMorbisit.co.uk','12/28/2019'),('Macaulay','Wilder','1-543-539-7932','524-2944 Est Avenida','Neu-Ulm','cursus@nec.com','09/10/2018'),('Aimee','Wilkins','1-878-455-2109','352-5631 Pellentesque Asda.','Detroit','amet.luctus@disparturientmontes.com','02/12/2017'),
('Sade','Robertson','1-906-131-0043','Apartado núm.: 256, 2926 Non, ','Colico','Vestibulum.accumsan.neque@egestaslaciniaSed.com','09/17/2020'),('Aretha','Chavez','1-546-924-3518','2447 Neque Avenida','Priero','nisi.nibh.lacinia@in.com','04/02/2018'),('Raphael','Pierce','1-434-222-0572','Apdo.:985-9503 Eu Asda.','María Pinto','amet.massa.Quisque@torquentperconubia.co.uk','07/12/2018'),
('Russell','Conway','1-141-507-8816','Apartado núm.: 478, 3535 Fames Asda.','Denderwindeke','libero.Proin.sed@vel.org','05/12/2021'),('Nichole','Myers','1-805-530-9359','434-153 Cum Calle','Rosarno','ultrices.iaculis.odio@Curabitur.org','11/20/2019');

SELECT * FROM Clients_tbl



-- Insert into SalesDetails_tbl

INSERT INTO SalesDetails_tbl([Order_Number],[Sales_Date],[Payment_Type],[Modification_Date]) 
VALUES	(401,'11/03/2016','Cash','06/28/2015'),(402,'06/10/2015','Cash','12/19/2020'),(403,'10/18/2017','Cash','12/13/2018'),(404,'05/13/2020','Cash','12/13/2016'),(405,'05/11/2020','Cash','01/19/2019'),
	(406,'05/29/2017','Cash','07/29/2015'),(407,'12/09/2015','Cash','07/27/2019'),(408,'02/23/2019','Cash','10/11/2018'),(409,'07/30/2017','Cash','09/17/2015'),(410,'08/29/2020','Cash','07/29/2017'),
	(411,'04/03/2016','Credit Card','02/28/2015'),(412,'10/08/2018','Credit Card','04/23/2017'),(413,'01/16/2015','Credit Card','03/03/2020'),(414,'04/05/2018','Credit Card','04/12/2020'),
	(415,'07/21/2022','Credit Card','03/25/2015'),(416,'05/19/2015','Credit Card','09/03/2020'),(417,'11/02/2016','Credit Card','02/19/2018'),(418,'11/09/2015','Credit Card','10/23/2018'),
	(419,'04/24/2022','Credit Card','04/03/2021'),(420,'02/04/2020','Credit Card','09/12/2020'),(421,'07/17/2020','Transfer','09/22/2019'),(422,'01/22/2015','Transfer','12/19/2015'),
	(423,'04/07/2019','Transfer','01/01/2021'),(424,'08/04/2016','Transfer','06/26/2018'),(425,'09/02/2015','Transfer','06/04/2015'),(426,'08/24/2018','Transfer','02/22/2021'),(427,'09/30/2018','Transfer','10/02/2019'),
	(428,'05/04/2015','Transfer','04/06/2017'),(429,'04/27/2016','Transfer','12/01/2017'),(430,'07/04/2016','Transfer','03/19/2021'),(431,'01/19/2017','Check','12/19/2017'),(432,'11/04/2021','Check','05/17/2018'),
	(433,'09/05/2015','Check','09/16/2018'),(434,'12/16/2016','Check','08/07/2019'),(435,'05/25/2015','Check','05/04/2017'),(436,'04/15/2015','Check','08/06/2015'),(437,'05/13/2015','Check','01/11/2020'),
	(438,'10/03/2021','Check','04/15/2020'),(439,'10/10/2016','Check','09/05/2017'),(440,'07/12/2018','Check','01/14/2019'),(441,'05/15/2019','Cash','03/19/2016'),(442,'07/20/2020','Cash','11/13/2017'),
	(443,'02/12/2019','Cash','03/04/2019'),(444,'07/25/2019','Cash','10/05/2017'),(445,'08/06/2021','Cash','07/31/2020'),(446,'10/21/2018','Cash','08/18/2020'),(447,'04/06/2019','Cash','01/13/2015'),
	(448,'05/19/2021','Cash','02/11/2017'),(449,'05/27/2022','Cash','02/27/2019'),(450,'10/25/2015','Cash','08/19/2015'),(451,'05/06/2018','Credit Card','07/10/2017'),(452,'01/24/2015','Credit Card','05/20/2017'),
	(453,'06/08/2018','Credit Card','12/02/2020'),(454,'09/05/2017','Credit Card','06/02/2020'),(455,'08/10/2019','Credit Card','11/17/2019'),(456,'12/10/2019','Credit Card','11/21/2020'),(457,'07/04/2015','Credit Card','01/28/2019'),
	(458,'07/19/2022','Credit Card','03/05/2019'),(459,'02/09/2020','Credit Card','09/25/2017'),(460,'02/20/2017','Credit Card','05/27/2016'),(461,'06/20/2022','Transfer','10/18/2018'),(462,'05/03/2016','Transfer','02/12/2017'),
	
SELECT * FROM SalesDetails_tbl



-- Insert into Stores_tbl

INSERT INTO Stores_tbl([Store_ID],[Store_Name],[City],[Opening_Date],[TotalEmployees],[Modification_Date]) 
VALUES(1,'Santo Domingo Store','Santo Domingo','01/01/2015', 14,'03/12/2015'),
			(2,'Santiago Store','Santiago','01/01/2016', 12,'02/26/2019'),
			(3,'La Vega Store','La Vega','01/01/2017', 12,'07/17/2020'),
			(4,'Bonao Store','Bonao','01/01/2018', 12,'02/08/2015'),
			(5,'San Juan Store','San Juan','01/01/2019', 12,'10/25/2018'),
			(6,'Bani Store','Bani','01/01/2020', 12,'07/02/2019');

select * from Stores_tbl



-- Insert into Products_tbl

INSERT INTO Products_tbl([Model_ID],[Model],[Unit_Price],[Color],[ProductType_ID],[Inventory_ID],[Manufacture_Date],[Modification_Date]) 
VALUES	(1,'Xerox WorkCentre 4515DNI',456,'White',1,1,'06/29/2010','08/05/2015'),(2,'Xerox Phaser 8540N',521,'White',1,2,'05/28/2011','10/04/2017'),
	(3,'OKI MC853dn',1048,'White',1,3,'01/24/2005','10/02/2016'),(4,'Xerox B205',494,'White',1,4,'04/04/2021','04/24/2015'),
	(5,'OKI Microline 395B',553,'White',2,5,'06/29/2007','10/17/2015'),(6,'Cubify Cube White',572,'Metallic',2,6,'03/11/2015','12/09/2016'),
	(7,'Xerox B205',310,'Metallic',2,7,'08/07/2005','02/28/2021'),(8,'Xerox ColorQube',951,'Metallic',2,8,'06/21/2011','08/23/2018'),
	(9,'Xerox Versalink C5000dn',901,'Metallic',3,9,'10/25/2004','04/03/2021'),(10,'HP OfficeJet Pro 9010e',403,'Metallic',3,10,'05/22/2005','03/02/2015'),
	(11,'Epson LX-350',218,'Navy Blue',3,11,'08/04/2015','10/18/2015'),(12,'Cubify CubePro Duo',247,'Navy Blue',3,12,'08/17/2016','06/26/2017'),
	(13,'Xerox Phaser 3330DNi',845,'Navy Blue',4,13,'08/27/2008','08/10/2021'),(14,'Xerox Phaser 8540MFP/N',845,'Navy Blue',4,14,'03/29/2015','11/25/2015'),
	(15,'Xerox Versalink C405dn',206,'Navy Blue',4,15,'09/26/2004','03/11/2017'),(16,'HP LaserJet Pro MFP M428fdw',237,'Black',4,16,'05/18/2017','10/30/2020'),
	(17,'Epson LQ-490',414,'Black',5,17,'09/17/2021','10/01/2015'),(18,'3D Systems CubePro',236,'Black',5,18,'07/21/2006','04/09/2020'),
	(19,'HP OfficeJet Pro 9010e',988,'Black',5,19,'11/02/2008','07/08/2015'),(20,'Xerox ColorQube 8580DN',887,'Black',5,20,'02/27/2002','06/08/2020'),
	(21,'OKI C512n',541,'Gray',6,21,'03/13/2017','02/11/2015'),(22,'Brother MFC-L8490CDW',923,'Gray',6,22,'06/28/2016','08/08/2021'),
	(23,'Cubify CubePro Trio',1034,'Gray',6,23,'08/10/2021','12/02/2018'),(24,'Xerox VersaLink C5020 Series',797,'Gray',6,24,'09/22/2021','11/05/2020'),
	(25,'Xerox ColorQube 8550N',560,'Gray',1,25,'04/22/2019','02/08/2018'),(26,'Brother DCP-L3550CDW',905,'White',1,26,'06/27/2016','03/05/2018'),
	(27,'Epson EcoTank ET-3570',941,'White',1,27,'03/09/2020','08/19/2015'),(28,'3D Systems CubePro ABS Industrial',350,'White',1,28,'05/05/2019','12/04/2019')

SELECT * FROM Products_tbl



-- Insert into ProductTypes_tbl

INSERT INTO ProductTypes_tbl([ProductType_ID],[Type],[Modification_Date]) 
VALUES	(1,'Laser Printers','10/25/2021'),
	(2,'Solid Ink Printers','09/24/2020'),
	(3,'LED Printers','03/23/2022'),
	(4,'Multifunction Printers','02/07/2022'),
	(5,'Dot Matrix Printers','05/12/2021'),
	(6,'3D Printers','03/16/2022');

SELECT * FROM ProductTypes_tbl



-- Insert into ProductsInventory_tbl

INSERT INTO ProductsInventory_tbl ([Quantity],[Warehouse],[Modification_Date],[Model_ID]) 
VALUES	(77,'Santo Domingo','08/25/2021',1),(15,'Santiago','02/14/2022',2),(43,'La Vega','04/26/2021',3),(38,'Santo Domingo','07/09/2021',4),
	(32,'Santiago','07/08/2022',5),(85,'La Vega','05/19/2022',6),(38,'Santo Domingo','11/17/2021',7),(57,'Santiago','04/30/2021',8),
	(56,'La Vega','12/28/2021',9),(79,'Santo Domingo','11/11/2020',10),(52,'Santiago','08/09/2021',11),(46,'La Vega','11/26/2020',12),
	(59,'Santo Domingo','03/26/2021',13),(3,'Santiago','01/24/2022',14),(66,'La Vega','06/25/2021',15),(42,'Santo Domingo','05/27/2021',16),
	(8,'Santiago','07/11/2022',17),(47,'La Vega','07/03/2021',18),(58,'Santo Domingo','08/20/2021',19),(8,'Santiago','05/01/2022',20),
	(16,'La Vega','06/04/2022',21),(5,'Santo Domingo','01/17/2021',22),(41,'Santiago','09/19/2020',23),(26,'La Vega','11/18/2020',24),
	(42,'Santo Domingo','02/12/2022',25),(31,'Santiago','09/08/2021',26),(6,'La Vega','02/08/2021',27),(57,'Santo Domingo','09/20/2021',28)

Select * from ProductsInventory_tbl
