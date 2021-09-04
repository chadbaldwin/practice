/*
	HackerRank Challenge
	Name: SQL - New Companies
	Url: https://www.hackerrank.com/challenges/the-company/problem
*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
USE HackerRank
GO
RETURN
------------------------------------------------------------------------------

------------------------------------------------------------------------------
DROP TABLE IF EXISTS dbo.Employee
DROP TABLE IF EXISTS dbo.Manager
DROP TABLE IF EXISTS dbo.Senior_Manager
DROP TABLE IF EXISTS dbo.Lead_Manager
DROP TABLE IF EXISTS dbo.Company
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Schema
------------------------------------------------------------------------------
IF OBJECT_ID('dbo.Company','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Company
	CREATE TABLE dbo.Company (
		company_code varchar(20) NOT NULL CONSTRAINT PK_Company PRIMARY KEY CLUSTERED,
		founder varchar(20) NOT NULL,
	);
END;

IF OBJECT_ID('dbo.Lead_Manager','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Lead_Manager
	CREATE TABLE dbo.Lead_Manager (
		lead_manager_code	varchar(20) NOT NULL CONSTRAINT PK_Lead_Manager PRIMARY KEY CLUSTERED,
		company_code		varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Company (company_code),
	);
END;

IF OBJECT_ID('dbo.Senior_Manager','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Senior_Manager
	CREATE TABLE dbo.Senior_Manager (
		senior_manager_code	varchar(20) NOT NULL CONSTRAINT PK_Senior_Manager PRIMARY KEY CLUSTERED,
		lead_manager_code	varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Lead_Manager (lead_manager_code),
		company_code		varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Company (company_code),
	);
END;

IF OBJECT_ID('dbo.Manager','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Manager
	CREATE TABLE dbo.Manager (
		manager_code		varchar(20) NOT NULL CONSTRAINT PK_Manager PRIMARY KEY CLUSTERED,
		senior_manager_code	varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Senior_Manager (senior_manager_code),
		lead_manager_code	varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Lead_Manager (lead_manager_code),
		company_code		varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Company (company_code),
	);
END;

IF OBJECT_ID('dbo.Employee','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Employee
	CREATE TABLE dbo.Employee (
		employee_code		varchar(20) NOT NULL CONSTRAINT PK_Employee PRIMARY KEY CLUSTERED,
		manager_code		varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Manager (manager_code),
		senior_manager_code	varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Senior_Manager (senior_manager_code),
		lead_manager_code	varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Lead_Manager (lead_manager_code),
		company_code		varchar(20) NOT NULL FOREIGN KEY REFERENCES dbo.Company (company_code),
	);
END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Clean
------------------------------------------------------------------------------
DELETE dbo.Employee
DELETE dbo.Manager
DELETE dbo.Senior_Manager
DELETE dbo.Lead_Manager
DELETE dbo.Company
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data
------------------------------------------------------------------------------
INSERT INTO dbo.Company (company_code, founder)
VALUES ('C1','Monika')
	,  ('C2','Samantha')

INSERT INTO dbo.Lead_Manager (lead_manager_code, company_code)
VALUES ('LM1','C1')
	,  ('LM2','C2')

INSERT INTO dbo.Senior_Manager (senior_manager_code, lead_manager_code, company_code)
VALUES ('SM1','LM1','C1')
	,  ('SM2','LM1','C1')
	,  ('SM3','LM2','C2')

INSERT INTO dbo.Manager (manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES ('M1','SM1','LM1','C1')
	,  ('M2','SM3','LM2','C2')
	,  ('M3','SM3','LM2','C2')

INSERT INTO dbo.Employee (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES ('E1','M1','SM1','LM1','C1')
	,  ('E2','M1','SM1','LM1','C1')
	,  ('E3','M2','SM3','LM2','C2')
	,  ('E4','M3','SM3','LM2','C2')
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Answer
------------------------------------------------------------------------------
SELECT c.company_code, c.founder
	, total_lead_managers	= COUNT(DISTINCT lm.lead_manager_code)
	, total_senior_managers	= COUNT(DISTINCT sm.senior_manager_code)
	, total_managers		= COUNT(DISTINCT m.manager_code)
	, total_employees		= COUNT(DISTINCT e.employee_code)
FROM Company c
	LEFT JOIN Lead_Manager lm ON lm.company_code = c.company_code
	LEFT JOIN Senior_Manager sm ON sm.company_code = c.company_code AND sm.lead_manager_code = lm.lead_manager_code
	LEFT JOIN Manager m ON m.company_code = c.company_code AND m.senior_manager_code = sm.senior_manager_code
	LEFT JOIN Employee e ON e.company_code = c.company_code AND e.manager_code = m.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;