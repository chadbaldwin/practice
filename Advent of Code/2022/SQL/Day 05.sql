------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int IDENTITY, Val varchar(100) NOT NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('    [D]    '),('[N] [C]    '),('[Z] [M] [P]'),(' 1   2   3 '),(''),('move 1 from 2 to 1'),('move 3 from 1 to 3'),('move 2 from 2 to 1'),('move 1 from 1 to 2');
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('[Q] [J]                         [H]'),('[G] [S] [Q]     [Z]             [P]'),('[P] [F] [M]     [F]     [F]     [S]'),('[R] [R] [P] [F] [V]     [D]     [L]'),('[L] [W] [W] [D] [W] [S] [V]     [G]'),('[C] [H] [H] [T] [D] [L] [M] [B] [B]'),('[T] [Q] [B] [S] [L] [C] [B] [J] [N]'),('[F] [N] [F] [V] [Q] [Z] [Z] [T] [Q]'),(' 1   2   3   4   5   6   7   8   9 '),(''),('move 1 from 8 to 1'),('move 1 from 6 to 1'),('move 3 from 7 to 4'),('move 3 from 2 to 9'),('move 11 from 9 to 3'),('move 1 from 6 to 9'),('move 15 from 3 to 9'),('move 5 from 2 to 3'),('move 3 from 7 to 5'),('move 6 from 9 to 3'),('move 6 from 1 to 6'),('move 2 from 3 to 7'),('move 5 from 4 to 5'),('move 7 from 9 to 4'),('move 2 from 9 to 5'),('move 10 from 4 to 2'),('move 6 from 5 to 4'),('move 2 from 7 to 6'),('move 10 from 2 to 3'),('move 21 from 3 to 5'),('move 1 from 3 to 6'),('move 3 from 6 to 9'),('move 1 from 8 to 9'),('move 5 from 4 to 5'),('move 4 from 9 to 3'),('move 17 from 5 to 1'),('move 1 from 6 to 2'),('move 16 from 5 to 1'),('move 3 from 3 to 6'),('move 6 from 6 to 4'),('move 1 from 2 to 4'),('move 4 from 1 to 2'),('move 2 from 6 to 2'),('move 28 from 1 to 3'),('move 1 from 9 to 7'),('move 1 from 8 to 7'),('move 1 from 5 to 4'),('move 1 from 2 to 6'),('move 1 from 3 to 1'),('move 3 from 2 to 5'),('move 1 from 6 to 3'),('move 4 from 4 to 7'),('move 5 from 5 to 2'),('move 1 from 5 to 6'),('move 6 from 1 to 3'),('move 1 from 6 to 2'),('move 26 from 3 to 6'),('move 2 from 7 to 9'),('move 4 from 7 to 3'),('move 19 from 6 to 3'),('move 6 from 2 to 4'),('move 5 from 3 to 2'),('move 1 from 9 to 7'),('move 26 from 3 to 8'),('move 6 from 4 to 3'),('move 1 from 3 to 8'),('move 1 from 6 to 7'),('move 6 from 3 to 6'),('move 6 from 6 to 4'),('move 1 from 9 to 2'),('move 2 from 4 to 9'),('move 22 from 8 to 2'),('move 2 from 6 to 5'),('move 1 from 9 to 1'),('move 1 from 6 to 5'),('move 1 from 7 to 5'),('move 3 from 6 to 7'),('move 2 from 6 to 1'),('move 1 from 1 to 5'),('move 3 from 5 to 9'),('move 4 from 8 to 4'),('move 2 from 1 to 4'),('move 18 from 2 to 1'),('move 2 from 7 to 8'),('move 3 from 9 to 5'),('move 8 from 1 to 9'),('move 5 from 9 to 3'),('move 1 from 9 to 8'),('move 2 from 9 to 4'),('move 2 from 7 to 8'),('move 5 from 5 to 7'),('move 1 from 9 to 3'),('move 4 from 8 to 4'),('move 1 from 7 to 8'),('move 4 from 4 to 3'),('move 2 from 8 to 3'),('move 1 from 8 to 9'),('move 2 from 1 to 8'),('move 3 from 4 to 5'),('move 1 from 8 to 4'),
            ('move 1 from 9 to 3'),('move 1 from 8 to 5'),('move 8 from 1 to 8'),('move 11 from 2 to 9'),('move 12 from 3 to 5'),('move 1 from 3 to 9'),('move 1 from 8 to 5'),('move 11 from 9 to 3'),('move 4 from 5 to 9'),('move 3 from 8 to 7'),('move 3 from 7 to 8'),('move 1 from 5 to 8'),('move 7 from 4 to 3'),('move 1 from 4 to 5'),('move 1 from 2 to 8'),('move 3 from 7 to 6'),('move 3 from 4 to 8'),('move 1 from 7 to 9'),('move 2 from 4 to 7'),('move 5 from 8 to 1'),('move 3 from 6 to 5'),('move 2 from 4 to 2'),('move 1 from 9 to 4'),('move 1 from 8 to 6'),('move 1 from 2 to 9'),('move 1 from 8 to 5'),('move 3 from 8 to 4'),('move 3 from 4 to 2'),('move 4 from 3 to 9'),('move 17 from 5 to 9'),('move 9 from 9 to 6'),('move 1 from 9 to 3'),('move 5 from 6 to 3'),('move 3 from 6 to 3'),('move 8 from 9 to 5'),('move 2 from 8 to 5'),('move 1 from 4 to 8'),('move 1 from 5 to 3'),('move 1 from 8 to 5'),('move 3 from 2 to 6'),('move 3 from 1 to 4'),('move 7 from 5 to 1'),('move 1 from 2 to 6'),('move 13 from 3 to 6'),('move 2 from 7 to 8'),('move 13 from 6 to 5'),('move 3 from 5 to 7'),('move 6 from 5 to 6'),('move 1 from 7 to 6'),('move 2 from 7 to 3'),('move 1 from 6 to 8'),('move 13 from 3 to 5'),('move 9 from 5 to 9'),('move 7 from 5 to 7'),('move 17 from 9 to 2'),('move 3 from 4 to 7'),('move 9 from 2 to 9'),('move 10 from 9 to 3'),('move 8 from 7 to 8'),('move 2 from 5 to 3'),('move 4 from 2 to 6'),('move 11 from 3 to 9'),('move 9 from 6 to 5'),('move 5 from 9 to 8'),('move 1 from 3 to 1'),('move 3 from 9 to 1'),('move 2 from 5 to 2'),('move 1 from 7 to 9'),('move 2 from 9 to 4'),('move 2 from 9 to 8'),('move 13 from 1 to 8'),('move 3 from 8 to 5'),('move 27 from 8 to 1'),('move 10 from 5 to 9'),('move 1 from 7 to 2'),('move 2 from 4 to 3'),('move 10 from 9 to 6'),('move 1 from 8 to 7'),('move 15 from 1 to 9'),('move 13 from 9 to 5'),('move 15 from 5 to 7'),('move 5 from 1 to 3'),('move 8 from 7 to 1'),('move 7 from 7 to 1'),('move 16 from 1 to 8'),('move 4 from 3 to 9'),('move 4 from 1 to 7'),('move 4 from 9 to 6'),('move 5 from 2 to 7'),('move 15 from 8 to 6'),('move 1 from 9 to 1'),('move 3 from 3 to 4'),('move 1 from 9 to 7'),('move 1 from 2 to 7'),('move 1 from 2 to 7'),('move 1 from 8 to 1'),('move 3 from 4 to 8'),('move 3 from 8 to 1'),('move 8 from 6 to 8'),('move 7 from 1 to 4'),
            ('move 11 from 6 to 8'),('move 14 from 6 to 5'),('move 13 from 8 to 7'),('move 4 from 7 to 5'),('move 15 from 7 to 4'),('move 6 from 5 to 4'),('move 2 from 5 to 9'),('move 1 from 5 to 2'),('move 3 from 8 to 5'),('move 19 from 4 to 7'),('move 10 from 5 to 8'),('move 2 from 6 to 8'),('move 1 from 4 to 8'),('move 2 from 7 to 9'),('move 9 from 7 to 4'),('move 6 from 4 to 6'),('move 11 from 4 to 8'),('move 2 from 5 to 4'),('move 5 from 6 to 4'),('move 1 from 6 to 7'),('move 3 from 9 to 5'),('move 3 from 8 to 5'),('move 3 from 7 to 6'),('move 11 from 8 to 7'),('move 1 from 9 to 5'),('move 1 from 6 to 8'),('move 1 from 2 to 1'),('move 5 from 4 to 9'),('move 2 from 4 to 1'),('move 2 from 1 to 4'),('move 1 from 1 to 9'),('move 4 from 5 to 1'),('move 1 from 4 to 6'),('move 17 from 7 to 5'),('move 9 from 8 to 7'),('move 6 from 9 to 7'),('move 3 from 1 to 9'),('move 12 from 7 to 9'),('move 12 from 9 to 5'),('move 5 from 7 to 9'),('move 17 from 5 to 3'),('move 7 from 3 to 1'),('move 5 from 1 to 5'),('move 5 from 9 to 2'),('move 4 from 3 to 5'),('move 1 from 4 to 8'),('move 5 from 2 to 1'),('move 22 from 5 to 9'),('move 3 from 7 to 6'),('move 6 from 6 to 9'),('move 2 from 5 to 4'),('move 1 from 6 to 3'),('move 2 from 4 to 1'),('move 3 from 8 to 2'),('move 1 from 3 to 4'),('move 24 from 9 to 1'),('move 4 from 3 to 9'),('move 2 from 2 to 9'),('move 2 from 3 to 1'),('move 1 from 8 to 6'),('move 1 from 6 to 9'),('move 1 from 8 to 9'),('move 2 from 7 to 4'),('move 1 from 8 to 3'),('move 1 from 4 to 7'),('move 3 from 9 to 8'),('move 1 from 2 to 1'),('move 9 from 9 to 3'),('move 1 from 8 to 7'),('move 1 from 4 to 3'),('move 2 from 9 to 7'),('move 1 from 9 to 3'),('move 2 from 8 to 4'),('move 12 from 3 to 8'),('move 2 from 1 to 7'),('move 1 from 4 to 3'),('move 30 from 1 to 5'),('move 6 from 5 to 7'),('move 12 from 7 to 2'),('move 1 from 3 to 4'),('move 2 from 1 to 3'),('move 1 from 4 to 9'),('move 10 from 5 to 7'),('move 10 from 2 to 6'),('move 8 from 8 to 3'),('move 3 from 1 to 3'),('move 5 from 6 to 3'),('move 2 from 8 to 5'),('move 1 from 9 to 2'),('move 2 from 8 to 6'),('move 4 from 7 to 2'),('move 3 from 2 to 7'),('move 2 from 7 to 5'),('move 1 from 4 to 9'),('move 11 from 3 to 1'),('move 7 from 6 to 9'),('move 3 from 2 to 3'),('move 10 from 1 to 7'),('move 14 from 7 to 5'),('move 3 from 7 to 6'),
            ('move 5 from 9 to 7'),('move 29 from 5 to 7'),('move 6 from 3 to 9'),('move 2 from 9 to 7'),('move 15 from 7 to 5'),('move 11 from 5 to 6'),('move 5 from 9 to 5'),('move 10 from 5 to 8'),('move 1 from 2 to 4'),('move 1 from 8 to 2'),('move 2 from 4 to 3'),('move 2 from 5 to 9'),('move 8 from 8 to 9'),('move 11 from 9 to 3'),('move 1 from 1 to 8'),('move 18 from 7 to 3'),('move 1 from 9 to 3'),('move 28 from 3 to 5'),('move 12 from 6 to 7'),('move 1 from 2 to 9'),('move 15 from 7 to 2'),('move 1 from 8 to 1'),('move 10 from 2 to 9'),('move 10 from 5 to 3'),('move 2 from 2 to 3'),('move 18 from 3 to 4'),('move 6 from 9 to 4'),('move 1 from 1 to 7'),('move 1 from 6 to 4'),('move 1 from 8 to 2'),('move 1 from 9 to 4'),('move 2 from 9 to 4'),('move 19 from 4 to 3'),('move 1 from 7 to 9'),('move 1 from 9 to 7'),('move 1 from 6 to 8'),('move 3 from 2 to 8'),('move 2 from 9 to 5'),('move 15 from 3 to 1'),('move 7 from 5 to 1'),('move 3 from 4 to 9'),('move 1 from 7 to 2'),('move 3 from 3 to 1'),('move 6 from 5 to 2'),('move 3 from 3 to 9'),('move 4 from 9 to 2'),('move 5 from 5 to 3'),('move 1 from 3 to 5'),('move 3 from 5 to 7'),('move 3 from 8 to 5'),('move 1 from 7 to 5'),('move 4 from 5 to 1'),('move 4 from 4 to 2'),('move 2 from 7 to 8'),('move 12 from 1 to 6'),('move 1 from 8 to 6'),('move 6 from 2 to 3'),('move 9 from 3 to 8'),('move 1 from 3 to 4'),('move 3 from 6 to 1'),('move 2 from 9 to 2'),('move 1 from 4 to 5'),('move 2 from 8 to 3'),('move 10 from 2 to 1'),('move 2 from 4 to 7'),('move 12 from 1 to 4'),('move 1 from 5 to 1'),('move 7 from 4 to 9'),('move 2 from 3 to 2'),('move 6 from 9 to 2'),('move 1 from 9 to 1'),('move 1 from 7 to 8'),('move 5 from 6 to 7'),('move 3 from 6 to 1'),('move 6 from 2 to 3'),('move 2 from 4 to 3'),('move 1 from 6 to 8'),('move 1 from 6 to 7'),('move 8 from 3 to 9'),('move 2 from 4 to 5'),('move 3 from 2 to 4'),('move 10 from 8 to 2'),('move 22 from 1 to 9'),('move 9 from 2 to 4'),('move 1 from 1 to 3'),('move 1 from 3 to 2'),('move 3 from 2 to 4'),('move 2 from 7 to 1'),('move 14 from 4 to 2'),('move 2 from 1 to 8'),('move 2 from 4 to 5'),('move 4 from 7 to 8'),('move 24 from 9 to 6'),('move 3 from 5 to 9'),('move 1 from 9 to 8'),('move 1 from 5 to 2'),('move 1 from 6 to 7'),('move 6 from 9 to 1'),('move 1 from 7 to 3'),('move 5 from 8 to 6'),
            ('move 9 from 6 to 3'),('move 4 from 1 to 4'),('move 2 from 1 to 2'),('move 11 from 6 to 3'),('move 13 from 3 to 2'),('move 2 from 9 to 8'),('move 8 from 3 to 8'),('move 2 from 8 to 5'),('move 1 from 7 to 5'),('move 3 from 6 to 3'),('move 11 from 8 to 5'),('move 13 from 2 to 4'),('move 10 from 5 to 2'),('move 2 from 3 to 4'),('move 2 from 5 to 7'),('move 15 from 4 to 9'),('move 2 from 7 to 4'),('move 2 from 4 to 2'),('move 2 from 4 to 9'),('move 2 from 4 to 2'),('move 1 from 3 to 8'),('move 1 from 8 to 1'),('move 1 from 1 to 2'),('move 1 from 6 to 3'),('move 7 from 2 to 4'),('move 1 from 5 to 3'),('move 7 from 9 to 1'),('move 7 from 1 to 2'),('move 4 from 6 to 9'),('move 12 from 9 to 7'),('move 6 from 7 to 5'),('move 1 from 3 to 5'),('move 7 from 4 to 7'),('move 3 from 7 to 8'),('move 3 from 8 to 6'),('move 18 from 2 to 9'),('move 7 from 2 to 3'),('move 15 from 9 to 4'),('move 3 from 3 to 9'),('move 1 from 3 to 1'),('move 3 from 5 to 4'),('move 1 from 1 to 2'),('move 1 from 9 to 2'),('move 2 from 6 to 2'),('move 5 from 7 to 6'),('move 5 from 2 to 7'),('move 3 from 3 to 4'),('move 5 from 5 to 3'),('move 6 from 7 to 4'),('move 9 from 4 to 2'),('move 18 from 4 to 9'),('move 6 from 2 to 1'),('move 1 from 1 to 9'),('move 4 from 7 to 4'),('move 7 from 2 to 4'),('move 1 from 2 to 8'),('move 1 from 4 to 2'),('move 4 from 3 to 4'),('move 16 from 9 to 5'),('move 9 from 9 to 8'),('move 1 from 9 to 7'),('move 4 from 1 to 2'),('move 2 from 5 to 4'),('move 10 from 5 to 4'),('move 4 from 2 to 1'),('move 5 from 1 to 2'),('move 1 from 8 to 5'),('move 1 from 6 to 5'),('move 4 from 8 to 5'),('move 2 from 6 to 9'),('move 3 from 6 to 2'),('move 2 from 9 to 1'),('move 1 from 7 to 6'),('move 1 from 3 to 8'),('move 9 from 5 to 9'),('move 4 from 8 to 1'),('move 2 from 8 to 2'),('move 1 from 5 to 7'),('move 9 from 9 to 8'),('move 1 from 7 to 5'),('move 9 from 8 to 2'),('move 6 from 1 to 6'),('move 6 from 2 to 6'),('move 10 from 2 to 5'),('move 5 from 2 to 1'),('move 1 from 3 to 5'),('move 8 from 5 to 4'),('move 5 from 1 to 3'),('move 10 from 6 to 8'),('move 3 from 6 to 9'),('move 4 from 3 to 1'),('move 5 from 8 to 2'),('move 4 from 5 to 9'),('move 1 from 3 to 7'),('move 1 from 7 to 3'),('move 1 from 8 to 6'),('move 1 from 6 to 1'),('move 15 from 4 to 8'),('move 5 from 9 to 2'),('move 1 from 9 to 1'),
            ('move 1 from 1 to 3'),('move 6 from 4 to 8'),('move 12 from 8 to 7'),('move 1 from 3 to 5'),('move 3 from 1 to 9'),('move 13 from 4 to 9'),('move 5 from 7 to 2'),('move 1 from 5 to 4'),('move 8 from 9 to 5'),('move 6 from 2 to 5'),('move 2 from 5 to 6');
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Notes
------------------------------------------------------------------------------
/*
    First thought was to break it down into a vertical based table. The problem with that is we will
    end up with quite a bit of looping and difficult to manage logic.

    Another method may be to use string manipulation, but first we'll need to pivot the stacks.

    So intead of them being vertical stacks, we want horizontal stacks.

    Then each operation would use RIGHT(x.StackString, x.MoveCount) and then somehow update both the source and target stacks with the new values.

    To "simplify" it, we could generate columns dynamically so that each column represents a stack. Then we are only working with a single
    row of data and we loop through the instructions.

    Basically what we're trying to do here is an iterative push/pop system...and SQL isn't really a good platform for that.

    All of the methods described could "easily" be implemented, but my goal is to try and build it using a single query, no looping
    and set logic. But we may need to break that rule for this one as I don't see a way to do it using a tally table.

    We may be able to do it using a recursive CTE, but again, we need some way to get the data into a dynamic set of columns.
*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Parse raw input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #stacks; --SELECT * FROM #stacks
    SELECT x.Stack
        , Items1 = STRING_AGG(x.Item, '') WITHIN GROUP (ORDER BY x.ID DESC)
        , Items2 = STRING_AGG(x.Item, '') WITHIN GROUP (ORDER BY x.ID DESC)
    INTO #stacks
    FROM (
        SELECT d.ID, Item = y.[value], Stack = y.ordinal
        FROM #rawdata d
            CROSS APPLY (SELECT Val = REPLACE(REPLACE(REPLACE(REPLACE(d.Val,'[',''),']',''),'    ',' '),' ',',')) x
            CROSS APPLY STRING_SPLIT(x.Val,',',1) y
        WHERE CHARINDEX('[', d.Val) > 0
    ) x
    GROUP BY x.Stack

    DROP TABLE IF EXISTS #instructions; --SELECT * FROM #instructions
    SELECT ID = ROW_NUMBER() OVER (ORDER BY d.ID) --Reset numbering to 1
        , MoveCount = PARSENAME(x.Val, 3)
        , FromStack = PARSENAME(x.Val, 2)
        , ToStack   = PARSENAME(x.Val, 1)
    INTO #instructions
    FROM #rawdata d
        CROSS APPLY (SELECT Val = REPLACE(REPLACE(REPLACE(d.Val,'move ',''),' from ','.'),' to ','.')) x
    WHERE d.Val LIKE 'move %'
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    /*
        Our instructions give us the Stacks that are affected, but we still don't have access to the other
        rows data unless we use some sort of windowing function.

        The main issue with trying to do this using a vertical table is maintaining order as things are moved
        to and from the stacks. If you move two items from one stack to another, you're now affecting 4 rows
        and the items need to be placed in the proper order.

        There may also be the possibility of a stack resulting in a higher height than that of the original input
        data, which means there is no row to move to, and would need to be inserted.

        If we go with inserting rows, then we are forced to use a WHILE loop and relying on an identity to maintain
        the order of the stack items.

        I think the easiest method is to just pivot the stacks into horizontal stirngs and then chop and move
        as needed. This allows each operation to only affect 2 rows at a time.

        Another option may be to use the JSON capabilities in SQL. This would allow us to refer to things by an
        array id and then udpate the strings that way?
    */

    /*
        Giving up to just go with iteration/looping so what we can move on from this one. I don't see any way
        to solve this one using set logic.
    */
    SET NOCOUNT ON;

    DECLARE @Count int, @From int, @To int, @Items1 varchar(100), @Items2 varchar(100);
    
    DECLARE instruction CURSOR FAST_FORWARD READ_ONLY
        FOR SELECT MoveCount, FromStack, ToStack
            FROM #instructions
            ORDER BY ID
    
    OPEN instruction
    
    FETCH NEXT FROM instruction INTO @Count, @From, @To;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE s SET  s.Items1 = LEFT(s.Items1, LEN(s.Items1) - @Count)
                    , s.Items2 = LEFT(s.Items2, LEN(s.Items2) - @Count)
                    , @Items1 = RIGHT(s.Items1, @Count)
                    , @Items2 = RIGHT(s.Items2, @Count)
        FROM #stacks s
        WHERE s.Stack = @From

        UPDATE s SET  s.Items1 += REVERSE(@Items1)
                    , s.Items2 += @Items2
        FROM #stacks s
        WHERE s.Stack = @To

        FETCH NEXT FROM instruction INTO @Count, @From, @To;
    END
    
    CLOSE instruction
    DEALLOCATE instruction
    ------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------
    SELECT Answer = STRING_AGG(RIGHT(s.Items1, 1), '') WITHIN GROUP (ORDER BY s.Stack)
    FROM #stacks s
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    SELECT Answer = STRING_AGG(RIGHT(s.Items2, 1), '') WITHIN GROUP (ORDER BY s.Stack)
    FROM #stacks s
------------------------------------------------------------------------------

------------------------------------------------------------------------------
