------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-08',
			@UseSampleData	bit		= 0;

	IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata ORDER BY ID DESC
	CREATE TABLE #rawdata (ID int NOT NULL IDENTITY, Val nvarchar(MAX) NULL);

	INSERT INTO #rawdata (Val)
	SELECT s.[value]
	FROM dbo.AoC_Input_Raw r
		CROSS APPLY STRING_SPLIT(r.PuzzleInput, CHAR(10), 1) s
	WHERE r.PuzzleDay = @PuzzleDay AND r.IsSample = @UseSampleData
	ORDER BY s.ordinal DESC
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data prep
------------------------------------------------------------------------------
	DROP TABLE IF EXISTS #grid; -- SELECT * FROM #grid ORDER BY X, Y;
	CREATE TABLE #grid (
		ID	int		NOT NULL IDENTITY,
		X	int		NOT NULL,
		Y	int		NOT NULL,
		Val	char(1) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
		PRIMARY KEY CLUSTERED (X, Y),
		INDEX IX NONCLUSTERED (Val, X, Y)
	);

	-- Standard convert to grid - X/Y coordinates
	INSERT INTO #grid (X, Y, Val)
	SELECT x.ColID, r.ID, x.Val
	FROM #rawdata r
		CROSS APPLY (
			SELECT ColID = x.[value], Val = SUBSTRING(r.Val, x.[value], 1)
			FROM GENERATE_SERIES(1, CONVERT(int, LEN(r.Val))) x
		) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
	SELECT Answer = COUNT(DISTINCT g2.ID)
	FROM #grid g
		CROSS APPLY (SELECT g2.X, g2.Y FROM #grid g2 WHERE g2.Val = g.Val AND g2.ID <> g.ID) x
		CROSS APPLY (
			VALUES  (g.X + (g.X - x.X), g.Y + (g.Y - x.Y)),
					(x.X - (g.X - x.X), x.Y - (g.Y - x.Y))
		) a(X,Y)
		JOIN #grid g2 ON g2.X = a.X AND g2.Y = a.Y
	WHERE g.Val <> '.'
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
	SELECT Answer = COUNT(DISTINCT a.ID)
	FROM #grid c1
		-- Find all points with matching values
		CROSS APPLY (SELECT g2.X, g2.Y FROM #grid g2 WHERE g2.Val = c1.Val AND g2.ID <> c1.ID) c2
		CROSS APPLY (
			SELECT c3.ID
			FROM #grid c3
			-- Identify all points that have the same slope in either direction
			WHERE (c3.Y - c1.Y * 1.0) / NULLIF(c3.X - c1.X * 1.0, 0) /* slope of 1&3=(Y₃-Y₁)/(X₃-X₁) */
				- (c2.Y - c1.Y * 1.0) / NULLIF(c2.X - c1.X * 1.0, 0) /* slope of 1&2=(Y₂-Y₁)/(X₂-X₁) */
				= 0
				AND c3.ID <> c1.ID
		) a
	WHERE c1.Val <> '.'
------------------------------------------------------------------------------

------------------------------------------------------------------------------
