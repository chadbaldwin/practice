/*
	HackerRank Challenge
	Name: Challenges
	Url: https://www.hackerrank.com/challenges/challenges/problem
*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
USE HackerRank
GO
RETURN
------------------------------------------------------------------------------

------------------------------------------------------------------------------
DROP TABLE IF EXISTS dbo.Challenges
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

IF OBJECT_ID('dbo.Challenges','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Challenges
	CREATE TABLE dbo.Challenges (
		challenge_id int NOT NULL CONSTRAINT PK_Challenges PRIMARY KEY CLUSTERED,
		hacker_id int NOT NULL
		CONSTRAINT FK_Challenges_college_id FOREIGN KEY (hacker_id) REFERENCES dbo.Hackers (hacker_id),
	);
END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Clean
------------------------------------------------------------------------------
DELETE dbo.Challenges
DELETE dbo.Hackers
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data
------------------------------------------------------------------------------
INSERT INTO dbo.Hackers (hacker_id, name)
VALUES (5077,'Rose')
	,  (21283,'Angela')
	,  (62743,'Frank')
	,  (88255,'Patrick')
	,  (96196,'Lisa')

INSERT INTO dbo.Challenges (challenge_id, hacker_id)
VALUES (61654,5077)
	,  (58302,21283)
	,  (40587,88255)
	,  (29477,5077)
	,  (1220,21283)
	,  (69514,21283)
	,  (46561,62743)
	,  (58077,62743)
	,  (18483,88255)
	,  (76766,21283)
	,  (52382,5077)
	,  (74467,21283)
	,  (33625,96196)
	,  (26053,88255)
	,  (42665,62743)
	,  (12859,62743)
	,  (70094,21283)
	,  (34599,88255)
	,  (54680,88255)
	,  (61881,5077)
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Answer
------------------------------------------------------------------------------
SELECT x.hacker_id, x.[name], x.total_challenges
FROM (
	SELECT h.hacker_id
		, h.[name]
		, total_challenges = x.challenge_count
		, dup_count = COUNT(*) OVER (PARTITION BY x.challenge_count)
		, max_count = MAX(x.challenge_count) OVER ()
	FROM Hackers h
		OUTER APPLY (
			SELECT challenge_count = COUNT(*)
			FROM Challenges c
			WHERE c.hacker_id = h.hacker_id
		) x
) x
WHERE x.dup_count = 1 OR (x.dup_count > 1 AND x.total_challenges = x.max_count)
ORDER BY x.total_challenges DESC, x.hacker_id;