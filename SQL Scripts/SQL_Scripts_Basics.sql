-- CREATE DATABASE SQL_Basics;

-- Creating Table in the BD
-- CREATE TABLE Employees(
--     EmployeeID INT,
--     FirstName VARCHAR(100),
--     LastName VARCHAR(100),
--     Gender VARCHAR(25),
--     Age INT,
-- )

-- CREATE TABLE EmployeeSalary(
--     EmployeeID INT,
--     JobTitle VARCHAR(100),
--     Salary INT,
-- )

-- INSERT DATAS to the Employees TABLE
-- INSERT into Employees VALUES
-- (01, 'Jahid', 'Hasan', 'Male', 26 ),
-- (02, 'King', 'SRK', 'Male', 35),
-- (03, 'Katrina', 'Kaif', 'Female', 31),
-- (04, 'Karina', 'Kapoor', 'Female', 35),
-- (05, 'Hrithik', 'Roshan', 'Male', 45),
-- (06, 'Sahid', 'Kapoor', 'Male', 35),
-- (07, 'Jason', 'Roy', 'Male', 27),
-- (08, 'Jessica', 'Alba', 'Female', 38),
-- (09, 'Roman', 'Reigns', 'Male', 35),
-- (10, 'Seth', 'Rollins', 'Male', 33)

-- INSERT DATAS to the EmployeeSalary TABLE
-- INSERT Into EmployeeSalary VALUES
-- (01, 'CEO', 90000),
-- (02, 'CFO', 85000),
-- (03, 'PS', 70000),
-- (04, 'Accountant', 55000),
-- (05, 'HR', 50000),
-- (06, 'Manager', 65000),
-- (07, 'Assistant Manager', 45000),
-- (08, 'IT Engineer', 48000),
-- (09, 'Help Desk', 35000),
-- (10, 'Security', 30000)

/*
SELECT STATEMENT    = *, Top, Distinct, Count, As, Max, Min, Avg
*/
-- SELECT * FROM Employees    
--SELECT FirstName FROM Employees
--SELECT FirstName, LastName FROM Employees

--SELECT PARTICULAR ROWS - USE TOP and Give a Range or Number
--SELECT TOP 6 * FROM Employees 

--DISTINCT Is Unique value to show
--SELECT DISTINCT(EmployeeID) FROM Employees

--COUNT SHOWS all NOT NULL Values on column
--SELECT COUNT(FirstName) FROM Employees
--SELECT COUNT(FirstName) AS FirstNameCount FROM Employees

--DO SOME CALCULATION USING MAX, MIN, AVG
--SELECT * FROM EmployeeSalary
--SELECT MAX(Salary) FROM EmployeeSalary
--SELECT MAX(Salary) AS MaxSalary FROM EmployeeSalary


/*
IF DB is in differnet path/branch then use follwing way to nav right DB
*/
--SELECT * FROM SQL_Basics.dbo.EmployeeSalary


/*
WHERE STATEMENT
=, <> (mean does not equal), <,>, AND , OR, LIKE, NULL, NOT NULL, IN
*/
--SELECT * FROM Employees
--WHERE FirstName = 'Jahid'
--WHERE FirstName <> 'Jahid'
--WHERE Age >= 30

--WHERE Age >= 30 AND Gender = 'Male'

-- SELECT * 
-- FROM Employees
-- WHERE Age <= 33 OR Gender = 'Male'

-- FIND SOMEONE LASTNAME THAT STARTS WITH 'S'; % is the wildcard
-- SELECT * FROM Employees
-- WHERE LastName LIKE 'S%'

-- Find 'S' Anywhere in the text, % wildcard use before S
-- SELECT * FROM Employees
-- WHERE LastName LIKE '%S%'

--FIND MORE WORD match from a text; it founds in Order
-- SELECT * FROM Employees
-- --WHERE LastName LIKE 'S%k%'
-- WHERE LastName LIKE 'R%ll%s'

-- SELECT * FROM Employees
-- --WHERE FirstName is NOT NULL
-- WHERE FirstName is NULL

--IN is like equal statements
-- SELECT * FROM Employees
-- WHERE FirstName IN ('Jahid', 'King', 'Hrithik')


/*
GROUP BY
ORDER BY (ASC  or DESC feature sorting)
*/
-- SELECT Gender FROM Employees
-- GROUP BY Gender
-- SELECT Gender, COUNT(Gender) AS GenderInTotal FROM Employees
-- GROUP BY Gender

--GET BOTH ITEM as TABLE together
-- SELECT * FROM Employees
-- SELECT Gender, COUNT(Gender) as GenderInTotal FROM Employees
-- GROUP BY Gender

-- USE MULTIPLE ITEM AND COL
-- SELECT * FROM Employees
-- SELECT Gender, Age, COUNT(Gender) FROM Employees
-- GROUP BY Gender, Age

-- SELECT * FROM Employees
-- SELECT Gender, COUNT(Gender) FROM Employees
-- WHERE Age > 32
-- GROUP BY Gender

-- SELECT * FROM Employees
-- SELECT Gender, COUNT(Gender) AS CountGender FROM Employees
-- WHERE Age > 32
-- GROUP BY Gender
-- ORDER BY CountGender ASC
--ORDER BY Gender ASC

-- SELECT * FROM Employees
-- ORDER BY Age

-- SELECT * FROM Employees
-- ORDER BY Age, Gender

-- SELECT * FROM Employees
-- ORDER BY 4 DESC, 5 DESC

-- Case Statement
SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'CFO' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SQLBasics.dbo.Employees
JOIN SQLBasics.dbo.EmployeeSalary
	ON Employees.EmployeeID = EmployeeSalary.EmployeeID
