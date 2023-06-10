/*

					SQL Project Name : Payroll Management System(PMS)
							    Trainee Name : Pipul Rahman   
						    	  Trainee ID : 1272145      
							Batch ID : ESAD-CS/PNTL-M/53/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.11 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.12 : OFFSET FETCH
				SUB SECTION => 7.13 : UNION
				SUB SECTION => 7.14 : EXCEPT INTERSECT
				SUB SECTION => 7.15 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.16 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.17 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.18 : GROUPING SETS
				SUB SECTION => 7.19 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.20 : EXISTS
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.22 : MERGE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.24 : CASE
				SUB SECTION => 7.25 : IIF
				SUB SECTION => 7.26 : COALESCE & ISNULL
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				SUB SECTION => 7.35 : TRANSACTION WITH SAVE POINT
*/


/*
==============================  SECTION 01  ==============================
					INSERT DATA USING INSERT INTO KEYWORD
==========================================================================
*/

USE PMS
GO

INSERT INTO Employee VALUES 
(101,'Jalal','Rahman',14-04-16,'New York City',285664,017853858,'jalal@gmail.com','New York'),
(102,'Rayhan','Ahmed',21-06-18, 'Boston',285665,017853859,'rayhan@gmail.com','Massachusetts'),
(103,'Rezaul','Islam',13-09-19,'Chicago',285666,017853850,'rezaul@gmail.com','Illinois'),
(104,'Imran','Hossin',12-04-11,'Miami',285667,017853851,'imran@gmail.com','Florida'),
(105,'Rajib','Sarkar',16-08-17,'Atlanta',285668,017853852,'rajib@gmail.com','Georgia')
GO
SELECT * FROM Employee
GO

INSERT INTO Department VALUES 
(1,'Human Resources'),
(2,'Software Development'),
(3,'Data Analysis'),
(4,'Data Science'),
(5,'Business Intelligence')
GO
SELECT * FROM Department
GO

INSERT INTO AccountDetails VALUES 
(40,'DBBL','S12344',101),
(41,'DBBL','S12345',102),
(42,'DBBL','S12346',103),
(43,'Jumuna','J12344',104),
(44,'Islami','I12347',105)
GO
SELECT * FROM AccountDetails
GO

INSERT INTO Salary VALUES 
(1,57600,30.00,.15,40),
(2,76800,40.00,.15,41),
(3,96000,50.00,.15,42),
(4,115200,60.00,.15,43),
(5,57600,30.00,.15,44)
GO
SELECT * FROM Salary
GO


INSERT INTO Project VALUES 
(21,'Dev','Whatever'),
(22,'Prod','do something'),
(23,'Test','focus'),
(24,'Nothing','do nothing'),
(25,'Research','focus on everything')
GO
SELECT * FROM Project
GO

INSERT INTO DepartmentProject VALUES 
(1,21),
(2,22),
(3,23),
(4,24),
(5,25)
GO
SELECT * FROM DepartmentProject
GO

INSERT INTO Education VALUES 
(10,101,'MS',2017),
(11,102,'MS',2019),
(12,104,'MS',2011),
(13,108,'MS',2015),
(14,109,'Bachelor',2013)
GO
SELECT * FROM Education
GO

INSERT INTO Leave VALUES 
(51,101,1-12-19),
(52,103,10-12-19),
(53,105,16-12-19)
GO
SELECT * FROM Leave
GO

INSERT INTO Attendance VALUES 
(90,10),
(91,20),
(92,30),
(93,30),
(94,20)
GO
SELECT * FROM Attendance
GO

INSERT INTO Employee_Attendance VALUES 
(101,90),
(102,91),
(103,93),
(104,94),
(105,95)
GO
SELECT * FROM Employee_Attendance
GO

INSERT INTO Work_Location VALUES 
(71,'North',3),
(72,'South',2)
GO
SELECT * FROM Work_Location
GO

/*
==============================  SECTION 02  ==============================
					INSERT DATA THROUGH STORED PROCEDURE
==========================================================================
*/

EXEC spInsertEmployee 'Jalal','Rahman',14-04-16,'New York City',285664,017853858,'jalal@gmail.com'
EXEC spInsertEmployee 'Rayhan','Ahmed',21-06-18, 'Boston',285665,017853859,'rayhan@gmail.com'
EXEC spInsertEmployee 'Rezaul','Islam',13-09-19,'Chicago',285666,017853850,'rezaul@gmail.com'
EXEC spInsertEmployee 'Imran','Hossin',12-04-11,'Miami',285667,017853851,'imran@gmail.com'
EXEC spInsertEmployee 'Rajib','Sarkar',16-08-17,'Atlanta',285668,017853852,'rajib@gmail.com'
GO
SELECT * FROM Employee
GO

--============== INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER ============--

DECLARE @Id INT
EXEC spInsertSalary 57600,30.00,.15
SELECT @Id = IDENT_CURRENT('salary')
GO

--============== INSERT DATA USING SEQUENCE VALUE ============--

INSERT INTO tblEducation VALUES((NEXT VALUE FOR seqNum), NULL)
GO
SELECT * FROM tblEducation
GO

/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/


--============== UPDATE DATA THROUGH STORED PROCEDURE ============--

-- STORED PROCEDURE for update trainee (closing date & closing remarks)
EXEC spUpdateEmployee  101,'jalal@gmail.com'
EXEC spUpdateEmployee  102,'rayhan@gmail.com'
EXEC spUpdateEmployee  103,'rezaul@gmail.com'
GO
SELECT * FROM Employee
GO

--============== DELETE DATA THROUGH STORED PROCEDURE ============--

-- STORED PROCEDURE for Delete CourseSales
EXEC spDeleteProject 21
EXEC spDeleteProject 22
EXEC spDeleteProject 23
GO
SELECT * FROM Project
GO

--============== STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR ============--
EXEC spRaisError
GO

/*
==============================  SECTION 04  ==============================
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--============== INSERT DATA through view ============--
SELECT * FROM VW_ProjectInfo
GO

INSERT INTO VW_ProjectInfo VALUES
(21,'Dev','Whatever'),
(22,'Prod','do something'),
(23,'Test','focus')
GO

--============== UPDATE DATA through view ============--

UPDATE VW_ProjectInfo
SET Project_Description = 'GOOD'
WHERE Project_Id = 21
GO

--============== DELETE DATA through view ============--
DELETE FROM VW_ProjectInfo
WHERE Project_Id = 22
GO

/*
==============================  SECTION 05  ==============================
						RETREIVE DATA USING FUNCTION
==========================================================================
*/

-- A Scalar Function to get monthly total net sales using two parameter @year & @month
SELECT dbo.fnCurrentYearSalary() AS 'Currrent Year Gross salary'
GO


-- A Inline Table Valued Function to get monthly total sales, discount & net sales using two parameter @year & @month
SELECT * FROM dbo.fnMonthlySalary(2022, 6)
GO


-- A Multi Statement Table Valued Function to get monthly net sales using two parameter @year & @month
SELECT * FROM dbo.fnMonthlySalary(2022, 6)
GO


/*
==============================  SECTION 06  ==============================
							   TEST TRIGGER
==========================================================================
*/
--============== FOR/AFTER TRIGGER ON TABLE ============--

-- INSERT DATA IN Stockin TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

INSERT INTO product VALUES
(1,'Mouse',1500,0),
(2,'USB Drive',250,0),
(3,'Keyboard',400,0)
GO

INSERT INTO stockIn VALUES(GETDATE(),1,50)
GO

SELECT * FROM product
SELECT * FROM stockIn
GO

--============== INSTEAD OF TRIGGER ON TABLE ============--


--INSTEAD OF INSERT TRIGGER ON courseSales TO get price from course table and manipulate data in current table


INSERT INTO product(pID,pName,price) VALUES
(1,'Mouse',1500,0)
GO
SELECT * FROM product
GO

/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/


--============== 7.01 A SELECT STATEMENT TO GET RESULT SET FROM A TABLE ============--
SELECT * FROM Salary
GO

--============== 7.02 A SELECT STATEMENT TO GET today course sales information FROM A VIEW ============--

SELECT * FROM VW_ProjectInfo
GO

--============== 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE ============--

SELECT * INTO #tmpProduct
FROM tblProduct
GO

SELECT * FROM #tmpProduct
GO

--============== 7.04 IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE ============--


SELECT Project_Name, Department_Name FROM   Project, department
WHERE Department.Department_Id = department.Department_Id
ORDER BY Department_Name ASC, Project_Name DESC
GO

--============== 7.05 INNER JOIN WITH GROUP BY CLAUSE ============--


SELECT Project.Project_Name, COUNT(de.Department_Id) AS Students FROM ProjectInfo tcInfo
INNER JOIN Project tr ON tr. Project_Id = tcInfo. Project_Id
INNER JOIN Department ON Department.Department_Id = tcInfo.seasonId
GROUP BY season.seasonName
GO

--============== 7.06 OUTER JOIN ============--

SELECT * FROM ProjectInfo tcInfo
LEFT JOIN Project tr ON tr.Project_Id = tcInfo.Project_Id
RIGHT JOIN Department ON season.Department_Id = tcInfo.Department_Id
FULL JOIN Education s ON s.Education_Id = tcInfo.Education_Id
GO

--============== 7.07 CROSS JOIN ============--

SELECT * FROM DepartmentProject tcInfo
CROSS JOIN Department
GO

--============== 7.08 TOP CLAUSE WITH TIES ============--

SELECT TOP 5 WITH TIES Project.Project_Name, Project_Id FROM Project
INNER JOIN Department ON Department.Department_Id = Project.Project_Id
ORDER BY Project_Id
GO

--============== 7.09 DISTINCT ============--

SELECT DISTINCT Project.Project_Name, Project_Id FROM Project
INNER JOIN Department ON Department.Department_Id = Project.Project_Id
ORDER BY Project.Project_Name
GO

--============== 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ============--

SELECT * FROM trainees
WHERE maritalStatusId = 1
AND dob BETWEEN '1996-01-01' AND '1997-12-10'
AND NOT cityId = 4
AND postalCode > 1400
OR cityId = 2
GO

--============== 7.11 LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE ============--

SELECT * FROM trainees
WHERE name LIKE '%n'
AND cityId NOT IN ('1' ,'2')
AND reference IS NULL
GO

--============== 7.12 OFFSET FETCH ============--

-- OFFSET 5 ROWS
SELECT * FROM trainees
ORDER BY traineeId
OFFSET 5 ROWS
GO

-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM trainees
ORDER BY traineeId
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY
GO

--============== 7.13 UNION ============--

SELECT * FROM employee
WHERE cityId IN ('1', '2', '3')

UNION

SELECT * FROM employee
WHERE cityId IN ('4', '5', '6')
GO

--============== 7.14 EXCEPT INTERSECT ============--

-- EXCEPT
SELECT * FROM employee

EXCEPT

SELECT * FROM employee
WHERE genderId = 2
GO

--INTERSECT

SELECT * FROM courseSales
WHERE traineeId > 10

INTERSECT

SELECT * FROM courseSales
WHERE traineeId > 15
GO

--============== 7.15 AGGREGATE FUNCTION ============--

SELECT	COUNT(*) 'Total Sales Count',
		SUM(netSale) 'Total Net Sale',
		AVG(netSale) 'Average Sale',
		MIN(courseFee) 'MIN COURSE FEE',
		(MAX(discount))*100 'MAX Discount %'
FROM courseSales
GO

--============== 7.16 AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE ============--

SELECT course.courseTitle, count(courseSales.courseId) Total, SUM(netSale) 'NET SALES' FROM courseSales
INNER JOIN course ON course.courseId = courseSales.courseId
GROUP BY course.courseTitle
HAVING SUM(netSale) > 50000
GO

--============== 7.17 ROLLUP & CUBE OPERATOR ============--

--ROLLUP
SELECT dp.departmentTitle, dg.designationTitle, SUM(employeeInfo.salary) Salary FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

-- CUBE
SELECT dp.departmentTitle, dg.designationTitle, SUM(employeeInfo.salary) AS 'Total Salary' FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  CUBE (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.18 GROUPING SETS ============--

SELECT dp.departmentTitle, dg.designationTitle, SUM(employeeInfo.salary) AS 'Total Salary' FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  GROUPING SETS (dp.departmentTitle, dg.designationTitle)
ORDER BY  dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.19 SUB-QUERIES============--


--A subquery to findout trainees who have not enrolled yet

SELECT [name], dob, nid, email, phone, [address] FROM trainees
WHERE traineeId NOT IN (SELECT traineeId FROM courseSales)
ORDER BY [name]
GO

--A correlated subquery

SELECT cs.courseId, SUM(cs.netSale) 'NET SALES' FROM courseSales cs
GROUP BY  cs.courseId
HAVING SUM(cs.netSale) > (SELECT AVG(cs2.netSale) FROM courseSales cs2 WHERE cs.courseId = cs2.courseId)
GO

--============== 7.20 EXISTS ============--

SELECT [name], dob, nid, email, phone, [address] FROM trainees
WHERE NOT EXISTS 
			(SELECT * FROM courseSales
				WHERE courseSales.traineeId = trainees.traineeId)
GO

--============== 7.21 CTE ============--

-- A CTE TO GET MAXIMUM SALES COURSE
WITH courseCount AS
(
SELECT c.courseTitle, count(tcInfo.courseId) TotalCourse FROM traineeCourseInfo tcInfo
INNER JOIN course c ON c.courseId = tcInfo.courseId
GROUP BY c.courseTitle
)
SELECT courseTitle, TotalCourse from courseCount
WHERE TotalCourse = (SELECT MAX(TotalCourse) FROM courseCount)
GO

--============== 7.22 MERGE ============--

SELECT * FROM tblComments
SELECT * FROM tblCommentsInfo
GO

MERGE tblCommentsInfo AS SOURCE
USING tblComments AS TARGET
ON SOURCE.commentId = TARGET.commentId
WHEN MATCHED THEN
				UPDATE SET
				commentId = SOURCE.commentId,
				comment = SOURCE.comment;
GO

--============== 7.23 BUILT IN FUNCTION ============--

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT employeeId, LEN([name]) 'Name Length' FROM employee
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO

--============== 7.24 CASE ============--

SELECT employee.[name], 
eInfo.salary,
	CASE 
		WHEN (eInfo.salary < 40000) THEN 'Lower Salary'
		WHEN (eInfo.salary > 40000) THEN 'Good Salary'
		WHEN (eInfo.salary > 50000) THEN 'Better Salary'
		WHEN (eInfo.salary > 50000) THEN 'Great Salary'
END AS 'Status'
FROM employeeInfo eInfo
INNER JOIN employee ON eInfo.employeeId = employee.employeeId
GO

--============== 7.25 IIF ============--

SELECT employee.[name], 
eInfo.salary,
IIF((eInfo.salary > 50000), 'Great Salary', 'Lower Salary') AS 'Status'
FROM employeeInfo eInfo
INNER JOIN employee ON eInfo.employeeId = employee.employeeId
GO


--============== 7.26 COALESCE & ISNULL ============--

SELECT COALESCE(dp.departmentTitle, 'All Department') AS Department,
ISNULL(dg.designationTitle, 'All') AS Designation,
SUM(employeeInfo.salary) Salary
FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.27 WHILE ============--

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO tblComments(commentId, comment) VALUES((NEXT VALUE FOR [dbo].seqNum), NULL)
	END

	SELECT * FROM tblComments
GO

--============== 7.28 GROPING FUNCTION ============--

SELECT 
	CASE 
		WHEN GROUPING(dp.departmentTitle) = 1 THEN 'All Department'
		ELSE dp.departmentTitle
		END AS Department,
	CASE 
		WHEN GROUPING(dg.designationTitle) = 1 THEN 'All'
		ELSE dg.designationTitle
		END AS Designation,
	SUM(employeeInfo.salary) Salary

FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

--============== 7.29 RANKING FUNCTION ============--

SELECT 
RANK() OVER(ORDER BY traineeId) AS 'Rank',
DENSE_RANK() OVER(ORDER BY courseId) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY netSale) AS 'NTILE',
traineeId,
courseId, 
netSale
FROM courseSales
GO

--============== 7.30 IF ELSE & PRINT ============--

DECLARE @totalSales MONEY
SELECT @totalSales = SUM((netSale))
FROM courseSales
WHERE YEAR(courseSales.salesDate) = YEAR(GETDATE())
IF @totalSales > 1000000
	BEGIN
		PRINT 'Great ! The sales is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO

--============== 7.31 TRY CATCH ============--

BEGIN TRY
	DELETE FROM course
	PRINT 'SUCCESSFULLY DELETED'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--============== 7.32 GOTO ============--

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO

--============== 7.33 WAITFOR ============--

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO

--============== 7.34 SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  ============--

EXEC sp_helptext spUpdateTrainee
GO

--============== 7.35 TRANSACTION WITH SAVE POINT  ============--

SELECT * INTO #Product
FROM tblProduct
GO
SELECT * FROM #Product
GO

BEGIN TRANSACTION
	DELETE FROM #Product WHERE productId = 5
	SAVE TRANSACTION tran1
		DELETE FROM #Product WHERE productId = 6
		SAVE TRANSACTION tran2
			DELETE FROM #Product WHERE productId = 7
			SAVE TRANSACTION tran3

			SELECT * FROM #Product

		ROLLBACK TRANSACTION tran2
		SELECT * FROM #Product
	ROLLBACK TRANSACTION tran1
	SELECT * FROM #Product
COMMIT TRANSACTION
GO
-------------------------------------------------------------------------------------------------------

















