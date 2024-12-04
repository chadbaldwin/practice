/*
# Use to convert clipboard into insert statements
gcb |
    Get-Batches -BatchSize 10 |
    % { $_ | Join-String -Separator ',' -FormatString "('{0}')" -OutputPrefix 'INSERT INTO #rawdata (Val) VALUES ' -OutputSuffix ';' } |
    scb
*/
------------------------------------------------------------------------------
-- Challenge
------------------------------------------------------------------------------
/*
-- Paste Part 1 text here
*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
/*
-- Paste Part 2 text here
*/
------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int IDENTITY NOT NULL, Val nvarchar(MAX) NULL);

    DECLARE @UseSampleData bit = 1;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
    --  INSERT INTO #rawdata (Val) VALUES (....
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
    --  INSERT INTO #rawdata (Val) VALUES (....
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data prep
------------------------------------------------------------------------------
/*
DROP TABLE IF EXISTS #numbers;
CREATE TABLE #numbers (ID int NOT NULL INDEX CIX CLUSTERED)
INSERT INTO #numbers (ID) SELECT x.[value] FROM GENERATE_SERIES(0,1000000) x

DROP TABLE IF EXISTS #letters; -- SELECT * FROM #letters ORDER BY RowID, ColID;
CREATE TABLE #letters (
	RowID	int		NOT NULL,
	ColID	int		NOT NULL,
	Letter	char(1)	NOT NULL,
	PRIMARY KEY CLUSTERED (RowID, ColID),
	INDEX IX NONCLUSTERED (Letter, RowID, ColID)
);

-- Standard convert to grid - X/Y coordinates or Row/Col Num
INSERT INTO #letters (RowID, ColID, Letter)
SELECT r.ID, x.ColID, x.Letter
FROM #rawdata r
    CROSS APPLY (
        SELECT ColID = x.[value], Letter = SUBSTRING(r.Val, x.[value], 1)
        FROM GENERATE_SERIES(1, LEN(r.Val)) x
    ) x;

DROP TABLE IF EXISTS #surround; -- SELECT * FROM #surround ORDER BY CRow, CCol;
CREATE TABLE #surround (
	CRow int NOT NULL,
	CCol int NOT NULL,
	TL char(1) NULL, T char(1)     NULL, TR char(1) NULL,
	L  char(1) NULL, C char(1) NOT NULL, R  char(1) NULL,
	BL char(1) NULL, B char(1)     NULL, BR char(1) NULL,
	PRIMARY KEY CLUSTERED (CRow, CCol),
	INDEX IX NONCLUSTERED (C, CRow, CCol)
);

-- Surrounding letters
INSERT INTO #surround (CRow, CCol, TL, T, TR, L, C, R, BL, B, BR)
SELECT c.RowID, c.ColID, tl.Letter, t.Letter, tr.Letter, l.Letter, c.Letter, r.Letter, bl.Letter, b.Letter, br.Letter
FROM #letters c
    OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID-1 AND x.ColID = c.ColID-1) tl
	OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID-1 AND x.ColID = c.ColID  ) t
    OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID-1 AND x.ColID = c.ColID+1) tr
	OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID   AND x.ColID = c.ColID+1) r
    OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID+1 AND x.ColID = c.ColID+1) br
	OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID+1 AND x.ColID = c.ColID  ) b
    OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID+1 AND x.ColID = c.ColID-1) bl
	OUTER APPLY (SELECT x.Letter FROM #letters x WHERE x.RowID = c.RowID   AND x.ColID = c.ColID-1) l
WHERE 1=1;

-- Striping
SELECT 'H', STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.RowID, l.ColID) FROM #letters l GROUP BY l.RowID
UNION ALL
SELECT 'V', STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.RowID, l.ColID) FROM #letters l GROUP BY l.ColID
UNION ALL
SELECT 'DD', STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.RowID, l.ColID) FROM #letters l GROUP BY l.RowID - l.ColID
UNION ALL
SELECT 'DU', STRING_AGG(l.Letter, '') WITHIN GROUP (ORDER BY l.RowID, l.ColID) FROM #letters l GROUP BY l.RowID + l.ColID
*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------


------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------


------------------------------------------------------------------------------

------------------------------------------------------------------------------
