/*
	HackerRank Challenge
	Name: SQL - Contest Leaderboard
	Url: https://www.hackerrank.com/challenges/contest-leaderboard/problem
*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
USE HackerRank
GO
RETURN
------------------------------------------------------------------------------

------------------------------------------------------------------------------
DROP TABLE IF EXISTS dbo.Submissions
DROP TABLE IF EXISTS dbo.Hackers
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Schema
------------------------------------------------------------------------------
IF OBJECT_ID('dbo.Hackers','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Hackers
	CREATE TABLE dbo.Hackers (
		hacker_id int NOT NULL CONSTRAINT PK_Hackers PRIMARY KEY CLUSTERED,
		[name] varchar(100) NOT NULL,
	);
END;

IF OBJECT_ID('dbo.Submissions','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Submissions
	CREATE TABLE dbo.Submissions (
		submission_id int NOT NULL CONSTRAINT PK_Submissions PRIMARY KEY CLUSTERED,
		hacker_id int NOT NULL,
		challenge_id int NOT NULL,
		score int NOT NULL,
		CONSTRAINT FK_Submissions_hacker_id FOREIGN KEY (hacker_id) REFERENCES dbo.Hackers (hacker_id),
	);
END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Clean
------------------------------------------------------------------------------
DELETE dbo.Submissions
DELETE dbo.Hackers
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data
------------------------------------------------------------------------------
INSERT INTO dbo.Hackers (hacker_id, name)
VALUES (4071, 'Rose')
	,  (4806, 'Angela')
	,  (26071, 'Frank')
	,  (49438, 'Patrick')
	,  (74842, 'Lisa')
	,  (80305, 'Kimberly')
	,  (84072, 'Bonnie')
	,  (87868, 'Michael')
	,  (92118, 'Todd')
	,  (95895, 'Joe')

INSERT INTO dbo.Submissions (submission_id, hacker_id, challenge_id, score)
VALUES (67194,74842,63132,76)
	,  (64479,74842,19797,98)
	,  (40742,26071,49593,20)
	,  (17513,4806,49593,32)
	,  (69846,80305,19797,19)
	,  (41002,26071,89343,36)
	,  (52826,49438,49593,9)
	,  (31093,26071,19797,2)
	,  (81614,84072,49593,100)
	,  (44829,26071,89343,17)
	,  (75147,80305,49593,48)
	,  (14115,4806,49593,76)
	,  (6943,4071,19797,95)
	,  (12855,4806,25917,13)
	,  (73343,80305,49593,42)
	,  (84264,84072,63132,0)
	,  (9951,4071,49593,43)
	,  (45104,49438,25917,34)
	,  (53795,74842,19797,5)
	,  (26363,26071,19797,29)
	,  (10063,4071,49593,96)
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Answer
------------------------------------------------------------------------------
SELECT h.hacker_id, h.[name], x.TotalScore
FROM dbo.Hackers h
	CROSS APPLY (
		SELECT TotalScore = SUM(x.MaxScore)
		FROM (
			SELECT s.challenge_id, MaxScore = MAX(s.Score)
			FROM dbo.Submissions s
			WHERE s.hacker_id = h.hacker_id
			GROUP BY s.challenge_id
		) x
	) x
WHERE x.TotalScore > 0
ORDER BY x.TotalScore DESC, h.[name];