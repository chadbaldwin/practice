------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    DECLARE @template varchar(MAX);

    IF OBJECT_ID('tempdb..#rules_raw','U') IS NOT NULL DROP TABLE #rules_raw; --SELECT * FROM #rules_raw
    CREATE TABLE #rules_raw (ID int IDENTITY, [Rule] varchar(20) NOT NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        SET @template = 'NNCB';

        INSERT INTO #rules_raw ([Rule]) VALUES
            ('CH -> B'),('HH -> N'),('CB -> H'),('NH -> C'),('HB -> C'),('HC -> B'),('HN -> C'),('NN -> C'),('BH -> H'),('NC -> B'),
            ('NB -> B'),('BN -> B'),('BB -> N'),('BC -> B'),('CC -> N'),('CN -> C');
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        SET @template = 'PBVHVOCOCFFNBCNCCBHK';

        INSERT INTO #rules_raw ([Rule]) VALUES
            ('FV -> C'),('SS -> B'),('SC -> B'),('BP -> K'),('VP -> S'),('HK -> K'),('FS -> F'),('CC -> V'),('VB -> P'),('OP -> B'),
            ('FO -> N'),('FH -> O'),('VK -> N'),('PV -> S'),('HV -> O'),('PF -> F'),('HH -> F'),('NK -> S'),('NC -> S'),('FC -> H'),
            ('FK -> K'),('OO -> N'),('HP -> C'),('NN -> H'),('BB -> H'),('CN -> P'),('PS -> N'),('VF -> S'),('CB -> B'),('OH -> S'),
            ('CF -> C'),('OK -> P'),('CV -> V'),('CS -> H'),('KN -> B'),('OV -> S'),('HB -> C'),('OS -> V'),('PC -> B'),('CK -> S'),
            ('PP -> K'),('SN -> O'),('VV -> C'),('NS -> F'),('PN -> K'),('HS -> P'),('VO -> B'),('VC -> B'),('NV -> P'),('VS -> N'),
            ('FP -> F'),('HO -> S'),('KS -> O'),('BN -> F'),('VN -> P'),('OC -> K'),('SF -> P'),('PO -> P'),('SB -> O'),('FN -> F'),
            ('OF -> F'),('CP -> C'),('HC -> O'),('PH -> O'),('BC -> O'),('NO -> C'),('BH -> C'),('VH -> S'),('KK -> O'),('SV -> K'),
            ('KB -> K'),('BS -> S'),('HF -> B'),('NH -> S'),('PB -> N'),('HN -> K'),('SK -> B'),('FB -> F'),('KV -> S'),('BF -> S'),
            ('ON -> S'),('BV -> P'),('KC -> S'),('NB -> S'),('NP -> B'),('BK -> K'),('NF -> C'),('BO -> K'),('KF -> B'),('KH -> N'),
            ('SP -> O'),('CO -> S'),('KO -> V'),('SO -> B'),('CH -> C'),('KP -> C'),('FF -> K'),('PK -> F'),('OB -> H'),('SH -> C');
    END;
    ------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#rules_data','U') IS NOT NULL DROP TABLE #rules_data; --SELECT * FROM #rules_data
    CREATE TABLE #rules_data (
        Pair        char(2) NOT NULL PRIMARY KEY CLUSTERED,
        Val         char(1) NOT NULL,
        Occurrences bigint  NOT NULL DEFAULT(0),
    );

    INSERT INTO #rules_data (Pair, Val)
    SELECT x.Pair, x.Val
    FROM #rules_raw r
        CROSS APPLY (
            SELECT Pair = PARSENAME(REPLACE(r.[Rule], ' -> ', '.'), 2)
                , Val   = PARSENAME(REPLACE(r.[Rule], ' -> ', '.'), 1)
        ) x;
    ------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#tally','U') IS NOT NULL DROP TABLE #tally; --SELECT * FROM #tally
    CREATE TABLE #tally (
        num int NOT NULL PRIMARY KEY CLUSTERED
    );

    WITH c1 AS (SELECT x.x FROM (VALUES(1),(1),(1),(1),(1),(1),(1),(1),(1),(1)) x(x))
        , c2(x) AS (SELECT 1 FROM c1 x CROSS JOIN c1 y)
    INSERT INTO #tally (num)
    SELECT num = ROW_NUMBER() OVER (ORDER BY 1/0)
    FROM (SELECT rn = 1 FROM c2 x CROSS JOIN c2 y CROSS JOIN c2 z) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
    DECLARE @i int;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    DECLARE @work_template varchar(MAX) = @template;

    SET @i = 10;
    WHILE(@i >= 1)
    BEGIN;
        SELECT @work_template = STRING_AGG(COALESCE(LEFT(x.Pair, 1)+rd.Val, x.Pair), '') WITHIN GROUP (ORDER BY t.num)
        FROM #tally t 
            CROSS APPLY (SELECT Pair = SUBSTRING(@work_template, t.num, 2)) x
            LEFT JOIN #rules_data rd ON rd.Pair = x.Pair
        WHERE t.num <= LEN(@work_template)
        GROUP BY ();

        SET @i -= 1;
    END;

    SELECT Answer = MAX(x.ElementCount) - MIN(x.ElementCount)
    FROM (
        SELECT x.Element, ElementCount = COUNT_BIG(*)
        FROM #tally t 
            CROSS APPLY (SELECT Element = SUBSTRING(@work_template, t.num, 1)) x
        WHERE t.num <= LEN(@work_template)
        GROUP BY x.Element
    ) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    /*
        Brute force worked fine for Part 1, but it's not going to cut it for part two.
        If I we're to brute force Part 2, the final string would be nearly 21 trillion characters equaling 19 terabytes.

        Clearly there is a much more elegant solution to this. And my best guess is going to be similar to Day 06 - Lanternfish
        In that example, I brute forced it for part 1, then realized part 2 would need optimization.
        
        The fix was to group everything into buckets, don't store each fish, just store unique fish and their counts.
    */
    ------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------
    -- Seed the loop
    WITH cte_pairs AS (
        SELECT x.Pair, Occurrences = COUNT(*)
        FROM #tally t
            CROSS APPLY (SELECT Pair = SUBSTRING(@template, t.num, 2)) x
        WHERE t.num <= LEN(@template)-1
        GROUP BY x.Pair
    )
    UPDATE rd SET rd.Occurrences = p.Occurrences
    FROM #rules_data rd
        JOIN cte_pairs p ON p.Pair = rd.Pair;

    SET @i = 40;
    WHILE(@i >= 1)
    BEGIN;
        WITH cte_test AS (
            SELECT x.NewPair, Occurrences = SUM(rd.Occurrences)
            FROM #rules_data rd
                CROSS APPLY (VALUES (LEFT(rd.Pair, 1)+rd.Val),(rd.Val+RIGHT(rd.Pair, 1))) AS x(NewPair)
            GROUP BY x.NewPair
        )
        UPDATE rd SET rd.Occurrences = COALESCE(t.Occurrences, 0)
        FROM #rules_data rd
            LEFT JOIN cte_test t ON t.NewPair = rd.Pair;

        SET @i -= 1;
    END;

    -- Find the answer
    SELECT Answer = MAX(x.Occurrences) - MIN(x.Occurrences)
    FROM (
        SELECT x.Element, Occurrences = CEILING(SUM(rd.Occurrences) / 2.0)
        FROM #rules_data rd
            CROSS APPLY (VALUES (LEFT(rd.Pair, 1)),(RIGHT(rd.Pair, 1))) x(Element)
        GROUP BY x.Element
    ) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------