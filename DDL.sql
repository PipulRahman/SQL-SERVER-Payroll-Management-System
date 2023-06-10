
/*
					SQL Project Name : Payroll Management System(PMS)
							    Trainee Name : Pipul Rahman   
						    	  Trainee ID : 1272145       
							Batch ID : ESAD-CS/PNTL-M/53/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [PMS]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


/*
==============================  SECTION 01  ==============================
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/


CREATE DATABASE PMS
ON
(
	name = 'pms_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pms_data.mdf',
	size = 50MB,
	maxsize = 100MB,
	filegrowth = 10%
)
LOG ON
(
	name = 'pms_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pms_log.ldf',
	size = 20MB,
	maxsize = 40MB,
	filegrowth = 5MB
)
GO

USE PMS
GO


/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

--Table with IDENTITY, PRIMARY KEY,FOREIGN KEY,DEFAULT CONSTRAINT & nullability CONSTRAINT


 CREATE TABLE Employee
(
	Employee_Id INT PRIMARY KEY,
	First_Name VARCHAR(25),
	Last_Name VARCHAR(25),
	Hire_Date DATE,
	City VARCHAR(25),
	NID INT(20) UNIQUE,
	phone INT(20) UNIQUE,
	email VARCHAR(40) UNIQUE,
	[State] VARCHAR(25)
)
GO

CREATE TABLE Department
(
 Department_Id INT,
 Department_Name VARCHAR(30)
 CONSTRAINT DEPARTMENT_PK PRIMARY KEY (Department_Id)
)
 GO
 CREATE TABLE AccountDetails
(
 Account_Id INT,
 Bank_Name VARCHAR(50),
 Account_Number VARCHAR(50),
 Employee_Id INT,
 CONSTRAINT Account_PK PRIMARY KEY (Account_Id),
 FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
)
GO
 CREATE TABLE Salary
(
 Salary_Id INT,
 Gross_Salary INT,
 Hourly_Pay MONEY,
 Tax FLOAT,
 Account_Id INT,
 CONSTRAINT SALARY_PK PRIMARY KEY (Salary_Id),
 FOREIGN KEY (Account_Id) REFERENCES AccountDetails(Account_Id)
)
GO
CREATE TABLE Project
(
 Project_Id INT,
 Project_Name VARCHAR(50),
 Project_Description VARCHAR(50),
 CONSTRAINT Project_PK PRIMARY KEY (Project_Id)
)
GO
CREATE TABLE DepartmentProject
(
 Department_Id INT,
 Project_Id INT,
 CONSTRAINT DEPTPROJECT_PK PRIMARY KEY (Department_Id,Project_Id),
 FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id),
 FOREIGN KEY (Project_Id) REFERENCES Project(Project_Id)
)
GO
 

CREATE TABLE Education
(
 Education_Id INT,
 Employee_Id INT,
 Degree VARCHAR(30),
 CONSTRAINT Location_PK PRIMARY KEY (Education_Id),
 FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
)
GO
CREATE TABLE Leave
(
 Leave_Id INT,
 Employee_Id INT,
 Leave_date DATE,
 CONSTRAINT Leave_PK PRIMARY KEY (Leave_Id),
 FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
)
GO
CREATE TABLE Attendance
(
 Attendance_Id INT,
 Hours_Worked INT,
 CONSTRAINT Attendance_PK PRIMARY KEY (Attendance_Id)
)
GO
CREATE TABLE Employee_Attendance
(
 Employee_Id INT,
 Attendance_Id INT,
 CONSTRAINT DEPARTMENTPROJECT_PK PRIMARY KEY (Employee_Id,Attendance_Id),
 FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id),
 FOREIGN KEY (Attendance_Id) REFERENCES Attendance(Attendance_Id)
)
GO
CREATE TABLE Work_Location
(
 Location_Id INT,
 [Location] VARCHAR(25),
 Number_Of_Employees INT,
 CONSTRAINT Loc_PK PRIMARY KEY (Location_Id)
)
GO
-- CREATE A SCHEMA 

CREATE SCHEMA pms
GO
-- USE SCHEMA IN A TABLE 

CREATE TABLE pms.Work_Location
(
 Location_Id INT,
 [Location] VARCHAR(25),
 Number_Of_Employees INT,
 City VARCHAR(25),
 State VARCHAR(25),
 CONSTRAINT Loc_PK PRIMARY KEY (Location_Id)
)
GO

/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/


-- ALTER TABLE SCHEMA AND TRANSFER TO [DBO] 
ALTER SCHEMA dbo TRANSFER pms.Work_Location
GO

-- Update column definition 

ALTER TABLE Attendance
ALTER COLUMN Hours_Worked INT NOT NULL
GO

-- ADD column with DEFAULT CONSTRAINT 

ALTER TABLE Salary
ADD Gross_Salary MONEY DEFAULT 0.00
GO

-- ADD CHECK CONSTRAINT with defining name 

ALTER TABLE Employee
ADD CONSTRAINT CK_nidValidate CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_phoneValidate CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_emailValidate CHECK(email LIKE '%@%' )
GO

-- DROP COLUMN 

ALTER TABLE Employee
DROP COLUMN email
GO

-- DROP TABLE 


DROP TABLE Work_Location
GO

-- DROP SCHEMA 

DROP SCHEMA pms
GO

/*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/

-- Clustered Index
CREATE CLUSTERED INDEX ix_Employee
ON Employee
(
	Employee_Id
)
GO

-- Nonclustered Index
CREATE UNIQUE NONCLUSTERED INDEX IX_Leave
ON employee
(
	nid,
	phone
)
GO

/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

CREATE SEQUENCE seqNum
	AS INT
	START WITH 1
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 200
	CYCLE
	CACHE 10
GO

-- ALTER SEQUENCE 

ALTER SEQUENCE seqNum
	MAXVALUE 200
	CYCLE
	CACHE 9
GO

/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/

CREATE VIEW VW_ProjectInfo
AS
SELECT Project_Id,
 Project_Name,
 Project_Description FROM Project
GO

-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION

CREATE VIEW VW_ProjectInfoDetails
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT Project_Id, Project_Name, Project_Description FROM dbo.Project
WITH CHECK OPTION
GO

-- ALTER VIEW 

ALTER VIEW VW_ProjectInfo
AS
SELECT Project_Id,
 Project_Name,
 Project_Description FROM Project
GO

/*
==============================  SECTION 07  ==============================
							 STORED PROCEDURE
==========================================================================
*/
-- STORED PROCEDURE for insert data using parameter 

CREATE PROCEDURE spInsertEmployee		@First_Name VARCHAR(25),
										@Last_Name VARCHAR(25),
										@Hire_Date DATE,
										@City VARCHAR(25),
										@nid CHAR(10),
										@phone CHAR(20),
										@email VARCHAR(40)
										
AS
BEGIN
	INSERT INTO Employee(First_Name,Last_Name,Hire_Date,City,nid,phone,email)
	VALUES(@First_Name, @Last_Name, @Hire_Date, @City, @nid, @phone, @email)
END
GO

-- STORED PROCEDURE for insert data with OUTPUT parameter 
CREATE PROCEDURE spInsertSalary			 @Gross_Salary INT,
										 @Hourly_Pay INT,
										 @Tax FLOAT,
										 @Id INT OUTPUT

AS
BEGIN
	INSERT INTO Salary(Gross_Salary, Hourly_Pay,Tax)
	VALUES(@Gross_Salary, @Hourly_Pay,@Tax)
	SELECT @Id = IDENT_CURRENT('salary')
END
GO

-- STORED PROCEDURE for UPDATE data 
CREATE PROCEDURE spUpdateEmployee      @Employee_Id INT,
									   @email VARCHAR
AS
BEGIN
	UPDATE Employee
	SET
	email = @email
	WHERE Employee_Id = @Employee_Id
END
GO

-- STORED PROCEDURE for DELETE Table data 

CREATE PROCEDURE  spDeleteProject       @Project_Id INT
AS
BEGIN
	DELETE FROM Project
	WHERE Project_Id = @Project_Id
END
GO

-- TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE 

CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM Education
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO

-- ALTER STORED PROCEDURE 

ALTER PROCEDURE spUpdateEducation    @Education_Id INT,
									 @Degree VARCHAR(30)
									 
AS
BEGIN
	UPDATE Education
	SET
	Degree =  @Degree
	WHERE Education_Id =  @Education_Id
END
GO

/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/

--============== A SCALAR FUNCTION ============--
-- A Scalar Function to get Current Year Total Gross Salary

CREATE FUNCTION fnCurrentYearSalary()
RETURNS MONEY
AS
BEGIN
	DECLARE @totalSalary MONEY

	SELECT @totalSalary = SUM((Gross_Salary))
	FROM Salary
	WHERE YEAR(Salary.Gross_Salary) = YEAR(GETDATE())

	RETURN @totalSalary
END
GO

--============== A SIMPLE TABLE VALUED FUNCTION ============--
-- A Inline Table Valued Function to get monthly gross salary using two parameter @year & @month

CREATE FUNCTION fnMonthlySalary(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT
			SUM(Gross_Salary) AS 'Gross salary'
	FROM Salary
	WHERE YEAR(Salary.Gross_Salary) = @year AND MONTH(Salary.Gross_Salary) = @month
			
)
GO

-- ALTER FUNCTION 

ALTER FUNCTION fnMonthlyCourseSales(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT
			SUM(Gross_Salary) AS 'Gross salary'
	FROM Salary
	WHERE YEAR(Salary.Gross_Salary) = @year AND MONTH(Salary.Gross_Salary) = @month
			
)
GO
/*
==============================  SECTION 09  ==============================
							FOR/AFTER TRIGGER
==========================================================================
*/

CREATE TABLE product
(
	pId INT PRIMARY KEY,
	pName VARCHAR(30),
	price MONEY,
	stock INT DEFAULT 0
)
GO
CREATE TABLE stockIn
(
	id INT IDENTITY PRIMARY KEY,
	date DATETIME DEFAULT GETDATE(),
	pId INT REFERENCES product(pId),
	quantity INT
)
GO

CREATE TRIGGER trStockIn
ON stockIn
FOR INSERT
AS
BEGIN
	DECLARE @i INT
	DECLARE @q INT

	SELECT @i=pId,@q=quantity FROM inserted

	UPDATE product SET stock=stock+@q
	WHERE pId=@i


END
GO

/*
==============================  SECTION 10  ==============================
							INSTEAD OF TRIGGER
==========================================================================
*/

-- AN INSTEAD OF TRIGGER WITH TABLE 
CREATE TRIGGER trProduct
ON Product
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO  product(pID,pName,price)
	SELECT pID,pName,price FROM inserted
END
GO

-- ALTER TRIGGER 
ALTER TRIGGER trProduct
ON Product
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO  product(pID,pName,price)
	SELECT pID,pName,price FROM inserted
END
GO

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DDL COMPLETE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/





