------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #rawdata; --SELECT * FROM #rawdata
    DECLARE @rawdata nvarchar(MAX);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        SET @rawdata = 'mjqjpqmgbljsphdztnvjfqwrcgsmlb';
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        SET @rawdata = 'cdhccdbdggfjjgssjzjzggjnjpnpbbzbnzzflfjfnfrrpvrvbrvvrvggvlvnnbrnrcncsnndbndbnndbdndfdrdvrvvndvvbggnrrnbrnntffgttwzwnnmvmcvvhsstzzlnlwlttbzzpnpmnnjvjnntmnmfftwwrfwrwswmmfrrfrrgbrbffwvvshvhrhmhththbbmqbmqqlslhssrmmqdmmjtmtmjtmjtttnwnvwvqwqjjnbbbdbqbnbpnbnllglcglcgcdczdznnqhhfthtmtlldqlqrrmddrldlzdllvddjcddqfqbqsbqqnllwppqpq'
                     + 'zzrbbdppzsppjdpdqpdqdfqfrrwbwrwwqcqcsqsvvpbvbbztzptzzpccdtdhdffvqvcvzzmwzwddjfdffplplqlvlmmmvggpmpvpddpbptplpvlplvpvvnrvnnbqqqjhhwfhwfhwhqhmmpphqpqvppfzpzjzddgzzwffjmjggwhwwnnmlmpmmhcmcpcrcddvzvpzzwnznfznffgdgvddvtvgvsvdsdbbjnjtntbnttgbbbvgvgrgrzrvzrzddlsddcndcnnfqnnmpmlppdlplzplzpzgzmzmddlvlnnbttbwwhbhdhfdfssjppmcpplpddd'
                     + 'npdnnljlwjljsjnjhnhvhvqqsffrbbdttjdjndjdwwsfspffnhfhhlvhvmmqjmmwzwszwwvdvpdvdbdtdsdtsshvvmtvmtmctclchccrllznzfffpjjvhhdmhhvphpghgsgmmhlhnlnmnlnslnlgngznnsqnqddllpwllmzmjmttptfpplglqlgglgqqptqqmvmtmjmddcchbblltslsvsmvmgghmmccnzcztczzmnmttrdrvvcvzvvzllbhllnldndbbqffbbgtgddbtdbbzttdptpccjnjppbllbzlblrlcllhrrhqhgqqbcqcvcdvvnn'
                     + 'zfzvzttrptrrwmrmlrlddvttdbtdbdcdvccwlcwwhphmppwfppclpcllgqgnghhvfflfggrzrcchfhhrdhrdhdnhnmmhjjwqjjpmmwvmmdnmnzzqmqwwmtthtdhtthnnqhqdhqqndqqwffsbspbptpmmndnllsmmdhmhfhnhjhghshlslppbgpgngddlsljsjmmzqzhhswhssfzssfqqcmqcmqcmmqggjcjvvgssrccwddmpmwwdfdpdbdpdwdvvqfvfrvvvsbvbhvvmqqcjqqvzqzppncnhhqnnpgplpqqpjpbblpbbbshsthhvfhfmmqz'
                     + 'mmznnvrvqrrwdrdlrlwlttzqttjvttqltqqnfqqqwjqwwqttfstftjffsqqnhhnsnqqhggbsgghfgglslmssqlqhlhthqhccdsspsnssshbbnmngnnhllwclcffqllsrszrssnqsqvqjvjcvcttqgqbqmmfqfsqfsqswwvcvffndnfdfvfcvvggsmsfmfwfpfwwzhznntgtlglmmlfmllwrlrwwhcchqchhznzjjcdjdbjjhcjcscwwlnnsgngqqtgqgngnwgnnhqnnhchmchhtchcnclcmccgffbmmzvvrnngwwvddzccnjntjtwjwwztw'
                     + 'tmtddjddpsptpbpbvvbwwnlnmndmnmdnnclnnbsbddpfdfvvjtjqqtqqqzjzlzqllzzwwlppvfffpcffffprrncnnzsnznhhwvvqhqphpjjgqqvnnmdmqqglqlblgglrlsspscsjjpvpbpjjwccslsppdjpdjjwvjjmhjhtjjwqqbqjqzjqzqpqbbswwlssqzssbjjpjqjbbjcjpjspjssjjzhhhnjhnhbnhhwzhzwlcshqlqpzgggzmcwntcwmfgtrwwjdpnbdqqcgnzgbdrzdmpwgvtvqffqbpvjpjrcfswffllnvnwvhclpjcwqwgnwq'
                     + 'wvwsfgflrgzzsswffwjdjgvdvlgmczcbthwbvhggwzwlzfmhvwvjpbpnhcczbgfhhgghsmjwnvnsvnvmqwstrgnncwbqgbqpgdngllcqnzgwswpgtwzgqzggnzsdgltrlqfctqfvlzdswccfpdtjbfnrbqsmpjclnplbmqbmvwbzzdflwbqrljvzjpcrmnqsmrpqlmfsgcmthqpwgwzvmrjnhqczljcpnzjbwzrhjrzmcqpmlbzhgmqrlzsjbjsvcmcngptzlrthwsrjrlmsrgjlzrvpzwmprwnpgvjtspsppfvwfwcvbnqcwwmzlbqthqm'
                     + 'bnbmnsnzgsbbnqtrvhlzjhphclpjzrdblszrnftqgwwrhpznhjhgrncvsvrmtmmgssvzddjfrnrzhbrqrfffjvzrqdnrdbvjwgrvlcpbncfgczlwdggsjmwzhndcdbggjvwfljctjnsjwczwfdrfttbhnlswfdbpcnwpspdhnzwqbgdswwpccbpfpgmfmvvwpzbzqsbbjbfnhjpszcbnrdplmwtdjtpcsztdjcmczltnstzwlcdbtdhsdgsgtlvdfqggfmmrppjfrmtfwhpbjsppszjbhmthndqmvbmqcbtqsltwrcvlvblwspbgspjftwl'
                     + 'lzcmnsrvjpnstzrfmcflnhppsdfggwbzvnvlnjqlfvrlplnzvfrwvgcgqvnpfgtgchctvhcplclzmfpwgnfhqjgglfmsgpflqcpqmbbhwnvvdllcnhblpnndbdtmgvfbvvvlvzlrpfqmnvzbfrssjtlgcjtpfznshvdjrjnfshfcgvwcdbqlfsbhnzwmsgwhpbzttgfjsqgwvdmbdwjljhsndrbbzfrsqjhcbldzqpmtnfvnmzltjcrvrltwshnhqlnclmcnfpbzstsczlqmfmdftzfbcwqnhqppzfbzpbfjhmmtvtbmblmtshsbtjlvsqv'
                     + 'mbmgstbbdmhprqmtpfdqqntmnlbmpsmwfgrvstjcllhwpcddnljdjvdrbwqmgrjnldpgnrhgqpzqrvwzsngrgnbpjnsffzjsbdptwnnfcqlscfhvggpfstsnqzcjbqqhgdpqsrlprcppgqmddpqpbnvgwtdqsbbgtvsqfrtqfsbdzhsztfmvwrrsjcbtcjgzrnhnpgldtwbwgmwbgmjjzsbbzlhgmlczrhjwtzrgwscmjvlstprldhglvftqzbtrmcwzgtjppbnjcdvjvcwvdbngnbrmjvvtnwdqfclbpgzcfnnnlnngtgmhsqsdmbjctjz'
                     + 'jpbrwrhscqshmmwbtfnzjgsrjlnqqdsvdrjdzsdprphnfmwwcztqfcrjvnfhlvnqwbrfmcvhrbtgvcrqjjfcnzwmlfzzdcbbzvphhmsdltwjfdcgthpvszqzjdbfwrpvhbjqdhrscnvjhjvvcldnhgjclmzpbrrwnscgpcqrpdgsnjnwhctcdqgwqbrcszfzpmtdrhlftvwffdjrtznqrppqbdbwvzmtlpvsqqpcngjgfdrpngnspdwhhvlhqrtsphgqrlldggtrvqsprbfdmrpgcmqphdvjfmhlznpgtqlvtnllcdhzhhtjjlfvdlwhcrf'
                     + 'mjmdjtmbllvsfgvmfqtqlmrlrjmqptszvjdpzhphppljnpjdjpwlrclssgdnstchhwhpflmlrtdqvqbbljrmnflrltzpqmgqfrczvfzrpfsrwsgpljvjfjdjdvjchcdmmtjgghqspwzdtwqgtvmnrrbfbgnhcrvnzznrdlqmgmdwmpwzlqdjtvpszwnjtjtmjqvfwvftlhgpvgzswpbvbllfcwpjnsmbhzrdpdzjsrpnhphdcqjmzvvhrjcwhgwjwcshqwzpbpmfnjjvqcjrqmvsrdrtdvfhwhrbpvrqrsfzflslqtdrtcsggtzmpvbszdg'
                     + 'ttlvpwwltvpcwqmnwqtpcfzgsvsmncvpqqdrljfwtncplmjlpfcnqmcctwzhrbmrfwvsrjsbnhjrjmrnbmmnnhsvlltwzzhsgwppnlmljgpcsmpchdjdzpgvrtwsfzffhnlbfmrldzbshvpqhnfzpwnvczgfvhbntcpztwqlfgtsmdhvcrgjhvqrhbpvbpzcpbgzrcfjztbnfjptbzfpztwprwf';
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------

------------------------------------------------------------------------------
    DECLARE @markersize int;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    SET @markersize = 4;
    SELECT TOP(1) Answer = t.[value] + @markersize - 1
    FROM GENERATE_SERIES(1,1000000) t
        CROSS APPLY (SELECT Val = SUBSTRING(@rawdata, t.[value], @markersize)) x
        OUTER APPLY (
            SELECT z.Val
            FROM GENERATE_SERIES(1,@markersize) y
                CROSS APPLY (SELECT Val = SUBSTRING(x.Val, y.[value], 1)) z
            GROUP BY z.Val
            HAVING COUNT(*) > 1
        ) y
    WHERE x.Val <> ''
        AND y.Val IS NULL
    ORDER BY t.[value]
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    -- Copy paste of Part 1, just needed to adjust the packet market size
    SET @markersize = 14;
    SELECT TOP(1) Answer = t.[value] + @markersize - 1
    FROM GENERATE_SERIES(1,1000000) t
        CROSS APPLY (SELECT Val = SUBSTRING(@rawdata, t.[value], @markersize)) x
        OUTER APPLY (
            SELECT z.Val
            FROM GENERATE_SERIES(1,@markersize) y
                CROSS APPLY (SELECT Val = SUBSTRING(x.Val, y.[value], 1)) z
            GROUP BY z.Val
            HAVING COUNT(*) > 1
        ) y
    WHERE x.Val <> ''
        AND y.Val IS NULL
    ORDER BY t.[value]
------------------------------------------------------------------------------

------------------------------------------------------------------------------
