------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-03',
			@UseSampleData	bit		= 1;

    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int NOT NULL, Val nvarchar(MAX) NULL);

	INSERT INTO #rawdata (ID, Val)
	SELECT s.ordinal, s.[value]
	FROM dbo.AoC_Input_Raw r
		CROSS APPLY STRING_SPLIT(r.PuzzleInput, CHAR(10), 1) s
	WHERE r.PuzzleDay = @PuzzleDay AND r.IsSample = @UseSampleData
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data prep
------------------------------------------------------------------------------
IF OBJECT_ID('tempdb..#data','U') IS NOT NULL DROP TABLE #data; --SELECT * FROM #data
SELECT Val = 'do()' + REPLACE(REPLACE(REPLACE(x.Val,' ','_'),'.','_'),'$','_')
INTO #data
FROM (
	SELECT Val = STRING_AGG(CONVERT(nvarchar(MAX), x.Val), '') WITHIN GROUP (ORDER BY x.ID)
	FROM #rawdata x
) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
SELECT Answer = SUM(z.L * z.R)
FROM GENERATE_SERIES(1, 1000000) r
	CROSS JOIN #data rd
	CROSS APPLY (SELECT SubStr = SUBSTRING(rd.Val, r.[value], 12)) x
	CROSS APPLY (
		SELECT L = MAX(IIF(s.ordinal = 1, s.[value], NULL))
			, R  = MAX(IIF(s.ordinal = 2, s.[value], NULL))
		FROM STRING_SPLIT(x.SubStr, ',', 1) s
	) y
	CROSS APPLY (
		SELECT L = TRY_CONVERT(int, SUBSTRING(y.L, 5, 100))
			, R = TRY_CONVERT(int, LEFT(y.R, CHARINDEX(')', y.R)-1))
	) z
WHERE x.SubStr LIKE 'mul([0-9]%,[0-9]%)%'
	AND z.L IS NOT NULL AND z.R IS NOT NULL;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
IF OBJECT_ID('tempdb..#tmp','U') IS NOT NULL DROP TABLE #tmp; --SELECT * FROM #tmp
SELECT Val = SUBSTRING(z.SubSubStr, 1, COALESCE(NULLIF(CHARINDEX('don''t()', z.SubSubStr), 0), LEN(z.SubSubStr)))
INTO #tmp
FROM GENERATE_SERIES(1, 1000000) r
	CROSS JOIN #data rd
	CROSS APPLY (SELECT SubStr = SUBSTRING(rd.Val, r.[value], LEN(rd.Val))) x
	CROSS APPLY (SELECT EndPos = COALESCE(NULLIF(CHARINDEX('do()', x.SubStr, 5), 0), LEN(x.SubStr))) y
	CROSS APPLY (SELECT SubSubStr = SUBSTRING(x.SubStr, 1, y.EndPos-1)) z
WHERE x.SubStr LIKE 'do()%';

-- Copy paste of Part 1, only change was to use above temp table instead of #data
SELECT Answer = SUM(z.L * z.R)
FROM GENERATE_SERIES(1, 1000000) r
	CROSS JOIN #tmp rd
	CROSS APPLY (SELECT SubStr = SUBSTRING(rd.Val, r.[value], 12)) x
	CROSS APPLY (
		SELECT L = MAX(IIF(s.ordinal = 1, s.[value], NULL))
			, R  = MAX(IIF(s.ordinal = 2, s.[value], NULL))
		FROM STRING_SPLIT(x.SubStr, ',', 1) s
	) y
	CROSS APPLY (
		SELECT L = TRY_CONVERT(int, SUBSTRING(y.L, 5, 100))
			, R = TRY_CONVERT(int, LEFT(y.R, CHARINDEX(')', y.R)-1))
	) z
WHERE x.SubStr LIKE 'mul([0-9]%,[0-9]%)%'
	AND z.L IS NOT NULL AND z.R IS NOT NULL;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
