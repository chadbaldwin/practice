SET NOCOUNT ON;
------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int IDENTITY, Val int NOT NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            (3),(4),(3),(1),(2);
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            (1),(3),(1),(5),(5),(1),(1),(1),(5),(1),(1),(1),(3),(1),(1),(4),(3),(1),(1),(2),(2),(4),(2),(1),(3),(3),(2),(4),(4),(4),(1),(3),(1),(1),(4),(3),(1),(5),(5),(1),(1),(3),(4),(2),(1),(5),(3),(4),(5),(5),(2),(5),(5),(1),(5),(5),(2),(1),(5),(1),(1),(2),(1),(1),(1),(4),(4),(1),(3),(3),(1),(5),(4),(4),(3),(4),(3),(3),(1),(1),(3),(4),(1),(5),(5),(2),(5),(2),(2),(4),(1),(2),(5),(2),(1),(2),(5),(4),(1),(1),
            (1),(1),(1),(4),(1),(1),(3),(1),(5),(2),(5),(1),(3),(1),(5),(3),(3),(2),(2),(1),(5),(1),(1),(1),(2),(1),(1),(2),(1),(1),(2),(1),(5),(3),(5),(2),(5),(2),(2),(2),(1),(1),(1),(5),(5),(2),(2),(1),(1),(3),(4),(1),(1),(3),(1),(3),(5),(1),(4),(1),(4),(1),(3),(1),(4),(1),(1),(1),(1),(2),(1),(4),(5),(4),(5),(5),(2),(1),(3),(1),(4),(2),(5),(1),(1),(3),(5),(2),(1),(2),(2),(5),(1),(2),(2),(4),(5),(2),(1),(1),
            (1),(1),(2),(2),(3),(1),(5),(5),(5),(3),(2),(4),(2),(4),(1),(5),(3),(1),(4),(4),(2),(4),(2),(2),(4),(4),(4),(4),(1),(3),(4),(3),(2),(1),(3),(5),(3),(1),(5),(5),(4),(1),(5),(1),(2),(4),(2),(5),(4),(1),(3),(3),(1),(4),(1),(3),(3),(3),(1),(3),(1),(1),(1),(1),(4),(1),(2),(3),(1),(3),(3),(5),(2),(3),(1),(1),(1),(5),(5),(4),(1),(2),(3),(1),(3),(1),(1),(4),(1),(3),(2),(2),(1),(1),(1),(3),(4),(3),(1),(3);
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#part1_data','U') IS NOT NULL DROP TABLE #part1_data; --SELECT * FROM #part1_data
    SELECT r.ID, r.Val
    INTO #part1_data
    FROM #rawdata r;

    -- There might be a way to accomplish this with a tally table, but I'm just going to brute force it to see what Part 2 requires

    DECLARE @c int = 0, @i int;

    SET @i = 80;

    WHILE (1=1)
    BEGIN;
        SET @c += 1;

        IF (@c > @i) BREAK;

        UPDATE r SET r.Val -= 1
        FROM #part1_data r;

        IF EXISTS (SELECT * FROM #part1_data r WHERE r.Val = -1)
        BEGIN;
            INSERT INTO #part1_data (Val)
            SELECT 8
            FROM #part1_data r  
            WHERE r.Val = -1;

            UPDATE r SET r.Val = 6
            FROM #part1_data r  
            WHERE r.Val = -1;
        END;

        RAISERROR('.',0,1) WITH NOWAIT;
    END;

    SELECT Answer = COUNT(*)
    FROM #part1_data r;
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    -- Using the Part 1 method would take hours to run, so it needs to be optimized
    /*
        Another possible method would be to group the values into buckets.
        Like
            1 fish has 2 days
            3 fish have 6 days

        Then loop on the buckets, adding / re-arranging appropriately.
    */

    IF OBJECT_ID('tempdb..#part2_data','U') IS NOT NULL DROP TABLE #part2_data; --SELECT * FROM #part2_data
    CREATE TABLE #part2_data (Timer int NOT NULL, FishCount bigint NOT NULL);

    INSERT INTO #part2_data (Timer, FishCount)
    SELECT Timer = r.Val, FishCount = COUNT(*)
    FROM #rawdata r
    GROUP BY r.Val;

    DECLARE @c int = 0, @i int = 0;
    DECLARE @AddCount bigint = 0;

    SET @i = 256;

    WHILE (1=1)
    BEGIN;
        SET @c += 1;

        IF (@c > @i) BREAK;

        -- Decrement the counters
        UPDATE d SET Timer -= 1 FROM #part2_data d;

        IF EXISTS (SELECT * FROM #part2_data r WHERE r.Timer = -1)
        BEGIN;
            SELECT @AddCount = d.FishCount
            FROM #part2_data d
            WHERE d.Timer = -1;

            -- Add new fish
            INSERT INTO #part2_data (Timer, FishCount) VALUES (8, @AddCount);

            -- Re-arrange - If fish with 6 day timer exists, then add to it, and remove the -1 timers
            -- But if it doesn't exist (unlikely with larger set) then update our -1 record to a 6
            IF EXISTS (SELECT * FROM #part2_data WHERE Timer = 6)
            BEGIN;
                UPDATE #part2_data SET FishCount += @AddCount WHERE Timer = 6;
                DELETE #part2_data WHERE Timer = -1;
            END;
            ELSE
            BEGIN;
                UPDATE #part2_data SET Timer = 6 WHERE Timer = -1;
            END;
        END;

        RAISERROR('.',0,1) WITH NOWAIT;
    END;

    SELECT Answer = SUM(d.FishCount)
    FROM #part2_data d;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
