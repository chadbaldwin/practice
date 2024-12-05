------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-01',
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
SELECT RN0 = ROW_NUMBER() OVER (ORDER BY x.N0), x.N0
	, RN1  = ROW_NUMBER() OVER (ORDER BY x.N1), x.N1
INTO #data
FROM (
	SELECT N0 = CONVERT(int, PARSENAME(REPLACE(r.Val, '   ', '.'), 2))
		, N1  = CONVERT(int, PARSENAME(REPLACE(r.Val, '   ', '.'), 1))
	FROM #rawdata r
) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
SELECT Answer = SUM(x.Diff)
FROM (
	SELECT Diff = ABS(x0.N0 - x1.N1)
	FROM #data x0
		JOIN #data x1 ON x1.RN1 = x0.RN0
) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
SELECT Answer = SUM(d0.N0 * x.Occurence)
FROM #data d0
	CROSS APPLY (
		SELECT Occurence = COUNT(*)
		FROM #data d1
		WHERE d1.N1 = d0.N0
	) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
