------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int, Val varchar(100) NOT NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
		INSERT INTO #rawdata (ID, Val) VALUES (1,'30373'),(2,'25512'),(3,'65332'),(4,'33549'),(5,'35390')
	END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
		INSERT INTO #rawdata (ID, Val) VALUES (1,'222322213033345255533423306545562424165440655115256171674620442636621123532003623343351021112300040'),(2,'110200134424131544435511513034235114207220346712122743100173142606016164253614600344452542043234001'),(3,'130241122341034230060506400411050451436457131115555076655121366640166143420114243260041315245140033'),(4,'044201155341204150154421223651421072455456424262034065175730703125367662022422056423113110423033043'),(5,'341242043015141323013444355403421162464354167412604633147554242145501111651130260045523542142405124'),(6,'104105335542011255154624541673170452421201174751065233125053535203606402110631631303264231443334523'),(7,'022251232401442443240604013073567051751261046006060310057162723056356047312301014332262320405344224'),(8,'005045010303234050011604134516553223421500156708426287011206217044163376565240420066564035322425031'),(9,'433400302252163605112001002152533254526577025774185772532522645162112005222006334211222615202150023'),(10,'514421532420126245053363421750507267400406222575606338538284336516406721212651434025136363121253314')
		INSERT INTO #rawdata (ID, Val) VALUES (11,'145500111514555142462447264776571468434327564631361615475570716477174343523375640422633224154214330'),(12,'450422253465464405163267335560338812657620448402661157163042574016476542116027110002556401004144041'),(13,'315250435323412100266435752414460614818523238015312045767348145251346503446110002404643412031033110'),(14,'335554260614516260275514014501773808684115234652573523444781127146772327147027164546041361322264113'),(15,'552212024666234517403145053462886425015423537515312180012163268455035077313422213613314122403623422'),(16,'554116462330326333717726071743410713076038127356572547895446465004382875747801510560161030046236534'),(17,'105512113261674505476760210308840028176731611387575863387841328453867641286570312570624613101433450'),(18,'201620055416403673411402684861111672134437556816818962692824522386258176417471541216750515352320263'),(19,'100064152502471121126620147804267474177133917793419871348867649139837456117360472552512240365464543'),(20,'434125501030234366461354647212882961264276372277577656415297827484543874788435871670574372006541656')
		INSERT INTO #rawdata (ID, Val) VALUES (21,'354231632241763433421115602887827646148345796776349994375746935256394267608007744846602344220506426'),(22,'320055542235452511286776246551436249838211357522914296165427513242286591157867047217062671166212220'),(23,'630533311432024274286282747578525892839185272964722232382686773975896514921876068064231003115130640'),(24,'054351445323650230374860016787334957865672953893647532392634515193476444753234751431776670673443625'),(25,'122161643553043361465661234215425777375428328842756826885237348622679574815841302214422454334622455'),(26,'310361643547534388254741787957515835394388424384634948237897787328779899668951118145613227272341123'),(27,'553203043313014483116602739588328966436465926583287463393949837268357287783771610187112515346661056'),(28,'361112773030626240167311193287631239264325599932928434546936456455966294955629721437363071113555100'),(29,'223116444062065127823414995768335224963787626949338374537976548374532595386885887817322311512135354'),(30,'165533456256685465133638322212456677839479985883969576788652889447966945526287513125252251227266360')
		INSERT INTO #rawdata (ID, Val) VALUES (31,'050427105764654780569971719539982722683736488643647867988885285677254929533615456260111805471544762'),(32,'612564200420147420768231643572583337363778975687346456978779493453467879471982875321111751612056704'),(33,'154715031561015145153929571787325853755436888933888338496548994492842954225615713257348715562770051'),(34,'042706406641878154761493925944579827297695668447479695968796749364665547438536956376866503052450261'),(35,'111103621158778860687333696596964667768654674764978799646936368489433243322422814121081720104310375'),(36,'256106134082036385674358835842774753667963458466356667369999749769462758256568366264544861030650514'),(37,'412372400235780556155749924663448584664436986744984487994753564686643982758245295828805442657020150'),(38,'316402420685442228837832744963276587378457659649458546869353576749393683736838444639170007152747441'),(39,'343664452531110164851537867349623666557879764884856546986489797534353938689749649842383748067621444'),(40,'004444326256452015911854963372679986857738459895764946977798848396957278774226377383181551011246332')
		INSERT INTO #rawdata (ID, Val) VALUES (41,'324213275444575144439872496886847394968576968689979497664689986774356463883323582931740408774664723'),(42,'167274127524542565635816457474433733785665667989859545577574597555588393452438866921746374545730347'),(43,'312523103467383946589439238265777486435445747964954446957896799994745579737227145455742444466763354'),(44,'042101230038108485461717949225836749699798599445858954785786668636987937236256346361252208168136312'),(45,'447311762287744692475573737395565466544999496459956989976897778946499374824747773197595161266172226'),(46,'371671376376358926187663595697867739555794587855655786889854499686796363666939989643254552166201754'),(47,'305514713774776948141752365256767736786987588655596589796495868756859657723267975757697551713050730'),(48,'505672367783107579727693596546487757757799568755578685859899884563658799498726941257953878711714017'),(49,'457520154136801497456138426564536866785654498777579675857476597474753988679778543462582232418154231'),(50,'050570576377124118562748278969974597659546757999795788577798949457569458597349739399679324147816176')
		INSERT INTO #rawdata (ID, Val) VALUES (51,'064032506374261599382993468784374444687579995969557585785777758755334674823733669516557164016427124'),(52,'346565566106489839877287435227877647875697657779798687889989777455747976752522588271842557284604304'),(53,'320630184267887846149779595575797453867985966985895787576699496556963977669453525683498188461017663'),(54,'155470636481748966932554775295985386984477788779777769886686888674939686949557211549684318562843364'),(55,'355422032736165249425585822655654853976657576675655856568867858693534395443986997713966364825241516'),(56,'014307615355116598362643769888978393745848466775686878856446548776874844332797955528420388441472072'),(57,'434677415171655145937867232795798374659889895676897986696777754584999873398343952258322518308312370'),(58,'614462625176544968398772979677993886597595888444699849445968855456666794598363878647397472370611124'),(59,'342426038105820512291673236242588648634466744646845777477557645589764482986857645122398666420720742'),(60,'303446222610437533389493227477389695959868644577787974876888684975836425953723362621837202318302515')
		INSERT INTO #rawdata (ID, Val) VALUES (61,'101334031274541867475755424764549646588488959767847459756867963388465874367294735519312864601156672'),(62,'311162646802122687272848655359448638774475595989694889897479694563583798875942767189780830474311553'),(63,'670525052313105734222877229995545497896735689799858955459867784679684938565425586596166033035473164'),(64,'625002126405824409197545328243248943664786877896564684896757759666544465836966863943043883874535107'),(65,'304504507410725215339562444778866968394554865956559998446945777964348595952748915112623570510705144'),(66,'447671532535258771129625534992686968475466769559485845995386695599378847572918425825332176641466062'),(67,'022123400381035622672492659655854245887594385374756573547685957733982636227675215225616456802746606'),(68,'143231134353837650051751146983252488977634698367786398395985875992826958228379769214124442703715262'),(69,'135170610171160182526139534726928582959959837673658879565485535346824864319872955144130017452466064'),(70,'102646524660025304032183156274795333553888848798733487439766887562335538983732625811202053035706412')
		INSERT INTO #rawdata (ID, Val) VALUES (71,'105313211023023674376715267861525696823925879646687867997695888347896781494452164804031634615425042'),(72,'256205106513734680231582333362957987973927998375834773457684994689349817858524813244430142704015520'),(73,'021404347726028733646641268434424287525532769279452643745555528837589599615841240070086220361652546'),(74,'224024214320367157758819746327682985953929797339659337579259325447482167689237531580534124157434533'),(75,'432614136036164731080370551893833148799729789672732794952993828437433612152513202747342230044776363'),(76,'314003554513122735473322134512738781597463362529856243299295546734985494922406881657630707442021510'),(77,'514504073756450312710340856355119778239528232648473554453443349559599228483527304806846455610024545'),(78,'424156167665132531871223763346631626522767446256444526857773846279396461782420177025261412610600431'),(79,'440544203354025350033001226782826234581598745799586998494951719551921447963680834604761003456033433'),(80,'030261134056327505538138763401733512835785873969133667323138843188738957384853306401550446745105426')
		INSERT INTO #rawdata (ID, Val) VALUES (81,'524041041607103210643621736677777415881386586134322795167285489925353353273682055677320161701632002'),(82,'532513043015722226170325461521708421659348265984277116386737884679183833325305770247107056515000632'),(83,'450631113064541102213228045638208741315429696459599317816954821479256672633762880514531576001505104'),(84,'214165164302237003505054233882824157688219632493411326562973319962407073638136757124756516600661503'),(85,'304465104303261562212345808766401574871933592693641614758134144886301815682807153126027453244204015'),(86,'135203445204521251600013125103586202465438696331861292616228156657585723603452536740112103314030555'),(87,'514516400551406327564011243567833388064737417461387480870726483204868682076024701011125332602254113'),(88,'421341053633214625706123464303687686511262673301412775315212752511877023033424215721261615303053012'),(89,'022044105062611536144720566574153723272833357078078000286705430350220142407371067103103416226230555'),(90,'410213236064223263635201443404636873030520630316216081306535811175741246467466645353201136163050545')
		INSERT INTO #rawdata (ID, Val) VALUES (91,'303520211553166661506232367472736401455544832872162057805076267517121166516261355403030034621243454'),(92,'203254222143353045650002244735005340271145025041572764542706827413452562704066262265323455430133504'),(93,'441232355335366123446141420412727113134404853821274587121188823260264625415453362560311464455210441'),(94,'414115054424201303442043777071262633223473236654360080370734624214365605172654033011620153152523134'),(95,'412115334452334460565220356727405160520263276133202400177553665136056247040612461135000421154322204'),(96,'041335455114425155032554320512112112454416721273507036712353407602170012763156424133043141034050241'),(97,'030023102524414043125455041405115606664661260240725146305660271437703406461522205621551001134541002'),(98,'404443532404034526430106366644217325436253634242603222554235163606432511155652343363021250505540430'),(99,'324114252001344342204144440320420641222766650735522654115551234652234245431600152550532022520100132')
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Parse raw input data
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#data','U') IS NOT NULL DROP TABLE #data; --SELECT * FROM #data
    CREATE TABLE #data (
        ID          int NOT NULL PRIMARY KEY CLUSTERED,
        RowID       int NOT NULL,
        ColID       int NOT NULL,
        Val         int NOT NULL,
    );

	WITH cte AS (
		SELECT ID = ROW_NUMBER() OVER (ORDER BY r.ID, x.ColID) 
			, RowID = r.ID, x.ColID, x.Val
		FROM #rawdata r
			CROSS APPLY (
				SELECT ColID = n.ID, Val = CONVERT(int, NULLIF(SUBSTRING(r.Val, n.ID  , 1),''))
				FROM dbo.Numbers n
				WHERE n.ID BETWEEN 1 AND LEN(r.Val)
			) x
	)
	INSERT INTO #data (ID, RowID, ColID, Val)
	SELECT c.ID, c.RowID, c.ColID, c.Val
	FROM cte c
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
	SELECT Answer = COUNT(*)
	FROM #data v
	WHERE  NOT EXISTS (SELECT * FROM #data r WHERE r.RowID < v.RowID AND r.ColID = v.ColID AND r.Val >= v.Val) -- Up
		OR NOT EXISTS (SELECT * FROM #data r WHERE r.RowID > v.RowID AND r.ColID = v.ColID AND r.Val >= v.Val) -- Down
		OR NOT EXISTS (SELECT * FROM #data r WHERE r.RowID = v.RowID AND r.ColID < v.ColID AND r.Val >= v.Val) -- Left
		OR NOT EXISTS (SELECT * FROM #data r WHERE r.RowID = v.RowID AND r.ColID > v.ColID AND r.Val >= v.Val) -- Right
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
	DECLARE @val_len int;
	SELECT TOP(1) @val_len = LEN(Val) FROM #rawdata

	SELECT TOP(1) Answer = u.Score * d.Score * l.Score * r.Score
	FROM #data v
		CROSS APPLY (SELECT Score = ABS(v.RowID - COALESCE(MAX(r.RowID), 1))        FROM #data r WHERE r.RowID < v.RowID AND r.ColID = v.ColID AND r.Val >= v.Val) u -- Up
		CROSS APPLY (SELECT Score = ABS(v.RowID - COALESCE(MIN(r.RowID), @val_len)) FROM #data r WHERE r.RowID > v.RowID AND r.ColID = v.ColID AND r.Val >= v.Val) d -- Down
		CROSS APPLY (SELECT Score = ABS(v.ColID - COALESCE(MAX(r.ColID), 1))        FROM #data r WHERE r.RowID = v.RowID AND r.ColID < v.ColID AND r.Val >= v.Val) l -- Left
		CROSS APPLY (SELECT Score = ABS(v.ColID - COALESCE(MIN(r.ColID), @val_len)) FROM #data r WHERE r.RowID = v.RowID AND r.ColID > v.ColID AND r.Val >= v.Val) r -- Right
	ORDER BY Answer DESC
------------------------------------------------------------------------------

------------------------------------------------------------------------------
