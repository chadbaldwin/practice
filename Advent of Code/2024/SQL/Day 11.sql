------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    DECLARE @PuzzleDay      date    = '2024-12-11',
            @UseSampleData  bit     = 0;

    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (Val nvarchar(MAX) NULL);

    INSERT INTO #rawdata (Val)
    SELECT s.[value]
    FROM dbo.AoC_Input_Raw r
        CROSS APPLY STRING_SPLIT(r.PuzzleInput, ' ') s
    WHERE r.PuzzleDay = @PuzzleDay AND r.IsSample = @UseSampleData
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Parts 1 & 2
------------------------------------------------------------------------------
    SET NOCOUNT ON;

    DECLARE @ts datetime2 = SYSUTCDATETIME();

    DROP TABLE IF EXISTS #nums;
    CREATE TABLE #nums (Num nvarchar(20) NOT NULL UNIQUE CLUSTERED, Cnt bigint NOT NULL);

    DROP TABLE IF EXISTS #nums_tmp;
    CREATE TABLE #nums_tmp (Num nvarchar(20) NOT NULL UNIQUE CLUSTERED, Cnt bigint NOT NULL);

    -- Initialize table
    INSERT INTO #nums (Num, Cnt) SELECT rd.Val, COUNT(*) FROM #rawdata rd GROUP BY rd.Val

    DECLARE @c int = 75;
    WHILE (@c > 0)
    BEGIN;
        -- spit out Part 1 answer as we're working
        IF (@c = 50) SELECT Answer_Part1 = SUM(Cnt) FROM #nums

        TRUNCATE TABLE #nums_tmp
        INSERT INTO #nums_tmp (Num, Cnt) SELECT Num, Cnt FROM #nums

        TRUNCATE TABLE #nums
        INSERT INTO #nums (Num, Cnt)
        SELECT NewNum = CONVERT(nvarchar(20), CONVERT(bigint, y.[value])), SUM(n.Cnt)
        FROM #nums_tmp n
            CROSS APPLY (
                SELECT NewValue = CASE
                                    WHEN n.Num = '0'            THEN '1'
                                    WHEN LEN(n.Num) % 2 = 0     THEN STUFF(n.Num, LEN(n.Num)/2+1, 0, ' ')
                                    ELSE CONVERT(nvarchar(100), CONVERT(bigint, n.Num) * 2024)
                                END
            ) x
            CROSS APPLY STRING_SPLIT(x.NewValue, ' ') y
        GROUP BY CONVERT(nvarchar(20), CONVERT(bigint, y.[value]))

        SET @c -= 1;
    END;

    SELECT Answer_Part2 = SUM(Cnt)
    FROM #nums

    SELECT Runtime = FORMAT(DATEDIFF(MILLISECOND, @ts, SYSUTCDATETIME()), 'N0')
------------------------------------------------------------------------------

------------------------------------------------------------------------------
