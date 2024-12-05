------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-05',
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
	IF OBJECT_ID('tempdb..#rules','U') IS NOT NULL DROP TABLE #rules; --SELECT * FROM #rules
	SELECT PageNumber		= CONVERT(int, PARSENAME(REPLACE(r.Val,'|','.'), 2))
		, ShouldOccurBefore	= CONVERT(int, PARSENAME(REPLACE(r.Val,'|','.'), 1))
	INTO #rules
	FROM #rawdata r
	WHERE CHARINDEX('|',r.Val) > 0;

	IF OBJECT_ID('tempdb..#pages','U') IS NOT NULL DROP TABLE #pages; --SELECT * FROM #pages
	SELECT r.ID, PageID = x.ordinal, PageNumber = CONVERT(int, x.[value])
		, PageIDRev = ROW_NUMBER() OVER (PARTITION BY r.ID ORDER BY x.ordinal DESC)
		, IsMiddlePage = IIF(PERCENT_RANK() OVER (PARTITION BY r.ID ORDER BY x.ordinal) = 0.5, 1, 0)
	INTO #pages
	FROM #rawdata r
		CROSS APPLY STRING_SPLIT(r.Val, ',', 1) x
	WHERE CHARINDEX(',',r.Val) > 0;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
	SELECT Answer = SUM(p3.PageNumber)
	FROM #pages p3
	WHERE p3.IsMiddlePage = 1
		AND NOT EXISTS (
			SELECT *
			FROM #pages p
				OUTER APPLY (
					SELECT ShouldOccurBefore = r.ShouldOccurBefore
					FROM #rules r
						LEFT JOIN #pages p2 ON p2.PageNumber = r.ShouldOccurBefore AND p2.ID = p.ID AND p2.PageID > p.PageID
					WHERE r.PageNumber = p.PageNumber
						AND EXISTS (SELECT * FROM #pages p1 WHERE p1.ID = p.ID AND p1.PageNumber = r.ShouldOccurBefore)
						AND p2.PageNumber IS NULL
				) x
			WHERE x.ShouldOccurBefore IS NOT NULL
				AND p.ID = p3.ID
		)
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
	SELECT Asnwer = SUM(x.PageNumber)
	FROM (
		SELECT x.PageNumber, x.IsMiddlePage, IsBadOrder = MAX(IIF(x.PageIDRev-1 <> x.RuleCount, 1, 0)) OVER (PARTITION BY x.ID)
		FROM (
			SELECT p.ID, p.PageNumber, p.PageIDRev, x.RuleCount, IsMiddlePage = IIF(PERCENT_RANK() OVER (PARTITION BY p.ID ORDER BY x.RuleCount) = 0.5, 1, 0)
			FROM #pages p
				OUTER APPLY (
					SELECT RuleCount = COUNT(*)
					FROM #rules r
					WHERE r.PageNumber = p.PageNumber
						AND EXISTS (SELECT * FROM #pages p1 WHERE p1.ID = p.ID AND p1.PageNumber = r.ShouldOccurBefore)
				) x
		) x
	) x
	WHERE x.IsMiddlePage = 1 AND x.IsBadOrder = 1
------------------------------------------------------------------------------

------------------------------------------------------------------------------
