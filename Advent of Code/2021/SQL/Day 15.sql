﻿SET NOCOUNT ON;
GO
------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int IDENTITY, Val varchar(500) NOT NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('1163751742'),('1381373672'),('2136511328'),('3694931569'),('7463417111'),('1319128137'),('1359912421'),('3125421639'),('1293138521'),('2311944581');
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('8656175343119439947311919179279377257689197682985752287249881788527977345924133329967132199899199876'),('4281288396984115627338957853913949146812568775798196289991176529889498798259196976277683981565984526'),('8169838335918963371547591999342191683995972519179929683978126291855319511168245582651697938949414963'),('9911589184911198759466719191189995157885898771177913669999436998997781742478168921196176418888127932'),('2332856729917591158935782911513226531793881992469468248251991718456991551657621249229316797949388969'),('6488738222981127824819626661531168733698299313631126969162927725778914183239351484699921454131481322'),('3456499223985116399353928681116846939429849384129296119943791119497551946593566977823982927391143399'),('9297612841849646148511299569971197927971682598351883892842936977227795411959211782251399118676896328'),('1685688918999598249622886442487951289969917848948815999749154287969297396481891239821819247914959943'),('2855192597719945162116189119381795158862162959133647579913886639586438893695967226719685616432291318'),
            ('3893139873964939791913261811173979825213968972939996181992593113695976322782892995939891783998623789'),('5964671772545917912328949994999514157618987654288269789931394913375316999489275494179994919117119365'),('3216339828898396212733674969295762442389789119366989996931919596282992864471192938639162947919972647'),('7879826444123912118829914949989194219763533694839431198212319893181151696157671388992581982743988967'),('7876122492176935838133394839673532581399474449569117478121989273123412313151952891988698552384251637'),('8786999269197821985731819155537259938991261919979365751539876866146174376911518943778479997131942722'),('7239919942299391891898171771589178983916281118889294494829292752139999754571391999826947791975394972'),('2727617215141959982544247383138498917281833932371546394891963994434638187617528821379728933335772342'),('6712949984729176138535147942577311588399869767114795759883948915177671474313191789814718292236422124'),('8689792116597916131779139899373471282726812338914773516383771158691551851991689929199689197212298649'),
            ('6228175894997691471313338136819712699979449476188196729899628851391971728199959981585798691881191415'),('9491157288112631922166642933446197292729817888649185515198768537925149995158353829229269894798938589'),('5199389142294542461535132814487861987422485947698739199748986652229272998164982399192268248929567161'),('6881119581991538187539159493621999896486112182779617795198955921614753699796171837819179999654231813'),('6996595113784151975521879415898217119639999975184518599369743127684295298268259495226623211591871888'),('1779949977648145993713949919359399998812143513534984334127763318649997689919849157137418761137512977'),('9223292971993981422528813498119387921238194638215641911218326517839287886478991147999899894724396962'),('7451983891767995938972123465939918261682281929689989464297789895588752221375859586787938391672994381'),('1579954176878141996516584483611183926131694919877929897576151469657864935819598781814826881644187861'),('8934595321937914584995177237653199951582515953621782173159453287575529819242531191989113518599339361'),
            ('3214791137819868237121897913928328682928239268681975567994149694512799167598489194267554981611157817'),('3161289322443822496458312797912957538349962328948955764669152944278622928929944477635195993465821714'),('3769985892295265479971729196428585411214871889139731131516448815999122871374996159138497416978598848'),('4926877381218811127939655759733739111889455359949289979523168797571871445191441719179859376969393872'),('7159871151274214979637977982939997337182139971896511115912187982698278842961545125121242636339621282'),('8423118867997391616931374681582965659184916625321536161483641999294114251928796446618889979683993218'),('6824788915976897879897933391998341399228914119912289149511515799142181679965255395897688149876629889'),('4794395837416911945432167619882718499181629123717219977896911277339851349162195299228963994667691947'),('1465122112768881153591399679274839985297692314947884169719151181986711822112796246416415955915718319'),('7114797833579933611249299912348294873921288555119486979959982462111791467394161781467316779796883775'),
            ('9767795467854144194712742294766968549329117618283754959873952489784997597669593796889571883816748771'),('1759974879458746414925558868197241214751687661841649999221178613679929261984417289292556869111324941'),('9557955429999672993612951916598187741611893112948813816999484953994151249931191942493691497559992158'),('1469791219499218437828194894539893191199115998162227659757698173867329816328599398544492677817272998'),('6696472832532492295279572315976884291727999732161858916985514872395367168971969865959582923387918951'),('9722652752119479169481198119314728131429449798379179119171791999189878174319864498112912224658495939'),('9581794449119116165418178711351481129242636919987948291451161695541253977174231393582734959682898495'),('4757727865924728111221629983989222587789999361791192917315287219922119718827676188689966872358484669'),('1982319969915242121935864989286462118395187369193933592791414764965279817872197863615512262358899223'),('1811379712999278717898361849316989959114612857179582117839285399618929182259624916911439331479239488'),
            ('1377519658968884779897799292198595917148591218821239614925192183128211371959295299959221257811239131'),('2627929612263297913663198357736594275199769318118546371628241929618769991214845296132728799271417791'),('7576972138942696587693261199467749912936563131454674591315468112333812659454789393699615918167338715'),('1778985995949591574849625759667137792111923771976687288498928179271746938986792658149697999719931492'),('1497174992519427759719169714342998311421419197412331399469329847692794191181111339933357161599799597'),('7158163932199423259572847121198873491117119999919996985599149129919588579223518511588378639685891315'),('6219361855573892912131718991998196749251949481814844299182119621344738991784149679694476483378729929'),('1398599388779918861183115593522489331874978727922373471991219247115944295163699192776967648639268659'),('8246143812623927544154898631717811662213981175534335932638718171969421398421692892399791789186618487'),('4457134139841167885881924949364884427839314973843366971997383189398399657998961185159781215111619878'),
            ('2889934549617841969369167119338852267887359654637229634658717722728239549585928482358431813296859898'),('9968328746979669249145999585143117898196251944175462877716129989773292878848966999379983436559934934'),('6493994193996595991299891992438695916166928199197254269991979292986895799985938128881229638182945947'),('7266928918675112795879219714929968471352931229592623394713393869269941181318972192169271548316892574'),('2174196776119149368951321419512925818641848291921584561885586189445194773817792112569311611884895234'),('5617593683181229369984148191819568774125471789395181874847932736429929334265516997661987796259692831'),('7882228973393795938729341656949619511272988446634311621871394678132831899299832311614174939261965429'),('1131881592984545192978449637151892697525357924197922698921549791127287595929496515499876251183628176'),('9922954913893559597663824459627321943979599969474976998899879429185892995511392872381956558981867119'),('5166385448694129439797196837181355547743133114829285275149516986685925813416161972979872853196155916'),
            ('3292899922794159291851551956738911971988929383861879921354871787791695284999126375594873179426338749'),('3971894752927483651131869717199971871964396958991799413921821198121691265888799954912311963139425236'),('5778565318498395151591219315499879273943817921588123199611531989674238272218198865913747444419629892'),('1148956123134785152496887782841669964225944272953163717879528194631986997718971481186872943816456591'),('5982998155291779554662769986899318991622943125199743569463317913185991442772122148595119965486877247'),('1592622221626611159996955945922614981222438358385913259412688295754161193293194979914999974739594393'),('1735995389872189896282749844299933869588931688619645726996959149185997128397635694766944945458588326'),('8969839951998899979864239155832982419271118982882915197745124695321464198748765361499779978719441246'),('6625484228731161195646227911299498172947526327866775111148173468799729895761595437743769876911891521'),('6742199381937628999297557371399872217983581247138899399239252389649491949578491998528132446741686888'),
            ('9212328164223895178547771855976415127193137191217188318191949238429129518281919843229126971963111111'),('8589368771155989697277997492471969978917117589192916193887975787949771588121551699971132275182798898'),('1321997349438946615383211392181979153964221243634922639112684529286794272849757186396714797832698913'),('5499455959999492339698359789213323519479768626457859213487938838995348379392231623595879353861382977'),('4612129999347379911982695394862437936254989311441326295994617191963497895691479282499959828989987571'),('3953949985681978999897341375236798381973326952579319464522624134872231113676167279146985521828793431'),('2547232255918288952326674861524529119719429148626615319818611241832868529862499874951986568635799957'),('2181959929952711246913363617991144311613441799129546223661433628933579819732979148127949974997119951'),('1369158892917379123998253242599392893199998853969933983592129813969821127281951849151627687114757833'),('9629699176294886577773394197932998769278865351155516385519239971147785457838922269188195227329168368'),
            ('1788912961677399663173822433232514884848179868666798987368382881226468481869127998236137881926332779'),('4811241997249159619241887142461943467819366815858371379792287198271563986876852729186927761281942192'),('2121993996798639492562961751217922319969898368461919218459919713413366292171628639922554153774327219'),('3489591127775295131639799492971117993637992434115331278511281997587996291111198123428588991837368589'),('1283798883941983912985615991541417994114453747887836936186431822993881123911799962749981389292178586'),('8392631553657936578372199916912973193995216848776811924799769959318889717919172521769363698292447429'),('9587697134368994212916856845984875416273418561198913859115983139967143891991617853289936814265113512'),('9111571922348271733199797953979536915998195916688317991255916216419817129423728913622269119972958686'),('9959599568987335314713638999897919449512991684446347789183915679567141547281548619496728636288445972'),('8391247911139217869276338998734496391173478717461631572924754792241695917352991662734191814376765142');
    END;

    IF OBJECT_ID('tempdb..#data','U') IS NOT NULL DROP TABLE #data; --SELECT * FROM #data
    CREATE TABLE #data (
        ID          int         NOT NULL PRIMARY KEY CLUSTERED,
        ColID       smallint    NOT NULL,
        RowID       smallint    NOT NULL,
        Val         smallint    NOT NULL,
        -- Neighbors
        nL          int             NULL,
        nR          int             NULL,
        nU          int             NULL,
        nD          int             NULL,
        -- Cost
        CostToEnd   int             NULL,
    );

    INSERT INTO #data (ID, ColID, RowID, Val)
    SELECT ID = CONVERT(int, CONCAT(r.ID-1, RIGHT(CONCAT('0000',x.ColID), 4)))
        , x.ColID, RowID = r.ID-1, x.Val
    FROM #rawdata r
        CROSS APPLY (
            SELECT ColID = ROW_NUMBER() OVER (ORDER BY 1/0)-1
                , Val = CONVERT(smallint, SUBSTRING(r.Val,  ROW_NUMBER() OVER (ORDER BY 1/0), 1))
            FROM STRING_SPLIT(REPLICATE(',',LEN(r.Val)-1),',') x
        ) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Reduce duplication, put solving logic into stored proc
------------------------------------------------------------------------------
GO
CREATE OR ALTER PROCEDURE #usp_FindCheapestPath
AS
BEGIN;
    ------------------------------------------------------------------------------
    -- Prep data
    ------------------------------------------------------------------------------
    WITH cte_data AS (
        SELECT d.nL, d.nR, d.nU, d.nD, d.CostToEnd
            , _nL = LAG(d.ID)  OVER (PARTITION BY d.RowID ORDER BY d.ColID)
            , _nR = LEAD(d.ID) OVER (PARTITION BY d.RowID ORDER BY d.ColID)
            , _nU = LAG(d.ID)  OVER (PARTITION BY d.ColID ORDER BY d.RowID)
            , _nD = LEAD(d.ID) OVER (PARTITION BY d.ColID ORDER BY d.RowID)
        FROM #data d
    )
    UPDATE d SET d.nL = d._nL, d.nR = d._nR, d.nU = d._nU, d.nD = d._nD
    FROM cte_data d;

    UPDATE #data SET CostToEnd = NULL;

    WITH cte_seed AS (SELECT TOP(1) * FROM #data ORDER BY ID DESC)
    UPDATE cte_seed SET CostToEnd = 0;

    WITH cte_seed AS (SELECT TOP(1) * FROM #data ORDER BY ID)
    UPDATE cte_seed SET CostToEnd = 0, Val = 0;
    ------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------
    -- Find all path costs
    ------------------------------------------------------------------------------
    DECLARE @MaxXY int;
    SELECT @MaxXY = MAX(RowID) FROM #data;

    DECLARE @rc int, @i int = 0;
    WHILE (1=1)
    BEGIN;
        UPDATE d2 SET d2.CostToEnd = c.NewCost -- SELECT *
        FROM #data d1
            CROSS APPLY (SELECT NewCost = d1.CostToEnd + d1.Val) c
            CROSS APPLY (VALUES (d1.nL),(d1.nR),(d1.nU),(d1.nD)) n(ID)
            JOIN #data d2 WITH(TABLOCKX) ON d2.ID = n.ID
        WHERE d1.CostToEnd IS NOT NULL
            AND (c.NewCost < d2.CostToEnd OR d2.CostToEnd IS NULL)
            AND d2.RowID + d2.ColID <> @MaxXY;
        SET @rc = @@ROWCOUNT;

        IF (@i % 10 = 0) RAISERROR('%4i - %6i',0,1,@i,@rc) WITH NOWAIT;
        IF (@rc = 0) BREAK;
        SET @i += 1;
    END;
    ------------------------------------------------------------------------------
    
    ------------------------------------------------------------------------------
    -- Return answer
    ------------------------------------------------------------------------------
    SELECT TOP(1) Answer = d0.Val + d1.Val + d2.Val + d1.CostToEnd + d2.CostToEnd
    FROM #data d0
        JOIN #data d1 ON d1.ID = d0.nL OR d1.ID = d0.nU
        JOIN #data d2 ON d2.ID = d0.nR OR d2.ID = d0.nD
    WHERE d0.RowID + d0.ColID = @MaxXY
    ORDER BY Answer;
END;
GO
-----------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    RAISERROR('Part 1',0,1) WITH NOWAIT;
    EXEC #usp_FindCheapestPath;
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    RAISERROR('Part 2',0,1) WITH NOWAIT;
    /*
        Warning, because this is exponentially larger than Part 1, it takes about 10 min to run.

        The mechanism that solves it is exactly the same as Part 1, no changes made, the only change made
        was to the source data by adding the new rows and columns.
    */
    DECLARE @Rows int, @Cols int;
    SELECT @Rows = MAX(d.RowID)+1, @Cols = MAX(d.ColID)+1 FROM #data d;

    INSERT INTO #data (ID, RowID, ColID, Val)
    SELECT z.ID, n.RowID, n.ColID, IIF(n.NewVal > 9, n.NewVal - 9, n.NewVal)
    FROM #data d
        CROSS APPLY (VALUES (0),(1),(2),(3),(4)) x(ColMultiplier)
        CROSS APPLY (VALUES (0),(1),(2),(3),(4)) y(RowMultiplier)
        CROSS APPLY (
            SELECT NewVal = d.Val + y.RowMultiplier + x.ColMultiplier
                ,  RowID = d.RowID + @Rows * y.RowMultiplier
                ,  ColID = d.ColID + @Cols * x.ColMultiplier
        ) n
        CROSS APPLY (SELECT ID = CONVERT(int, CONCAT(n.RowID, RIGHT(CONCAT('0000',n.ColID), 4)))) z
    WHERE NOT EXISTS (SELECT * FROM #data d2 WHERE d2.ID = z.ID);

    EXEC #usp_FindCheapestPath;
------------------------------------------------------------------------------

------------------------------------------------------------------------------