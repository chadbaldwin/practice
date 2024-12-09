------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	DECLARE @PuzzleDay		date	= '2024-12-09',
			@UseSampleData	bit		= 0;

    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int NOT NULL, Val nvarchar(MAX) NULL);

	INSERT INTO #rawdata (ID, Val)
	SELECT s.ordinal, s.[value]
	FROM dbo.AoC_Input_Raw r
		CROSS APPLY STRING_SPLIT(r.PuzzleInput, CHAR(10), 1) s
	WHERE r.PuzzleDay = @PuzzleDay AND r.IsSample = @UseSampleData

	DECLARE @input nvarchar(MAX);
	SELECT @input = Val FROM #rawdata;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Data prep
------------------------------------------------------------------------------

	IF OBJECT_ID('tempdb..#data','U') IS NOT NULL DROP TABLE #data; --SELECT * FROM #data
	SELECT MapPositionID = x.[value], y.FileID, BlockID = p.[value]
		, RevDataPositionID = IIF(y.FileID IS NOT NULL, ROW_NUMBER() OVER (PARTITION BY IIF(y.FileID IS NOT NULL, 1, 0) ORDER BY x.[value] DESC, p.[value] DESC), NULL)
		, EmptyPositionID   = IIF(y.FileID IS     NULL, ROW_NUMBER() OVER (PARTITION BY IIF(y.FileID IS NOT NULL, 1, 0) ORDER BY x.[value]     , p.[value]     ), NULL)
	INTO #data
	FROM GENERATE_SERIES(0,CONVERT(int, LEN(@input)-1)) x
		CROSS APPLY (SELECT Val = CONVERT(int, SUBSTRING(@input, x.[value]+1, 1))) v
		CROSS APPLY (SELECT FileID = IIF(x.[value] % 2 = 0, x.[value] / 2, NULL)) y
		CROSS APPLY GENERATE_SERIES(1, v.Val) p
	WHERE v.Val > 0
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
	DECLARE @TotalLen int;
	SELECT @TotalLen = COUNT(*) FROM #data d WHERE d.FileID IS NOT NULL

	SELECT Answer = SUM(rn * FileID)
	FROM (
		SELECT rn = ROW_NUMBER() OVER (ORDER BY de.MapPositionID, de.BlockID)-1
			, FileID = COALESCE(de.FileID, dd.FileID)
		FROM #data de
			LEFT JOIN #data dd ON dd.RevDataPositionID = de.EmptyPositionID
	) x
	WHERE x.rn+1 <= @TotalLen
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
	/* Looks like I'll need to use a completely different method than Part 1

	   Part 1 uses a sort of water fall method...we calculate the ID of each free block position
	   Then we calculate the matching ID of each data block position in reverse. Then it's just
	   a matter of a simple join.

	   However with Part 2, it's sort of a recursive style solve bceause we're no longer breaking
	   up files into blocks and moving 1 block at a time. Now we're moving entire files. However
	   a single file movement can now cause the next file to be inelligible for moving. So this
	   means that downstream decisions are affected by upstream decisions. Whereas in Part 1 it
	   could all be pre-mapped and each block movement is independently handled.

	   Update 1: I think the solution for this in SQL will have to rely on a loop. It will still
	   run pretty quickly but we'll unfortunately have to succumb to implementing a loop in code.
	*/

	IF OBJECT_ID('tempdb..#data2','U') IS NOT NULL DROP TABLE #data2; --SELECT * FROM #data2
	SELECT x.MapPositionID
		, BlockStart = SUM(x.[BlockSize]) OVER (ORDER BY x.MapPositionID) - x.[BlockSize]
		, x.FileID, x.[BlockSize]
	INTO #data2
	FROM (
		SELECT MapPositionID = x.[value], y.FileID, [BlockSize] = v.Val
		FROM GENERATE_SERIES(0,CONVERT(int, LEN(@input)-1)) x
			CROSS APPLY (SELECT FileID = CONVERT(int, IIF(x.[value] % 2 = 0, x.[value] / 2, NULL))) y
			CROSS APPLY (SELECT Val = CONVERT(int, SUBSTRING(@input, x.[value]+1, 1))) v
	) x

	SET NOCOUNT ON;

	/* Using a cursor ensures we only ever act on a file once so we don't run into a halloween problem
	   situation as well as abiding by the rules of the puzzle.
	*/
	DECLARE @MapPositionID int, @FileID int, @BlockSize int;

	DECLARE DataFile CURSOR FAST_FORWARD LOCAL
		FOR SELECT MapPositionID, FileID, [BlockSize]
			FROM #data2
			WHERE FileID IS NOT NULL
			ORDER BY MapPositionID DESC

	OPEN DataFile;

	FETCH NEXT FROM DataFile INTO @MapPositionID, @FileID, @BlockSize;

	DECLARE @EmptySpaceID int, @EmptyBlockStart int;
	WHILE (@@FETCH_STATUS = 0)
	BEGIN;
		SELECT @EmptySpaceID = NULL, @EmptyBlockStart = NULL;

		-- Find the first empty spot that will fit our file
		SELECT TOP(1) @EmptySpaceID = d.MapPositionID, @EmptyBlockStart = d.BlockStart
		FROM #data2 d
		WHERE d.FileID IS NULL
			AND d.[BlockSize] >= @BlockSize
			AND d.MapPositionID < @MapPositionID
		ORDER BY d.MapPositionID

		IF (@EmptySpaceID IS NOT NULL)
		BEGIN;
			-- Now we need to move our file
			-- We start with updating the empty space to change its starting position and size
			UPDATE d SET d.BlockStart += @BlockSize, d.[BlockSize] -= @BlockSize
			FROM #data2 d
			WHERE d.MapPositionID = @EmptySpaceID

			-- Then we can update our file to set its new position
			UPDATE d SET d.BlockStart = @EmptyBlockStart
			FROM #data2 d
			WHERE d.MapPositionID = @MapPositionID

		END;

		FETCH NEXT FROM DataFile INTO @MapPositionID, @FileID, @BlockSize;
	END;

	CLOSE DataFile;
	DEALLOCATE DataFile;

	SELECT Answer = CONVERT(bigint, SUM(([BlockSize]*BlockStart+([BlockSize]*([BlockSize]-1)/2.0))*FileID))
	FROM #data2
------------------------------------------------------------------------------

------------------------------------------------------------------------------
