------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#rawdata','U') IS NOT NULL DROP TABLE #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int IDENTITY, Val int NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            (1000),(2000),(3000),(NULL),(4000),(NULL),(5000),(6000),(NULL),(7000),(8000),(9000),(NULL),(10000);
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            (10130),(9819),(4257),(8400),(10994),(3758),(8326),(NULL),(9002),(15602),(1193),(6805),(10797),(NULL),(9435),(6559),(11512),(12051),(2687),(2850),(3752),(NULL),(6656),(5869),(5033),(7164),(1708),(3689),(2218),(6642),(1913),(1494),(1403),(4269),(NULL),(6089),(3985),(4673),(4814),(6628),(6076),(3594),(3143),(5412),(7647),(NULL),(22393),(2865),(NULL),(2241),(1877),(2289),(1928),(1519),(4750),(5669),(3725),(3706),(4640),(4078),(NULL),(11277),(6678),(15419),(18306),(NULL),(8709),(6839),(1177),(1731),(12550),(6153),(NULL),(7843),(5702),(8917),(3883),(9193),(9098),(8928),(6742),(9387),(NULL),(26854),(9607),(NULL),(5043),(2064),(7565),(2747),(5389),(10597),(2921),(9208),(NULL),(11529),(11452),(3741),(5553),(NULL),
            (13959),(7068),(6045),(3757),(8997),(NULL),(12474),(7761),(4219),(6674),(6064),(1518),(NULL),(4312),(2690),(5772),(4771),(1013),(5905),(4929),(1428),(3755),(4513),(4394),(4521),(1284),(3384),(4493),(NULL),(1051),(3887),(6109),(6877),(7908),(9046),(2055),(10550),(NULL),(4710),(16311),(19468),(NULL),(3334),(6297),(8004),(8891),(7498),(8396),(9118),(2651),(NULL),(9178),(8754),(3183),(4795),(1172),(2775),(3152),(9623),(NULL),(8741),(3118),(3487),(6103),(1709),(7780),(9419),(NULL),(4211),(3174),(3635),(2500),(5348),(4796),(5804),(2000),(5886),(6508),(1643),(1749),(6334),(5729),(NULL),(15750),(11572),(5018),(5569),(6147),(NULL),(10944),(11253),(9945),(7722),(4790),(6543),(10256),(NULL),(4766),(8150),(15489),
            (8177),(5162),(NULL),(15715),(4110),(2329),(4366),(14885),(NULL),(4263),(1071),(6295),(2964),(4861),(1084),(6244),(6243),(3177),(5040),(3934),(NULL),(7299),(8607),(9981),(9451),(3932),(NULL),(4093),(2953),(5017),(2593),(7345),(7549),(5403),(1717),(2011),(1717),(5148),(NULL),(7689),(1804),(3955),(2130),(4847),(6311),(1709),(3207),(4728),(2441),(NULL),(16221),(16405),(16736),(3431),(NULL),(6886),(1191),(1283),(6308),(1100),(5473),(2290),(1438),(1685),(1832),(6629),(6061),(5556),(NULL),(7262),(7934),(5864),(1050),(3072),(5860),(4263),(2940),(NULL),(11268),(6888),(12460),(3346),(9438),(13728),(NULL),(2427),(5611),(7314),(4481),(6000),(7649),(7036),(1996),(5476),(NULL),(4144),(2951),(3075),(1146),(4956),
            (4090),(4416),(4605),(1684),(3396),(3863),(5911),(5910),(5884),(2391),(NULL),(3833),(4216),(2824),(5672),(7345),(6991),(1698),(2745),(5932),(3433),(3415),(1626),(NULL),(6343),(1723),(8634),(6735),(3185),(3580),(3976),(5503),(NULL),(5902),(6282),(4830),(6680),(1549),(5325),(6533),(3525),(4696),(5120),(6612),(NULL),(3263),(6467),(6495),(1157),(2270),(5533),(2986),(6412),(5730),(6308),(3471),(3544),(3844),(4913),(NULL),(2731),(2447),(1071),(7298),(3316),(5807),(5240),(1532),(3431),(7179),(1147),(5954),(NULL),(5747),(1098),(4844),(2140),(4052),(3516),(3315),(4475),(4508),(4806),(5695),(2780),(5886),(2339),(4953),(NULL),(5465),(3399),(2661),(5743),(2124),(1344),(3878),(6085),(3637),(4797),(5691),
            (4026),(3356),(1596),(NULL),(6713),(4867),(5837),(3837),(5532),(8929),(6160),(9598),(3756),(NULL),(8256),(1917),(23093),(NULL),(1162),(24338),(NULL),(8029),(7864),(3231),(4214),(1430),(8589),(9062),(2655),(NULL),(7612),(3854),(2976),(8494),(9635),(6821),(2780),(6393),(3586),(NULL),(9813),(8505),(7281),(13293),(13132),(10159),(NULL),(15355),(13250),(NULL),(5976),(1131),(1502),(5742),(4965),(5047),(2123),(4449),(1584),(2250),(4775),(2335),(4475),(1341),(NULL),(8554),(4775),(4662),(4601),(8799),(9561),(3080),(9389),(7430),(NULL),(13227),(5422),(10123),(14929),(14241),(NULL),(9827),(15055),(3548),(2653),(NULL),(6014),(1104),(6289),(6112),(5308),(1267),(6196),(5057),(4167),(5778),(1994),(6404),(2447),(3656),
            (NULL),(3016),(5357),(6050),(2230),(3928),(3447),(7969),(7363),(6338),(3996),(3781),(NULL),(2292),(1041),(18572),(13149),(NULL),(10761),(13752),(15373),(10572),(NULL),(4768),(3504),(5616),(1147),(1267),(5779),(3238),(3213),(2017),(6083),(6289),(1858),(3424),(NULL),(9295),(NULL),(21805),(11516),(8352),(NULL),(2212),(4582),(3385),(2985),(1957),(2228),(1750),(3868),(5963),(4646),(5820),(2169),(4298),(2557),(NULL),(4471),(1614),(1698),(1789),(4748),(5182),(4807),(5122),(5105),(3295),(3665),(4533),(3809),(4998),(4982),(NULL),(26098),(28596),(NULL),(10111),(5551),(10077),(4066),(13547),(7371),(NULL),(18933),(8329),(7577),(16408),(NULL),(6523),(15633),(15999),(NULL),(17658),(24788),(11403),(NULL),(5890),(3722),(5091),
            (1161),(5073),(2660),(4707),(4544),(1564),(1885),(5488),(3152),(5054),(6000),(NULL),(36680),(1628),(NULL),(7616),(6364),(7551),(2658),(4726),(3448),(3183),(5964),(2747),(7994),(3711),(NULL),(1667),(6128),(6100),(5799),(3361),(5928),(2935),(2284),(3665),(5305),(1584),(1114),(4480),(NULL),(14019),(NULL),(13533),(16036),(17506),(NULL),(8819),(NULL),(1689),(3541),(2586),(3124),(1670),(3158),(2961),(4631),(5262),(4097),(1120),(1252),(2487),(1524),(5029),(NULL),(4609),(9146),(11572),(5695),(9042),(2025),(NULL),(5442),(6032),(6242),(2064),(3783),(4998),(3501),(3193),(2923),(3768),(3724),(1454),(6198),(1709),(NULL),(7098),(1914),(1649),(8743),(8717),(7814),(9496),(3013),(7721),(NULL),(7963),(2700),(4762),
            (10490),(4733),(7668),(2070),(9014),(NULL),(21869),(24146),(17568),(NULL),(2791),(3206),(9706),(9752),(9313),(10047),(7229),(8457),(NULL),(2139),(4268),(3545),(7513),(1530),(11105),(2343),(NULL),(9514),(16132),(4113),(3896),(12368),(NULL),(3376),(3232),(5230),(1084),(7424),(4773),(1568),(3469),(5223),(1717),(7149),(4479),(NULL),(61245),(NULL),(33738),(29007),(NULL),(2744),(4342),(NULL),(5250),(3285),(9082),(8951),(2287),(6693),(5952),(2241),(3382),(NULL),(2403),(5553),(1652),(5189),(4120),(4771),(2030),(5463),(1141),(2147),(2400),(2764),(5958),(2595),(2984),(NULL),(4615),(5948),(8609),(8342),(4845),(5590),(5717),(7729),(4214),(8715),(NULL),(5280),(5238),(6594),(4787),(2268),(3201),(1982),(2653),(2507),
            (6843),(3996),(NULL),(1079),(2327),(2146),(5369),(1149),(7836),(6695),(4774),(4834),(5966),(NULL),(4743),(1071),(5553),(5856),(3501),(5256),(1059),(2172),(1766),(5111),(1734),(3741),(6666),(NULL),(7208),(8917),(4574),(10178),(6217),(3799),(9124),(NULL),(6278),(7284),(3207),(2626),(2815),(1047),(6197),(7928),(5342),(3487),(NULL),(2733),(5855),(3916),(6364),(4889),(6248),(3109),(1912),(3936),(3934),(4021),(NULL),(8862),(7897),(8001),(1505),(5231),(11377),(4084),(NULL),(22344),(10024),(NULL),(1935),(5094),(1740),(7991),(9007),(3718),(1466),(6634),(2244),(NULL),(3611),(4382),(5099),(1587),(6938),(7285),(4578),(1424),(2085),(7306),(1244),(1891),(NULL),(3108),(2917),(3884),(1274),(6387),(2055),(1684),
            (6353),(5801),(5886),(5649),(2985),(2806),(NULL),(26039),(15129),(13699),(NULL),(4284),(4026),(5226),(5746),(4828),(3027),(6034),(3648),(7685),(7998),(1975),(NULL),(3884),(3450),(2695),(5818),(1069),(2977),(5076),(6920),(5542),(6195),(3476),(3648),(3993),(NULL),(49995),(NULL),(5330),(4948),(6472),(4324),(5154),(2581),(2762),(4454),(6681),(6553),(1544),(1984),(NULL),(5328),(5393),(6886),(6874),(3673),(2691),(1814),(2990),(1793),(7468),(4091),(NULL),(4908),(4335),(2656),(7085),(5897),(2578),(1530),(8614),(3702),(3362),(NULL),(2673),(1354),(2602),(5656),(3565),(5690),(5332),(4125),(3471),(3011),(2915),(5633),(2723),(5355),(3201),(NULL),(10397),(1302),(11090),(3309),(NULL),(35932),(NULL),(32894),(30094);
        INSERT INTO #rawdata (Val) VALUES
            (NULL),(5343),(2920),(1905),(4745),(3031),(6507),(4449),(2217),(1518),(3839),(4880),(5063),(3321),(5467),(NULL),(4243),(3226),(3383),(3673),(1749),(3569),(5089),(6581),(3127),(5840),(4686),(3617),(2460),(NULL),(7731),(4562),(4990),(5693),(7485),(4390),(4491),(7039),(1440),(3217),(NULL),(2082),(6021),(4675),(4771),(2925),(4324),(6847),(5846),(1384),(6905),(NULL),(5996),(NULL),(8125),(4714),(7960),(4031),(4566),(7388),(4036),(5376),(7248),(8266),(NULL),(1863),(6558),(4889),(2261),(5836),(1210),(6762),(8490),(2614),(6802),(NULL),(30026),(18586),(NULL),(4845),(6999),(8095),(2220),(8731),(3782),(5964),(3762),(7152),(4524),(NULL),(28917),(NULL),(21103),(18240),(NULL),(4716),(1062),(5583),(4631),(6145),
            (5939),(5499),(5517),(2103),(6339),(3586),(4216),(2466),(NULL),(6027),(9439),(2900),(2939),(8164),(8423),(8189),(9443),(3371),(NULL),(6741),(7254),(5730),(4541),(2840),(3289),(2176),(4008),(1137),(6422),(4732),(6850),(NULL),(6024),(14627),(4098),(3714),(1268),(NULL),(13617),(NULL),(5203),(2873),(2129),(7116),(5904),(5410),(6750),(6863),(6162),(NULL),(4859),(5535),(4891),(8456),(8099),(7583),(5857),(NULL),(5647),(6145),(4400),(1401),(3704),(1503),(5662),(5980),(3769),(2206),(5537),(6375),(6146),(1136),(NULL),(1832),(4382),(7311),(2901),(6613),(1845),(3313),(3137),(5376),(NULL),(1976),(5643),(3090),(2437),(2082),(6379),(2655),(6541),(4795),(3697),(2555),(3717),(2819),(NULL),(1046),(4154),(6033),
            (3120),(3198),(5890),(5008),(4346),(1588),(6469),(4257),(4984),(2249),(4830),(NULL),(11119),(10936),(9196),(7164),(11955),(9319),(NULL),(25710),(18940),(11190),(NULL),(15820),(14632),(NULL),(1730),(1113),(3427),(6097),(4165),(1487),(1632),(5267),(2170),(2476),(4911),(2767),(3476),(2532),(2216),(NULL),(10511),(3144),(7687),(3624),(1162),(8444),(1812),(1675),(NULL),(1772),(5126),(4840),(3465),(8376),(2305),(1122),(2119),(5551),(4986),(NULL),(3038),(7556),(3843),(2976),(7807),(13037),(NULL),(4578),(5703),(7102),(6776),(3151),(4995),(3053),(5881),(5906),(1003),(7423),(NULL),(12965),(13177),(4312),(6862),(7032),(13595),(NULL),(5043),(3315),(14242),(12771),(NULL),(4113),(7471),(4110),(1956),(4263),(4592),(7107),
            (1535),(1812),(5169),(2633),(6973),(NULL),(1000),(2407),(6526),(6585),(5191),(7978),(7027),(6226),(4347),(8052),(NULL),(10115),(5381),(2764),(13539),(5858),(NULL),(2365),(1563),(5503),(4584),(1776),(5321),(5116),(1845),(6048),(4447),(2068),(3552),(3658),(4667),(5191),(NULL),(6968),(5138),(3505),(3735),(2502),(1692),(2051),(3551),(3393),(5560),(5870),(NULL),(9726),(7999),(2153),(12078),(2579),(9831),(NULL),(16362),(11512),(1014),(5409),(11437),(NULL),(5713),(5921),(1110),(4722),(5086),(3674),(3938),(6726),(2114),(6651),(2570),(NULL),(1593),(1892),(2130),(5280),(6833),(5735),(8558),(10535),(NULL),(13937),(18143),(NULL),(1054),(10528),(9972),(13953),(13815),(8632),(NULL),(3812),(11438),(5636),(1639),(13967),
            (NULL),(8887),(5092),(12287),(2867),(3987),(6854),(NULL),(6285),(16477),(NULL),(3800),(2039),(4443),(5461),(4586),(1477),(5984),(2803),(4321),(6139),(6058),(4305),(4451),(NULL),(6031),(1819),(5064),(6241),(2251),(6110),(2526),(1368),(2660),(1604),(4978),(2861),(1786),(2480),(NULL),(8200),(7851),(8701),(4740),(3816),(4913),(8713),(8170),(4864),(4144),(NULL),(30728),(32625),(NULL),(5138),(5610),(2844),(5599),(2064),(4472),(2620),(2461),(4702),(4730),(6714),(3755),(NULL),(1259),(5032),(5056),(3705),(4254),(2516),(3573),(6040),(5939),(1091),(3679),(1815),(NULL),(7169),(6264),(2928),(3857),(1399),(3983),(5004),(6298),(6495),(3815),(5715),(4531),(NULL),(3894),(4083),(4992),(6342),(3949),(5542),(4008),
            (2679),(1904),(2045),(4936),(5181),(5730),(6243),(NULL),(2284),(5962),(4449),(1238),(4355),(3182),(1850),(6293),(1594),(4194),(4158),(2485),(1027),(5645),(NULL),(8924),(18654),(4250),(NULL),(3370),(4573),(2912),(4475),(3791),(2443),(3230),(1759),(3073),(3459),(4153),(3241),(1123),(4630),(NULL),(7451),(10002),(1187),(3001),(8317),(11031),(NULL),(8570),(8386),(3284),(4799),(4346),(1232),(2001),(7199),(NULL),(5453),(2196),(5968),(6073),(3973),(2030),(3075),(3177),(1074),(3381),(2751),(1524),(5084),(2349),(2134),(NULL),(3920),(5475),(4746),(7174),(5530),(1331),(4767),(5566),(7454),(1281),(NULL),(62528),(NULL),(5428),(5144),(3420),(3359),(5232),(1156),(3431),(2458),(5639),(6299),(6416),(3381),(3199),
            (2574),(NULL),(3103),(5574),(5574),(6452),(3346),(4931),(3470),(1884),(3304),(2498),(4951),(4475),(1342),(3991),(NULL),(6678),(3447),(2475),(6514),(5450),(5561),(4939),(4075),(4688),(3228),(3691),(1410),(2518),(NULL),(6617),(7399),(1668),(5218),(2615),(4233),(3883),(5109),(4221),(3417),(5259),(3424),(NULL),(35141),(20700),(NULL),(5415),(NULL),(19959),(16356),(6769),(8431),(NULL),(4004),(5139),(1314),(5778),(6335),(2418),(2353),(5020),(5701),(4038),(7997),(NULL),(3484),(9434),(5114),(7686),(9811),(3027),(6818),(1134),(NULL),(22133),(9535),(3540),(NULL),(5241),(10210),(1552),(3819),(5903),(NULL),(3657),(6124),(10218),(7944),(10202),(2064),(7803),(9270),(NULL),(1513),(3991),(8713),(2745),(6459),(7823),
            (4728),(8610),(5026),(4761),(NULL),(1246),(1128),(1814),(6022),(2200),(4128),(5651),(6086),(6452),(6795),(3860),(NULL),(44675),(NULL),(7236),(4656),(1629),(8693),(7402),(2344),(6600),(5925),(4540),(NULL),(32583),(13437),(NULL),(7763),(8572),(5475),(2542),(1445),(8385),(6780),(4197),(NULL),(8767),(3676),(10354),(8594),(7795),(10394),(1358),(1402),(NULL),(3593),(6176),(3574),(5641),(5357),(1077),(4858),(2060),(2559),(3566),(2598),(3133),(1877),(4056),(NULL),(17274),(3353),(NULL),(26548),(NULL),(3352),(3677),(7771),(2007),(4376),(2703),(8446),(9191),(NULL),(4542),(7433),(4709),(7063),(3267),(7088),(1952),(4479),(2972),(2480),(6111),(NULL),(8493),(3255),(3042),(13612),(8847),(NULL),(4995),(4745),(7511),
            (7895),(4616),(1845),(4306),(3240),(3874),(4607),(4907),(NULL),(19216),(13903),(NULL),(8563),(1199),(7999),(5067),(8083),(5684),(8510),(4581),(5261),(7329),(NULL),(3648),(4762),(1200),(5362),(6143),(5781),(4091),(7554),(8193),(NULL),(1715),(1099),(4426),(1151),(1263),(5788),(1507),(4926),(3881),(5506),(3788),(4429),(4823),(3138),(3905),(NULL),(5265),(9671),(3085),(5558),(3704),(9011),(4395),(9449),(6064),(NULL),(28075),(NULL),(28195),(3135),(NULL),(14792),(19272),(13436),(3789),(NULL),(6763),(2173),(2503),(10888),(10558),(10563),(4711),(NULL),(5992),(2189),(5666),(1034),(1893),(2992),(4069),(1199),(6085),(2461),(5216),(4690),(2307),(5691),(5419),(NULL),(4029),(2298),(4093),(5486),(3426),(5957),(1640),
            (6743),(2390),(2621),(3025),(3830),(1353),(NULL),(1754),(4361),(8039),(1535),(8034),(1065),(10104),(NULL),(16212),(1075),(4391),(13803),(NULL),(53395),(NULL),(3508),(5369),(9075),(1489),(4569),(6561),(7322),(1526),(NULL),(32816),(5936),(NULL),(8014),(7548),(6265),(6118),(1175),(7127),(1291),(7133),(4717),(3197),(NULL),(8290),(1078),(4130),(7049),(9394),(10135),(10056),(7434),(NULL),(1423),(11077),(13375),(4711),(4031),(7284),(NULL),(7959),(2528),(3203),(10246),(1515),(6495),(8756),(5632),(NULL),(7067),(5860),(3654),(6956),(8085),(10898),(11823),(NULL),(3894),(2528),(3276),(5192),(1474),(3444),(4714),(2812),(2141),(3393),(4296),(1737),(2270),(3736),(2003),(NULL),(64495),(NULL),(7374),(6655),(9252),(1270);
        INSERT INTO #rawdata (Val) VALUES
            (6722),(2267),(9324),(2552),(NULL),(5125),(5729),(4215),(1176),(3739),(1570),(5729),(5390),(2232),(5785),(6490),(4467),(3170),(5906),(NULL),(5257),(2688),(10408),(1584),(6951),(9783),(3181),(9280),(NULL),(1129),(4459),(1794),(5817),(2895),(4598),(2880),(4862),(1895),(6047),(2999),(5138),(3616),(1299),(5836),(NULL),(2081),(5990),(5404),(5622),(5346),(3674),(3807),(2676),(4941),(2787),(4933),(2281),(3692),(1605),(2149),(NULL),(10528),(8445),(9263),(4626),(1021),(6175),(3036),(NULL),(7285),(12907),(11004),(9393),(11066),(NULL),(1653),(5500),(7276),(4978),(5143),(6363),(2696),(2026),(2753),(4755),(4366),(3789),(NULL),(5625),(1653),(1084),(4251),(2406),(6263),(6020),(6380),(4500),(4975),(5502),(4818),
            (4297),(2202),(NULL),(4203),(6347),(1818),(2069),(4846),(4423),(5383),(4857),(6333),(2066),(5189),(5407),(1875),(3563),(NULL),(20111),(23850),(18762),(NULL),(5647),(16300),(3389),(13144),(NULL),(3410),(2740),(6542),(7471),(4532),(7375),(5905),(7073),(4372),(7066),(5923),(4348),(NULL),(31582),(24911),(NULL),(11599),(7786),(13121),(10360),(6683),(NULL),(7353),(3964),(9305),(9313),(11354),(6791),(9037),(NULL),(2850),(1062),(5993),(1721),(4463),(1407),(2893),(5473),(1549),(2631),(2321),(4995),(5428),(4106),(3332),(NULL),(8992),(10224),(9418),(8509),(7874),(5208),(6202),(NULL),(8824),(12637),(12672),(5257),(6621),(11770),(NULL),(16537),(NULL),(2825),(5281),(6898),(6437),(6481),(4806),(4208),(6030),(6926),(1392),
            (7842),(NULL),(8051),(1225),(4681),(8361),(NULL),(6636),(1919),(3652),(11633),(11321),(13513),(NULL),(5849),(1752),(6518),(5546),(2608),(2866),(3356),(2107),(4090),(5238),(3559),(NULL),(2455),(4808),(1899),(1753),(1899),(5047),(3362),(5973),(1832),(3395),(2908),(2616),(5720),(2221),(1771),(NULL),(1654),(6928),(3317),(4238),(4796),(4168),(6225),(1669),(1109),(4265),(4980),(6660);
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    SELECT TOP(1) Answer = SUM(x.Val)
    FROM (
        SELECT x.ID, x.Val
             , GroupID = SUM(IIF(x.Val IS NULL, 1, 0)) OVER (ORDER BY ID)
        FROM #rawdata x
    ) x
    GROUP BY GroupID
    ORDER BY SUM(x.Val) DESC;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    SELECT Answer = SUM(x.Answer)
    FROM (
        SELECT TOP(3) Answer = SUM(x.Val)
        FROM (
            SELECT x.ID, x.Val
                 , GroupID = SUM(IIF(x.Val IS NULL, 1, 0)) OVER (ORDER BY ID)
            FROM #rawdata x
        ) x
        GROUP BY GroupID
        ORDER BY SUM(x.Val) DESC
    ) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
