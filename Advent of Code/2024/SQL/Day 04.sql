------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-04',
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
IF OBJECT_ID('tempdb..#letters','U') IS NOT NULL DROP TABLE #letters; --SELECT * FROM #letters
SELECT [Row] = r.ID, Col = x.Col, x.Letter
INTO #letters
FROM #rawdata r
    CROSS APPLY (
        SELECT Col = x.[value], Letter = SUBSTRING(r.Val, x.[value], 1)
        FROM GENERATE_SERIES(1, CONVERT(int, LEN(r.Val))) x
    ) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
WITH cte AS (
    SELECT x = STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.[Row], l.Col) FROM #letters l GROUP BY l.[Row]
    UNION ALL
    SELECT x = STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.[Row], l.Col) FROM #letters l GROUP BY l.Col
    UNION ALL
    SELECT x = STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.[Row], l.Col) FROM #letters l GROUP BY l.[Row] - l.Col
    UNION ALL
    SELECT x = STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.[Row], l.Col) FROM #letters l GROUP BY l.[Row] + l.Col
), cte2 AS (
    SELECT x = cte.x FROM cte
    UNION ALL
    SELECT x = REVERSE(cte.x) FROM cte
)
SELECT Answer = SUM((LEN(x.x) - LEN(REPLACE(x.x, 'XMAS', ''))) / 4)
FROM cte2 x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
SELECT Answer = COUNT(*)
FROM #letters l
    CROSS APPLY (SELECT * FROM #letters x WHERE x.[Row] = l.[Row]-1 AND x.Col = l.Col-1) tl
    CROSS APPLY (SELECT * FROM #letters x WHERE x.[Row] = l.[Row]+1 AND x.Col = l.Col+1) br
    CROSS APPLY (SELECT * FROM #letters x WHERE x.[Row] = l.[Row]-1 AND x.Col = l.Col+1) tr
    CROSS APPLY (SELECT * FROM #letters x WHERE x.[Row] = l.[Row]+1 AND x.Col = l.Col-1) bl
WHERE l.Letter = 'A'
    AND CONCAT(tl.Letter, l.Letter, br.Letter) IN ('MAS', 'SAM')
    AND CONCAT(tr.Letter, l.Letter, bl.Letter) IN ('MAS', 'SAM');
------------------------------------------------------------------------------

------------------------------------------------------------------------------
