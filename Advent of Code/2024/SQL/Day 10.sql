------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-10',
			@UseSampleData	bit		= 0;

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
	DROP TABLE IF EXISTS #grid; -- SELECT * FROM #grid ORDER BY RowID, ColID;
	CREATE TABLE #grid (
		ID		int		NOT NULL IDENTITY(1,1),
		RowID	int		NOT NULL,
		ColID	int		NOT NULL,
		Val		char(1)	NOT NULL,
		PRIMARY KEY CLUSTERED (RowID, ColID),
		INDEX IX NONCLUSTERED (Val, RowID, ColID)
	);

	-- Standard convert to grid - X/Y coordinates or Row/Col Num
	INSERT INTO #grid (RowID, ColID, Val)
	SELECT r.ID, x.ColID, x.Val
	FROM #rawdata r
		CROSS APPLY (
			SELECT ColID = x.[value], Val = SUBSTRING(r.Val, x.[value], 1)
			FROM GENERATE_SERIES(1, CONVERT(int, LEN(r.Val))) x
		) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Parts 1 & 2
------------------------------------------------------------------------------
	-- Look, I know it's ugly, but it was quick to write, it works and it runs fast, so who cares :P
	SELECT Answer_Part1 = SUM(x.Score), Answer_Part2  = SUM(x.Rating)
	FROM (
		SELECT g0.ID, Score = COUNT(DISTINCT g9.ID), Rating = COUNT(g9.ID)
		FROM #grid g0
			CROSS APPLY (SELECT * FROM #grid g1 WHERE g1.Val = 1 AND ((g0.ColID = g1.ColID AND ABS(g0.RowID - g1.RowID) = 1) OR (g0.RowID = g1.RowID AND ABS(g0.ColID - g1.ColID) = 1))) g1
			CROSS APPLY (SELECT * FROM #grid g2 WHERE g2.Val = 2 AND ((g1.ColID = g2.ColID AND ABS(g1.RowID - g2.RowID) = 1) OR (g1.RowID = g2.RowID AND ABS(g1.ColID - g2.ColID) = 1))) g2
			CROSS APPLY (SELECT * FROM #grid g3 WHERE g3.Val = 3 AND ((g2.ColID = g3.ColID AND ABS(g2.RowID - g3.RowID) = 1) OR (g2.RowID = g3.RowID AND ABS(g2.ColID - g3.ColID) = 1))) g3
			CROSS APPLY (SELECT * FROM #grid g4 WHERE g4.Val = 4 AND ((g3.ColID = g4.ColID AND ABS(g3.RowID - g4.RowID) = 1) OR (g3.RowID = g4.RowID AND ABS(g3.ColID - g4.ColID) = 1))) g4
			CROSS APPLY (SELECT * FROM #grid g5 WHERE g5.Val = 5 AND ((g4.ColID = g5.ColID AND ABS(g4.RowID - g5.RowID) = 1) OR (g4.RowID = g5.RowID AND ABS(g4.ColID - g5.ColID) = 1))) g5
			CROSS APPLY (SELECT * FROM #grid g6 WHERE g6.Val = 6 AND ((g5.ColID = g6.ColID AND ABS(g5.RowID - g6.RowID) = 1) OR (g5.RowID = g6.RowID AND ABS(g5.ColID - g6.ColID) = 1))) g6
			CROSS APPLY (SELECT * FROM #grid g7 WHERE g7.Val = 7 AND ((g6.ColID = g7.ColID AND ABS(g6.RowID - g7.RowID) = 1) OR (g6.RowID = g7.RowID AND ABS(g6.ColID - g7.ColID) = 1))) g7
			CROSS APPLY (SELECT * FROM #grid g8 WHERE g8.Val = 8 AND ((g7.ColID = g8.ColID AND ABS(g7.RowID - g8.RowID) = 1) OR (g7.RowID = g8.RowID AND ABS(g7.ColID - g8.ColID) = 1))) g8
			CROSS APPLY (SELECT * FROM #grid g9 WHERE g9.Val = 9 AND ((g8.ColID = g9.ColID AND ABS(g8.RowID - g9.RowID) = 1) OR (g8.RowID = g9.RowID AND ABS(g8.ColID - g9.ColID) = 1))) g9
		WHERE g0.Val = 0
		GROUP BY g0.ID
	) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
