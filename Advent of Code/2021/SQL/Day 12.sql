------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int IDENTITY, Val varchar(20) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL);

    IF OBJECT_ID('tempdb..#sampleAnswer','U') IS NOT NULL DROP TABLE #sampleAnswer; --SELECT * FROM #sampleAnswer
    CREATE TABLE #sampleAnswer (Val varchar(50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        -- 10 paths
        INSERT INTO #rawdata (Val) VALUES ('start-A'),('start-b'),('A-c'),('A-b'),('b-d'),('A-end'),('b-end')
        INSERT INTO #sampleAnswer (Val) VALUES ('start,A,b,A,b,A,c,A,end'),('start,A,b,A,b,A,end'),('start,A,b,A,b,end'),('start,A,b,A,c,A,b,A,end'),('start,A,b,A,c,A,b,end'),('start,A,b,A,c,A,c,A,end'),('start,A,b,A,c,A,end'),('start,A,b,A,end'),('start,A,b,d,b,A,c,A,end'),('start,A,b,d,b,A,end'),('start,A,b,d,b,end'),('start,A,b,end'),('start,A,c,A,b,A,b,A,end'),('start,A,c,A,b,A,b,end'),('start,A,c,A,b,A,c,A,end'),('start,A,c,A,b,A,end'),('start,A,c,A,b,d,b,A,end'),('start,A,c,A,b,d,b,end'),('start,A,c,A,b,end'),('start,A,c,A,c,A,b,A,end'),('start,A,c,A,c,A,b,end'),('start,A,c,A,c,A,end'),('start,A,c,A,end'),('start,A,end'),('start,b,A,b,A,c,A,end'),('start,b,A,b,A,end'),('start,b,A,b,end'),('start,b,A,c,A,b,A,end'),('start,b,A,c,A,b,end'),('start,b,A,c,A,c,A,end'),('start,b,A,c,A,end'),('start,b,A,end'),('start,b,d,b,A,c,A,end'),('start,b,d,b,A,end'),('start,b,d,b,end'),('start,b,end')

        -- 19 paths
        --INSERT INTO #rawdata (Val) VALUES ('dc-end'),('HN-start'),('start-kj'),('dc-start'),('dc-HN'),('LN-dc'),('HN-end'),('kj-sa'),('kj-HN'),('kj-dc')

        -- 226 paths
        --INSERT INTO #rawdata (Val) VALUES ('fs-end'),('he-DX'),('fs-he'),('start-DX'),('pj-DX'),('end-zg'),('zg-sl'),('zg-pj'),('pj-he'),('RW-he'),('fs-DX'),('pj-RW'),('zg-RW'),('start-pj'),('he-WI'),('zg-he'),('pj-fs'),('start-RW')
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES ('um-end'),('pk-um'),('FE-il'),('ay-FE'),('pk-start'),('end-jt'),('um-FE'),('RO-il'),('xc-ay'),('il-end'),('start-EZ'),('pk-FE'),('xc-start'),('jt-FE'),('EZ-um'),('pk-xc'),('xc-EZ'),('pk-ay'),('il-ay'),('jt-EZ'),('jt-om'),('pk-EZ')
    END;

    IF OBJECT_ID('tempdb..#data','U') IS NOT NULL DROP TABLE #data; --SELECT * FROM #data
    CREATE TABLE #data (
        ID          int         NOT NULL IDENTITY,
        PathStart   varchar(5) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
        PathEnd     varchar(5) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    );

    INSERT INTO #data (PathStart, PathEnd)
    SELECT PathStart = LEFT(r.Val, CHARINDEX('-', r.Val)-1) 
        , PathEnd = SUBSTRING(r.Val, CHARINDEX('-', r.Val)+1, 20) 
    FROM #rawdata r

    -- Add reverse paths as well
    INSERT INTO #data (PathStart, PathEnd)
    SELECT d.PathEnd, d.PathStart
    FROM #data d

    -- Remove bad paths
    DELETE d
    FROM #data d
    WHERE d.PathEnd = 'start' OR d.PathStart = 'end'

    /*
        Should I remove paths that cannot be taken? Or can those be handled later with rules?
        For example, `a-b`. This connection cannot be used if it is the only path to `b` since it would
        require that you visit `a` twice.
        
        However, if other paths exist, then it is ok. For the sample this is easy to find.

        But what if we have `a-b-C-d`. Then it would appear to be ok. However, that path could be a dead
        end that ends at `d`, it now needs to walk back, which is an illegal move.

        I think the best course of action here is to rely on rules and elimination. A path that walks
        back on a small cave is an illegal path, and ends there. At the end, any paths that do not have
        an `end` are removed, leaving only complete paths.
    */
    ------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------
    /*
        Scratch notes / brainstorming:
        One way might be able to do it is with building and parsing strings
        For example...

        Insert the seed records along with their last value:
        'start-A', 'A'
        'start-b', 'b'

        Find all paths whose last value <> 'end'

        Join all links whose PathStart matches the last value to replace the old list, and append it to the path
        'start-A-c'     , 'c'
        'start-A-b'     , 'b'
        'start-A-end'   , 'end'
        'start-b-A'     , 'A'
        'start-b-d'     , 'd'
        'start-b-end'   , 'end'

        We should now have 6 rows with legal paths. Here, delete any previous paths that don't have an 'end' and insert all 6 rows.

        Rinse repeat...Find all paths whose last value <> 'end'. Join all links whose Start matches the last value to replace the old list:
        'start-A-c'     , 'c' -> 'A'
        'start-A-b'     , 'b' -> 'A','d','end'
        'start-b-A'     , 'A' -> 'b','c','end'
        'start-b-d'     , 'd' -> 'b'

        We now have 8 new paths to add. So we delete all previous paths that don't have an end, and insert these 8 paths.
        
        However, we now have a problem...a small cave has appeared twice (`start-b-d-b`)...how do we check for this at each round to identify illegal paths?

        It seems like this can be a simple check, just search the path for the current PathEnd, if it matches, then we skip that path,
        but we only perform the check for small caves.
        
        So maybe something like `IsLegal = IIF(x.Path LIKE '-' + x.PathEnd + '-' AND x.PathEnd = LOWER(x.PathEnd), 0, 1)`

        Here we can (update, ignore, delete?) illegal paths and move on to the next round.

        Rince repeat until there are no more legal paths that do not have an end.
    */

    /*
        Implementation:

        Based on the proposed solution above, it might be possible to do using a recursive CTE, but illegal paths might make that difficult.

        Going to use a loop instead, which should be straightforward to implement from the solution above.
    */
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#paths','U') IS NOT NULL DROP TABLE #paths; --SELECT * FROM #paths ORDER BY FullPath
    CREATE TABLE #paths (
        FullPath varchar(100) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
        LastCave varchar(10) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    )
    
    -- Seed records
    INSERT INTO #paths (FullPath, LastCave)
    SELECT CONCAT(d.PathStart,',',d.PathEnd), d.PathEnd
    FROM #data d
    WHERE d.PathStart = 'start'

    WHILE (1=1)
    BEGIN;
        /* I generally hate using MERGE because of all the issues with it. But in this particular scenario, it saves a few lines
           Using merge here allows me to perform an INSERT and a DELETE at the same time. Without the use of MERGE, you'd need to
           do it in a much more work around way */
        MERGE INTO #paths o
        USING (
            SELECT FullPath = CONCAT(p.FullPath,',',d.PathEnd), LastCave = d.PathEnd
            FROM #paths p
                JOIN #data d ON d.PathStart = p.LastCave
            WHERE p.LastCave <> 'end' -- Only add to paths without an end
                AND (
                    -- Large caves are unrestricted
                    d.PathEnd = UPPER(d.PathEnd)
                    -- New small caves are okay, but not existing ones
                    OR CHARINDEX(','+d.PathEnd+',', p.FullPath) = 0
                )
        ) n ON 1=0
        WHEN NOT MATCHED BY TARGET
        THEN INSERT (FullPath, LastCave) VALUES (n.FullPath, n.LastCave)
        WHEN NOT MATCHED BY SOURCE AND o.LastCave <> 'end'
        THEN DELETE;

        IF (@@ROWCOUNT = 0) BREAK;
    END;

    SELECT Answer = COUNT(*)
    FROM #paths p
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    /* 
        Part 2 is exactly the same as part 1, but the logic to identify legal paths has changed
        Now, instead of allowing a small cave to appear in the path once, we need to allow it to appear twice, but only for 1 cave.

        I think the easiest way to do this would be to use a cross apply function that splits the path using STRING_SPLIT
        Then it filters by small caves, and takes a group by count...GROUP BY cave HAVING COUNT(*) > 1
    */

    /*
        Well...it's slow, but it works. I think it's slow mostly because of the STRING_SPLIT logic. It's having to constantly
        split, and group the same paths over and over again. It's possible this could be sped up by making it more table based
        rather than manipulating strings, but it finishes within about a minute, so for now, it's good enough to get me the answer.
    */
    IF OBJECT_ID('tempdb..#paths','U') IS NOT NULL DROP TABLE #paths; --SELECT * FROM #paths ORDER BY FullPath
    CREATE TABLE #paths (
        FullPath varchar(100) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
        LastCave varchar(10) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
    )

    -- Seed records
    INSERT INTO #paths (FullPath, LastCave)
    SELECT CONCAT(d.PathStart,',',d.PathEnd), d.PathEnd
    FROM #data d
    WHERE d.PathStart = 'start'

    WHILE (1=1)
    BEGIN;
        /* I generally hate using MERGE because of all the issues with it. But in this particular scenario, it saves a few lines
           Using merge here allows me to perform an INSERT and a DELETE at the same time. Without the use of MERGE, you'd need to
           do it in a much more work around way */
        MERGE INTO #paths o
        USING (
            SELECT FullPath = CONCAT(p.FullPath,',',d.PathEnd), LastCave = d.PathEnd
            FROM #paths p
                JOIN #data d ON d.PathStart = p.LastCave
            WHERE p.LastCave <> 'end' -- Only add to paths without an end
                AND (
                    -- Large caves are unrestricted
                    d.PathEnd = UPPER(d.PathEnd)
                    -- Don't add new small caves if there are any that have been travelled to twice already
                    OR NOT EXISTS (SELECT * FROM STRING_SPLIT(p.FullPath, ',') x WHERE x.[value] = LOWER(x.[value]) GROUP BY x.[value] HAVING COUNT(*) >= 2)
                    -- Unless the current cave doesn't exist in the string, new small caves are ok
                    OR CHARINDEX(','+d.PathEnd+',', p.FullPath) = 0
                )
        ) n ON 1=0
        WHEN NOT MATCHED BY TARGET
        THEN INSERT (FullPath, LastCave) VALUES (n.FullPath, n.LastCave)
        WHEN NOT MATCHED BY SOURCE AND o.LastCave <> 'end'
        THEN DELETE;

        IF (@@ROWCOUNT = 0) BREAK;
    END;

    SELECT Answer = COUNT(*)
    FROM #paths p
------------------------------------------------------------------------------

------------------------------------------------------------------------------