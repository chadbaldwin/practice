SET NOCOUNT ON;
GO
------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
	IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
	CREATE TABLE #rawdata (ID int IDENTITY, Val varchar(200) NOT NULL);

	DECLARE @UseSampleData bit = 0;

	IF (@UseSampleData = 1)
	BEGIN;
		RAISERROR('Sample data',0,1) WITH NOWAIT;
		INSERT INTO #rawdata (Val) VALUES
			('5483143223'),('2745854711'),('5264556173'),('6141336146'),('6357385478'),('4167524645'),('2176841721'),('6882881134'),('4846848554'),('5283751526');
		--	('11111'),('19991'),('19191'),('19991'),('11111')

	END;
	ELSE
	BEGIN;
		RAISERROR('Real data',0,1) WITH NOWAIT;
		INSERT INTO #rawdata (Val) VALUES
			('4721224663'),('6875415276'),('2742448428'),('4878231556'),('5684643743'),('3553681866'),('4788183625'),('4255856532'),('1415818775'),('2326886125');
	END;

	IF OBJECT_ID('tempdb..#data','U') IS NOT NULL DROP TABLE #data; --SELECT * FROM #data
	WITH cte_Data AS (
		SELECT ID = ROW_NUMBER() OVER (ORDER BY r.ID, x.ColID)
			, RowID = r.ID, x.ColID, x.Val
		FROM #rawdata r
			CROSS APPLY (
				SELECT ColID = ROW_NUMBER() OVER (ORDER BY 1/0)
					, Val = CONVERT(int, SUBSTRING(r.Val, ROW_NUMBER() OVER (ORDER BY 1/0), 1))
				FROM STRING_SPLIT(REPLICATE(',', LEN(r.Val)-1), ',') x
			) x	
	)
	SELECT r.ID, r.RowID, r.ColID, r.Val
	INTO #data
	FROM cte_Data r
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
	IF OBJECT_ID('tempdb..#part1_data','U') IS NOT NULL DROP TABLE #part1_data; --SELECT * FROM #part1_data
	SELECT * INTO #part1_data FROM #data

	DECLARE @i int = 100, @FlashCount int = 0;

	WHILE (@i > 0)
	BEGIN;
		UPDATE d SET d.Val += 1	FROM #part1_data d;

		IF EXISTS (SELECT * FROM #part1_data WHERE Val >= 10)
		BEGIN;
			WHILE EXISTS(SELECT * FROM #part1_data WHERE Val >= 10)
			BEGIN;
				WITH cte_flashes AS (
					SELECT x.ID, Increment = SUM(IIF(x.Val >= 10, NULL, 1))
					FROM #part1_data d
						OUTER APPLY (
							SELECT d2.ID, d2.Val
							FROM #part1_data d2
							WHERE   d.RowID BETWEEN d2.RowID-1 AND d2.RowID+1
								AND d.ColID BETWEEN d2.ColID-1 AND d2.ColID+1
						) x
					WHERE d.Val >= 10
					GROUP BY x.ID
				)
				UPDATE d SET d.Val += f.Increment
				FROM #part1_data d
					JOIN cte_flashes f ON f.ID = d.ID
			END;

			UPDATE d SET d.Val = 0 FROM #part1_data d WHERE d.Val IS NULL;
			SET @FlashCount += @@ROWCOUNT;
		END;

		SET @i -= 1;
	END;

	SELECT Answer = @FlashCount;

	SELECT d.RowID
		, ReconstructedString = STRING_AGG(RIGHT(CONCAT('  ',d.Val),2), CHAR(9)) WITHIN GROUP (ORDER BY d.ID)
	FROM #part1_data d
	GROUP BY d.RowID
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
	-- Part 2 is the same as Part 1, except instead of running X number of times, we need to run until all values are 0
	IF OBJECT_ID('tempdb..#part2_data','U') IS NOT NULL DROP TABLE #part2_data; --SELECT * FROM #part2_data
	SELECT * INTO #part2_data FROM #data

	DECLARE @i int = 1;

	WHILE (1=1)
	BEGIN;
		UPDATE d SET d.Val += 1	FROM #part2_data d;

		IF EXISTS (SELECT * FROM #part2_data WHERE Val >= 10)
		BEGIN;
			WHILE EXISTS(SELECT * FROM #part2_data WHERE Val >= 10)
			BEGIN;
				WITH cte_flashes AS (
					SELECT x.ID, Increment = SUM(IIF(x.Val >= 10, NULL, 1))
					FROM #part2_data d
						OUTER APPLY (
							SELECT d2.ID, d2.Val
							FROM #part2_data d2
							WHERE   d.RowID BETWEEN d2.RowID-1 AND d2.RowID+1
								AND d.ColID BETWEEN d2.ColID-1 AND d2.ColID+1
						) x
					WHERE d.Val >= 10
					GROUP BY x.ID
				)
				UPDATE d SET d.Val += f.Increment
				FROM #part2_data d
					JOIN cte_flashes f ON f.ID = d.ID
			END;

			UPDATE d SET d.Val = 0 FROM #part2_data d WHERE d.Val IS NULL;
		END;

		IF ((SELECT SUM(Val) FROM #part2_data) = 0) BREAK;

		SET @i += 1;
	END;

	SELECT Answer = @i;

	SELECT d.RowID
		, ReconstructedString = STRING_AGG(RIGHT(CONCAT('  ',d.Val),2), CHAR(9)) WITHIN GROUP (ORDER BY d.ID)
	FROM #part2_data d
	GROUP BY d.RowID
------------------------------------------------------------------------------

------------------------------------------------------------------------------