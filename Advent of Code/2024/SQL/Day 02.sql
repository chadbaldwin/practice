------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-02',
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
SELECT ReportID = r.ID
    , ReportValueID = x.ordinal
    , ReportValue = CONVERT(int, x.[value])
INTO #data
FROM #rawdata r
    CROSS APPLY (SELECT [value], ordinal FROM STRING_SPLIT(Val, ' ', 1)) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
SELECT Answer = COUNT(*)
FROM (
    SELECT x.ReportID, MinDiff = MIN(ABS(x.Diff)), MaxDiff = MAX(ABS(x.Diff)), DiffTypeCount = COUNT(DISTINCT SIGN(x.Diff))
    FROM (
        SELECT d.ReportID, d.ReportValue
            , Diff = d.ReportValue - LEAD(d.ReportValue) OVER (PARTITION BY d.ReportID ORDER BY d.ReportValueID)
        FROM #data d
    ) x
    GROUP BY x.ReportID
) x
WHERE x.DiffTypeCount = 1 AND x.MinDiff >= 1 AND x.MaxDiff <= 3
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
/*
    Solution was to use the same code as above, but instead, we generate multiple versions of each report each missing just 1 value.
    Then we take a count of how many reports would be considered safe. For example:
        The report:
            1 3 2 4 5
        We would generate reports:
            1 3 2 4 5    (+2 -1 +2 +1) Unsafe
            _ 3 2 4 5    (-1 +2 +1)    Unsafe
            1 _ 2 4 5    (+1 +2 +1)    Safe
            1 3 _ 4 5    (+2 +1 +1)    Safe
            1 3 2 _ 5    (+2 -1 +3)    Unsafe
            1 3 2 4 _    (+2 -1 +2)    Unsafe
        Run the code from Part 1 for each of those reports and take a count of all that pass the safe criteria. In this case there's 2.

        At the very end, we take a count of all reports that have at least 1 possible safe version.

        Yes, the code itself is ugly and hard to follow...but the goal of this is to find the answer, not write beautiful code :)
*/
SELECT Answer = COUNT(*)
FROM (SELECT DISTINCT ReportID FROM #data) x
    CROSS APPLY (SELECT ReportSize = COUNT(*) FROM #data d2 WHERE d2.ReportID = x.ReportID) s
    CROSS APPLY (
        SELECT SafeReportVersionCount = COUNT(*)
        FROM (
            SELECT x.ReportAlternateVersionID, MinDiff = MIN(ABS(x.Diff)), MaxDiff = MAX(ABS(x.Diff)), DiffTypeCount = COUNT(DISTINCT SIGN(x.Diff))
            FROM (
                SELECT ReportAlternateVersionID = gs.[value], d3.ReportValueID, d3.ReportValue
                    , Diff = d3.ReportValue - LEAD(d3.ReportValue) OVER (PARTITION BY gs.[value] ORDER BY d3.ReportValueID)
                FROM #data d3
                    CROSS JOIN GENERATE_SERIES(0, s.ReportSize) gs
                WHERE d3.ReportID = x.ReportID
                    AND d3.ReportValueID <> gs.[value]
            ) x
            GROUP BY x.ReportAlternateVersionID
        ) x
        WHERE x.DiffTypeCount = 1 AND x.MinDiff >= 1 AND x.MaxDiff <= 3
    ) r
WHERE r.SafeReportVersionCount > 0
------------------------------------------------------------------------------

------------------------------------------------------------------------------
