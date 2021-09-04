/*
	HackerRank Challenge
	Name: SQL - Interviews
	Url: https://www.hackerrank.com/challenges/interviews/problem
*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
USE HackerRank
GO
RETURN
------------------------------------------------------------------------------

------------------------------------------------------------------------------
DROP TABLE IF EXISTS dbo.Submission_Stats
DROP TABLE IF EXISTS dbo.View_Stats
DROP TABLE IF EXISTS dbo.Challenges
DROP TABLE IF EXISTS dbo.Colleges
DROP TABLE IF EXISTS dbo.Contests
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Schema
------------------------------------------------------------------------------
IF OBJECT_ID('dbo.Contests','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Contests
	CREATE TABLE dbo.Contests (
		contest_id int NOT NULL CONSTRAINT PK_Contests PRIMARY KEY CLUSTERED,
		hacker_id int NOT NULL,
		[name] varchar(100) NOT NULL,
	);
END;

IF OBJECT_ID('dbo.Colleges','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Colleges
	CREATE TABLE dbo.Colleges (
		college_id int NOT NULL CONSTRAINT PK_Colleges PRIMARY KEY CLUSTERED,
		contest_id int NOT NULL,
		CONSTRAINT FK_Colleges_contest_id FOREIGN KEY (contest_id) REFERENCES dbo.Contests (contest_id),
	);
END;

IF OBJECT_ID('dbo.Challenges','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Challenges
	CREATE TABLE dbo.Challenges (
		challenge_id int NOT NULL CONSTRAINT PK_Challenges PRIMARY KEY CLUSTERED,
		college_id int NOT NULL,
		CONSTRAINT FK_Challenges_college_id FOREIGN KEY (college_id) REFERENCES dbo.Colleges (college_id),
	);
END;

IF OBJECT_ID('dbo.View_Stats','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.View_Stats
	CREATE TABLE dbo.View_Stats (
		challenge_id int NOT NULL,
		total_views int NOT NULL,
		total_unique_views int NOT NULL,
		CONSTRAINT FK_View_Stats_challenge_id FOREIGN KEY (challenge_id) REFERENCES dbo.Challenges (challenge_id),
	);
END;

IF OBJECT_ID('dbo.Submission_Stats','U') IS NULL
BEGIN;
	-- DROP TABLE dbo.Submission_Stats
	CREATE TABLE dbo.Submission_Stats (
		challenge_id int NOT NULL,
		total_submissions int NOT NULL,
		total_accepted_submissions int NOT NULL,
		CONSTRAINT FK_Submission_Stats_challenge_id FOREIGN KEY (challenge_id) REFERENCES dbo.Challenges (challenge_id),
	);
END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Clean
------------------------------------------------------------------------------
DELETE dbo.Submission_Stats
DELETE dbo.View_Stats
DELETE dbo.Challenges
DELETE dbo.Colleges
DELETE dbo.Contests
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data
------------------------------------------------------------------------------
INSERT INTO dbo.Contests (contest_id, hacker_id, name)
VALUES (66406,17973,'Rose')
	,  (66556,79153,'Angela')
	,  (94828,80275,'Frank')

INSERT INTO dbo.Colleges (college_id, contest_id)
VALUES (11219,66406)
	,  (32473,66556)
	,  (56685,94828)

INSERT INTO dbo.Challenges (challenge_id, college_id)
VALUES (18765,11219)
	,  (47127,11219)
	,  (60292,32473)
	,  (72974,56685)

INSERT INTO dbo.View_Stats (challenge_id, total_views, total_unique_views)
VALUES (47127,26,19)
	,  (47127,15,14)
	,  (18765,43,10)
	,  (18765,72,13)
	,  (60292,11,10)
	,  (72974,41,15)
--	,  (75516,35,17)
--	,  (75516,75,11)

INSERT INTO dbo.Submission_Stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (47127,27,10)
	,  (47127,56,18)
	,  (72974,68,24)
	,  (72974,82,14)
	,  (47127,28,11)
--	,  (75516,34,12)
--	,  (75516,74,12)
--	,  (75516,83,8)
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Expected result
------------------------------------------------------------------------------
/*
| contest_id | hacker_id |  name  | sts | stas | stv | stuv |
|------------|-----------|--------|-----|------|-----|------|
|      66406 |     17973 | Rose   | 111 |   39 | 156 |   56 |
|      66556 |     79153 | Angela |   0 |    0 |  11 |   10 |
|      94828 |     80275 | Frank  | 150 |   38 |  41 |   15 |
*/
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Answer
------------------------------------------------------------------------------
SELECT c.contest_id, c.hacker_id, c.[name]
	, COALESCE(x.sum_total_submissions, 0)
	, COALESCE(x.sum_total_accepted_submissions, 0)
	, COALESCE(x.sum_total_views, 0)
	, COALESCE(x.sum_total_unique_views, 0)
FROM Contests c
	JOIN (
		SELECT co.contest_id
			 , sum_total_views = SUM(tvs.sum_total_views)
			 , sum_total_unique_views = SUM(tvs.sum_total_unique_views)
			 , sum_total_submissions = SUM(tss.sum_total_submissions)
			 , sum_total_accepted_submissions = SUM(tss.sum_total_accepted_submissions)
		FROM Colleges co
			JOIN Challenges ca ON ca.college_id = co.college_id
			OUTER APPLY (
				SELECT sum_total_views = SUM(vs.total_views)
					, sum_total_unique_views = SUM(vs.total_unique_views)
				FROM View_Stats vs
				WHERE vs.challenge_id = ca.challenge_id
			) tvs
			OUTER APPLY (
				SELECT sum_total_submissions = SUM(ss.total_submissions)
					 , sum_total_accepted_submissions = SUM(ss.total_accepted_submissions)
				FROM Submission_Stats ss
				WHERE ss.challenge_id = ca.challenge_id
			) tss
		GROUP BY co.contest_id
	) x ON x.contest_id = c.contest_id
ORDER BY c.contest_id;