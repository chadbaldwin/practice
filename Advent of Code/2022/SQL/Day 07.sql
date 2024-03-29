------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int, Val varchar(100) NOT NULL);

    DECLARE @UseSampleData bit = 0;

    IF (@UseSampleData = 1)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (ID, Val) VALUES (1,'$ cd /'),(2,'$ ls'),(3,'dir a'),(4,'14848514 b.txt'),(5,'8504156 c.dat'),(6,'dir d'),(7,'$ cd a'),(8,'$ ls'),(9,'dir e'),(10,'29116 f'),(11,'2557 g'),(12,'62596 h.lst'),(13,'$ cd e'),(14,'$ ls'),(15,'584 i'),(16,'$ cd ..'),(17,'$ cd ..'),(18,'$ cd d'),(19,'$ ls'),(20,'4060174 j'),(21,'8033020 d.log'),(22,'5626152 d.ext'),(23,'7214296 k');
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (ID, Val) VALUES (1,'$ cd /'),(2,'$ ls'),(3,'dir bntdgzs'),(4,'179593 cjw.jgc'),(5,'110209 grbwdwsm.znn'),(6,'dir hsswswtq'),(7,'dir jdfwmhg'),(8,'dir jlcbpsr'),(9,'70323 qdtbvqjj'),(10,'48606 qdtbvqjj.zdg'),(11,'dir tvcr'),(12,'dir vhjbjr'),(13,'dir vvsg'),(14,'270523 wpsjfqtn.ljt'),(15,'$ cd bntdgzs'),(16,'$ ls'),(17,'297955 gcwcp'),(18,'$ cd ..'),(19,'$ cd hsswswtq'),(20,'$ ls'),(21,'dir bsjbvff'),(22,'dir dpgvp'),(23,'267138 grbwdwsm.znn'),(24,'dir hldgfpvh'),(25,'dir jdfwmhg'),(26,'dir jtgdv'),(27,'93274 ptsd.nzh'),(28,'268335 qdtbvqjj.dlh'),(29,'185530 qdtbvqjj.jrw'),(30,'dir vcbqdj'),(31,'dir wtrsg'),(32,'$ cd bsjbvff'),(33,'$ ls'),(34,'dir dmnt'),(35,'148799 grbwdwsm.znn'),(36,'324931 hzmqrfc.lsd'),(37,'211089 qdtbvqjj'),(38,'$ cd dmnt'),(39,'$ ls'),(40,'221038 zht'),(41,'$ cd ..'),(42,'$ cd ..'),(43,'$ cd dpgvp'),(44,'$ ls'),(45,'dir fzttpjtd'),(46,'dir jdrbwrc'),(47,'dir rwz'),(48,'dir tssm'),(49,'$ cd fzttpjtd'),(50,'$ ls'),(51,'149872 jdfwmhg'),(52,'$ cd ..'),(53,'$ cd jdrbwrc'),(54,'$ ls'),(55,'149973 hpgg.srm'),(56,'dir ptsd'),(57,'$ cd ptsd'),(58,'$ ls'),(59,'2594 twzf.pqq'),(60,'$ cd ..'),(61,'$ cd ..'),(62,'$ cd rwz'),(63,'$ ls'),(64,'dir jdfwmhg'),(65,'302808 zzlh'),(66,'$ cd jdfwmhg'),(67,'$ ls'),(68,'229683 cdcrgcmh'),(69,'218733 nhzt'),(70,'$ cd ..'),(71,'$ cd ..'),(72,'$ cd tssm'),(73,'$ ls'),(74,'dir ptsd'),(75,'37272 qfnnrqsh.qvg'),(76,'215066 wnvjc.jqf'),(77,'$ cd ptsd'),(78,'$ ls'),(79,'24102 bwtbht.dwq'),(80,'224035 qdtbvqjj.dmp'),(81,'$ cd ..'),(82,'$ cd ..'),(83,'$ cd ..'),(84,'$ cd hldgfpvh'),(85,'$ ls'),(86,'316712 grbwdwsm.znn'),(87,'328950 tqvgqjrr'),(88,'$ cd ..'),(89,'$ cd jdfwmhg'),(90,'$ ls'),(91,'130652 gcwcp'),(92,'dir jdfwmhg'),(93,'215427 lfw.zml'),(94,'dir qdtbvqjj'),(95,'4181 rgsvgssj.qsr'),(96,'$ cd jdfwmhg'),(97,'$ ls'),(98,'dir bvm'),(99,'dir hsswswtq'),(100,'122279 qznt.jhl');
        INSERT INTO #rawdata (ID, Val) VALUES (101,'dir sjw'),(102,'dir zpfdtl'),(103,'$ cd bvm'),(104,'$ ls'),(105,'22841 fbcgh.mrp'),(106,'dir hsswswtq'),(107,'dir hstg'),(108,'41317 ndrt'),(109,'dir nvmvghb'),(110,'239316 ptsd'),(111,'dir qtwvdtsp'),(112,'98555 vzh'),(113,'$ cd hsswswtq'),(114,'$ ls'),(115,'dir ddcjvjgf'),(116,'127104 plwvb.pbj'),(117,'dir ptsd'),(118,'dir qhp'),(119,'dir rjtrhgwh'),(120,'$ cd ddcjvjgf'),(121,'$ ls'),(122,'135870 bwtbht.dwq'),(123,'81968 gcwcp'),(124,'182253 mrbh.wmc'),(125,'275931 nsrqrts'),(126,'322128 pfpcp'),(127,'$ cd ..'),(128,'$ cd ptsd'),(129,'$ ls'),(130,'214981 jsrlsc'),(131,'dir wpbdrcw'),(132,'$ cd wpbdrcw'),(133,'$ ls'),(134,'197849 mljfb.ggb'),(135,'173586 ptsd'),(136,'$ cd ..'),(137,'$ cd ..'),(138,'$ cd qhp'),(139,'$ ls'),(140,'293198 bnrgl'),(141,'$ cd ..'),(142,'$ cd rjtrhgwh'),(143,'$ ls'),(144,'224393 clrp.nst'),(145,'$ cd ..'),(146,'$ cd ..'),(147,'$ cd hstg'),(148,'$ ls'),(149,'51671 gdsfpc'),(150,'209216 hsswswtq'),(151,'97203 jlnr'),(152,'dir thdhg'),(153,'57399 tssm'),(154,'$ cd thdhg'),(155,'$ ls'),(156,'201896 jjp.wvw'),(157,'$ cd ..'),(158,'$ cd ..'),(159,'$ cd nvmvghb'),(160,'$ ls'),(161,'210047 gfcrzgj'),(162,'dir rqjbplv'),(163,'dir rvwd'),(164,'292931 sgwvcqfr.bpq'),(165,'dir vtjd'),(166,'$ cd rqjbplv'),(167,'$ ls'),(168,'105204 gcwcp'),(169,'$ cd ..'),(170,'$ cd rvwd'),(171,'$ ls'),(172,'66170 jdfwmhg'),(173,'$ cd ..'),(174,'$ cd vtjd'),(175,'$ ls'),(176,'dir ptsd'),(177,'$ cd ptsd'),(178,'$ ls'),(179,'300524 bwtbht.dwq'),(180,'$ cd ..'),(181,'$ cd ..'),(182,'$ cd ..'),(183,'$ cd qtwvdtsp'),(184,'$ ls'),(185,'289574 wctgtq'),(186,'$ cd ..'),(187,'$ cd ..'),(188,'$ cd hsswswtq'),(189,'$ ls'),(190,'24935 gcwcp'),(191,'dir jzpbdcmc'),(192,'26834 mljfb.ggb'),(193,'182501 phnmlsjp.pjc'),(194,'dir pttnl'),(195,'dir qdtbvqjj'),(196,'dir vst'),(197,'$ cd jzpbdcmc'),(198,'$ ls'),(199,'297521 grbwdwsm.znn'),(200,'dir qwc');
        INSERT INTO #rawdata (ID, Val) VALUES (201,'dir zzswd'),(202,'$ cd qwc'),(203,'$ ls'),(204,'81143 hsswswtq.rjw'),(205,'54843 mjvvfsz.rgz'),(206,'273051 pfwgtmtt.ccs'),(207,'$ cd ..'),(208,'$ cd zzswd'),(209,'$ ls'),(210,'216062 vlbwz.zmh'),(211,'$ cd ..'),(212,'$ cd ..'),(213,'$ cd pttnl'),(214,'$ ls'),(215,'257733 mljfb.ggb'),(216,'250887 pfwgtmtt.ccs'),(217,'$ cd ..'),(218,'$ cd qdtbvqjj'),(219,'$ ls'),(220,'34667 gcwcp'),(221,'$ cd ..'),(222,'$ cd vst'),(223,'$ ls'),(224,'70250 pfwgtmtt.ccs'),(225,'dir zpcqhml'),(226,'$ cd zpcqhml'),(227,'$ ls'),(228,'219936 jdfwmhg.zbm'),(229,'$ cd ..'),(230,'$ cd ..'),(231,'$ cd ..'),(232,'$ cd sjw'),(233,'$ ls'),(234,'152311 nqjtvzff'),(235,'157117 pfwgtmtt.ccs'),(236,'118226 ptsd.vsm'),(237,'$ cd ..'),(238,'$ cd zpfdtl'),(239,'$ ls'),(240,'189042 gcwcp'),(241,'$ cd ..'),(242,'$ cd ..'),(243,'$ cd qdtbvqjj'),(244,'$ ls'),(245,'dir ftz'),(246,'dir hvlffb'),(247,'dir lzbb'),(248,'53335 ptsd'),(249,'dir qdtbvqjj'),(250,'$ cd ftz'),(251,'$ ls'),(252,'dir fft'),(253,'256058 gcwcp'),(254,'497 hsswswtq.vqs'),(255,'103941 hvtcz.fsg'),(256,'171587 ljlnz.ffg'),(257,'115101 mljfb.ggb'),(258,'dir qdtbvqjj'),(259,'$ cd fft'),(260,'$ ls'),(261,'58845 bwtbht.dwq'),(262,'136040 gcwcp'),(263,'256973 mljfb.ggb'),(264,'$ cd ..'),(265,'$ cd qdtbvqjj'),(266,'$ ls'),(267,'dir fgqhdh'),(268,'304573 ntm.wmc'),(269,'$ cd fgqhdh'),(270,'$ ls'),(271,'317143 gcwcp'),(272,'26010 lsfpfdqz'),(273,'$ cd ..'),(274,'$ cd ..'),(275,'$ cd ..'),(276,'$ cd hvlffb'),(277,'$ ls'),(278,'6682 vjt.mcf'),(279,'$ cd ..'),(280,'$ cd lzbb'),(281,'$ ls'),(282,'dir bbvml'),(283,'324162 bwtbht.dwq'),(284,'dir fjs'),(285,'dir pffntc'),(286,'dir pnltt'),(287,'dir ptsd'),(288,'$ cd bbvml'),(289,'$ ls'),(290,'dir qdtbvqjj'),(291,'dir qssdcrp'),(292,'dir tssm'),(293,'$ cd qdtbvqjj'),(294,'$ ls'),(295,'246275 qdtbvqjj.cgn'),(296,'$ cd ..'),(297,'$ cd qssdcrp'),(298,'$ ls'),(299,'274399 hsswswtq'),(300,'$ cd ..');
        INSERT INTO #rawdata (ID, Val) VALUES (301,'$ cd tssm'),(302,'$ ls'),(303,'dir ssqc'),(304,'$ cd ssqc'),(305,'$ ls'),(306,'178904 njrssmlm.gcm'),(307,'$ cd ..'),(308,'$ cd ..'),(309,'$ cd ..'),(310,'$ cd fjs'),(311,'$ ls'),(312,'dir dmvnp'),(313,'121967 fqlzlvwt'),(314,'204348 grbwdwsm.znn'),(315,'102733 jdfwmhg.qsl'),(316,'240279 ptsd.jwm'),(317,'228793 ptsd.nsh'),(318,'dir ssm'),(319,'$ cd dmvnp'),(320,'$ ls'),(321,'dir psj'),(322,'dir zjw'),(323,'$ cd psj'),(324,'$ ls'),(325,'170665 gcwcp'),(326,'56058 lsfzc.dcp'),(327,'40658 tfsllqqw.fgv'),(328,'$ cd ..'),(329,'$ cd zjw'),(330,'$ ls'),(331,'79989 fggsl.dmz'),(332,'$ cd ..'),(333,'$ cd ..'),(334,'$ cd ssm'),(335,'$ ls'),(336,'106263 bwtbht.dwq'),(337,'106259 jdfwmhg.qtb'),(338,'6246 rwbnr.tqv'),(339,'$ cd ..'),(340,'$ cd ..'),(341,'$ cd pffntc'),(342,'$ ls'),(343,'111475 qbmrdms.ldm'),(344,'$ cd ..'),(345,'$ cd pnltt'),(346,'$ ls'),(347,'dir nptfhlf'),(348,'dir zngmf'),(349,'$ cd nptfhlf'),(350,'$ ls'),(351,'223065 qrb.drh'),(352,'205674 rdgfz'),(353,'$ cd ..'),(354,'$ cd zngmf'),(355,'$ ls'),(356,'61655 bwtbht.dwq'),(357,'$ cd ..'),(358,'$ cd ..'),(359,'$ cd ptsd'),(360,'$ ls'),(361,'dir hrvrt'),(362,'dir thwtl'),(363,'$ cd hrvrt'),(364,'$ ls'),(365,'152296 pfwgtmtt.ccs'),(366,'$ cd ..'),(367,'$ cd thwtl'),(368,'$ ls'),(369,'156783 pfwgtmtt.ccs'),(370,'323304 sltc'),(371,'$ cd ..'),(372,'$ cd ..'),(373,'$ cd ..'),(374,'$ cd qdtbvqjj'),(375,'$ ls'),(376,'320175 pfwgtmtt.ccs'),(377,'$ cd ..'),(378,'$ cd ..'),(379,'$ cd ..'),(380,'$ cd jtgdv'),(381,'$ ls'),(382,'81164 ptsd.tpj'),(383,'$ cd ..'),(384,'$ cd vcbqdj'),(385,'$ ls'),(386,'dir crng'),(387,'330203 gvlrg'),(388,'152022 qdtbvqjj.slq'),(389,'294095 rthwj.zrf'),(390,'dir vjsbf'),(391,'$ cd crng'),(392,'$ ls'),(393,'dir gznrh'),(394,'$ cd gznrh'),(395,'$ ls'),(396,'259458 ptsd'),(397,'$ cd ..'),(398,'$ cd ..'),(399,'$ cd vjsbf'),(400,'$ ls');
        INSERT INTO #rawdata (ID, Val) VALUES (401,'47331 hlld.fzf'),(402,'147103 jdfwmhg'),(403,'$ cd ..'),(404,'$ cd ..'),(405,'$ cd wtrsg'),(406,'$ ls'),(407,'144344 dtcc'),(408,'$ cd ..'),(409,'$ cd ..'),(410,'$ cd jdfwmhg'),(411,'$ ls'),(412,'323973 qdtbvqjj'),(413,'$ cd ..'),(414,'$ cd jlcbpsr'),(415,'$ ls'),(416,'dir htrdwm'),(417,'dir jdfwmhg'),(418,'dir pwmvbhsl'),(419,'dir vwfdfmcp'),(420,'$ cd htrdwm'),(421,'$ ls'),(422,'dir btn'),(423,'105731 dlncqrbm.dgl'),(424,'158267 gqqghldt'),(425,'242513 hsswswtq.drj'),(426,'dir jdfwmhg'),(427,'212816 swsgtv.wbb'),(428,'228996 tgll.rcs'),(429,'$ cd btn'),(430,'$ ls'),(431,'50419 pfwgtmtt.ccs'),(432,'$ cd ..'),(433,'$ cd jdfwmhg'),(434,'$ ls'),(435,'dir bwc'),(436,'$ cd bwc'),(437,'$ ls'),(438,'184634 cfwg'),(439,'$ cd ..'),(440,'$ cd ..'),(441,'$ cd ..'),(442,'$ cd jdfwmhg'),(443,'$ ls'),(444,'319749 hsswswtq'),(445,'dir jdfwmhg'),(446,'271619 jdfwmhg.znz'),(447,'dir jhmmt'),(448,'181217 mljfb.ggb'),(449,'11297 rcpl.tgf'),(450,'83423 zwscbcvm.ths'),(451,'$ cd jdfwmhg'),(452,'$ ls'),(453,'267171 cts.hlf'),(454,'$ cd ..'),(455,'$ cd jhmmt'),(456,'$ ls'),(457,'84473 jdfwmhg'),(458,'$ cd ..'),(459,'$ cd ..'),(460,'$ cd pwmvbhsl'),(461,'$ ls'),(462,'dir jsg'),(463,'171725 mljfb.ggb'),(464,'152612 qjr'),(465,'dir vfsqw'),(466,'$ cd jsg'),(467,'$ ls'),(468,'176951 jdfwmhg.fhn'),(469,'284927 ljvvtw.wcq'),(470,'153109 vnvtt'),(471,'$ cd ..'),(472,'$ cd vfsqw'),(473,'$ ls'),(474,'104559 htsrns.gws'),(475,'$ cd ..'),(476,'$ cd ..'),(477,'$ cd vwfdfmcp'),(478,'$ ls'),(479,'291404 csmvbjlt.tdf'),(480,'$ cd ..'),(481,'$ cd ..'),(482,'$ cd tvcr'),(483,'$ ls'),(484,'dir djtwv'),(485,'dir hsswswtq'),(486,'272845 mdds'),(487,'dir ndshbjzn'),(488,'65929 scpltww.twm'),(489,'dir tssm'),(490,'30516 zdpscm'),(491,'dir zqdrdzv'),(492,'$ cd djtwv'),(493,'$ ls'),(494,'271696 cwjj.hjp'),(495,'$ cd ..'),(496,'$ cd hsswswtq'),(497,'$ ls'),(498,'dir djngm'),(499,'dir hcz'),(500,'dir ptsd');
        INSERT INTO #rawdata (ID, Val) VALUES (501,'$ cd djngm'),(502,'$ ls'),(503,'317775 ltwjzpjb.rcj'),(504,'37776 qdtbvqjj.lzf'),(505,'$ cd ..'),(506,'$ cd hcz'),(507,'$ ls'),(508,'217741 pgdmr'),(509,'128868 qdtbvqjj'),(510,'306138 zbmrplsn'),(511,'$ cd ..'),(512,'$ cd ptsd'),(513,'$ ls'),(514,'304048 ftm'),(515,'120236 mdcwvvng'),(516,'$ cd ..'),(517,'$ cd ..'),(518,'$ cd ndshbjzn'),(519,'$ ls'),(520,'206408 pfwgtmtt.ccs'),(521,'$ cd ..'),(522,'$ cd tssm'),(523,'$ ls'),(524,'dir mlcnsf'),(525,'dir nbgjm'),(526,'204079 pdljvb'),(527,'185465 rqgdmbjf.rhr'),(528,'dir sfnlb'),(529,'$ cd mlcnsf'),(530,'$ ls'),(531,'249868 fqrncwd'),(532,'29146 zdz.jth'),(533,'$ cd ..'),(534,'$ cd nbgjm'),(535,'$ ls'),(536,'113314 mljfb.ggb'),(537,'$ cd ..'),(538,'$ cd sfnlb'),(539,'$ ls'),(540,'234917 tjp'),(541,'$ cd ..'),(542,'$ cd ..'),(543,'$ cd zqdrdzv'),(544,'$ ls'),(545,'40790 vtdnhzm'),(546,'$ cd ..'),(547,'$ cd ..'),(548,'$ cd vhjbjr'),(549,'$ ls'),(550,'dir glv'),(551,'dir mvns'),(552,'dir qbrnh'),(553,'$ cd glv'),(554,'$ ls'),(555,'288849 bgvqll.sfj'),(556,'259105 jdfwmhg'),(557,'dir qcjlshcv'),(558,'$ cd qcjlshcv'),(559,'$ ls'),(560,'dir nwqqjcmh'),(561,'$ cd nwqqjcmh'),(562,'$ ls'),(563,'137244 grbwdwsm.znn'),(564,'312904 mzh'),(565,'dir qdtbvqjj'),(566,'$ cd qdtbvqjj'),(567,'$ ls'),(568,'dir nlqbq'),(569,'$ cd nlqbq'),(570,'$ ls'),(571,'307636 ptsd.vtr'),(572,'$ cd ..'),(573,'$ cd ..'),(574,'$ cd ..'),(575,'$ cd ..'),(576,'$ cd ..'),(577,'$ cd mvns'),(578,'$ ls'),(579,'dir gzqlmrdh'),(580,'dir qjhtlh'),(581,'dir tssm'),(582,'dir vthg'),(583,'$ cd gzqlmrdh'),(584,'$ ls'),(585,'274950 mlzdqwm'),(586,'$ cd ..'),(587,'$ cd qjhtlh'),(588,'$ ls'),(589,'157835 ptsd.lqm'),(590,'300380 wst.trp'),(591,'$ cd ..'),(592,'$ cd tssm'),(593,'$ ls'),(594,'15772 gcwcp'),(595,'$ cd ..'),(596,'$ cd vthg'),(597,'$ ls'),(598,'dir gdndtlnc'),(599,'$ cd gdndtlnc'),(600,'$ ls');
        INSERT INTO #rawdata (ID, Val) VALUES (601,'3175 hsswswtq.bds'),(602,'320462 mljfb.ggb'),(603,'305508 mzvtzvqc'),(604,'dir qdtbvqjj'),(605,'154575 tssm.vgb'),(606,'$ cd qdtbvqjj'),(607,'$ ls'),(608,'236889 drnnvh'),(609,'$ cd ..'),(610,'$ cd ..'),(611,'$ cd ..'),(612,'$ cd ..'),(613,'$ cd qbrnh'),(614,'$ ls'),(615,'dir hsswswtq'),(616,'4623 hsswswtq.rnf'),(617,'266326 jrmq.ztg'),(618,'295980 tssm.vzb'),(619,'dir wnbfzd'),(620,'dir zjzhncs'),(621,'dir zttlggt'),(622,'$ cd hsswswtq'),(623,'$ ls'),(624,'48277 gsqjdbhv'),(625,'$ cd ..'),(626,'$ cd wnbfzd'),(627,'$ ls'),(628,'97133 mljfb.ggb'),(629,'$ cd ..'),(630,'$ cd zjzhncs'),(631,'$ ls'),(632,'298303 gcwcp'),(633,'dir ggr'),(634,'113206 grbwdwsm.znn'),(635,'$ cd ggr'),(636,'$ ls'),(637,'244876 ptsd.zvb'),(638,'$ cd ..'),(639,'$ cd ..'),(640,'$ cd zttlggt'),(641,'$ ls'),(642,'dir hdbwrcm'),(643,'dir mbvpd'),(644,'dir mtd'),(645,'dir ptsd'),(646,'dir tcwqp'),(647,'$ cd hdbwrcm'),(648,'$ ls'),(649,'267323 bwtbht.dwq'),(650,'$ cd ..'),(651,'$ cd mbvpd'),(652,'$ ls'),(653,'84087 frf.smv'),(654,'$ cd ..'),(655,'$ cd mtd'),(656,'$ ls'),(657,'158543 mljfb.ggb'),(658,'$ cd ..'),(659,'$ cd ptsd'),(660,'$ ls'),(661,'112797 vtschwnb.fnp'),(662,'$ cd ..'),(663,'$ cd tcwqp'),(664,'$ ls'),(665,'90637 lbsqcj.sfn'),(666,'179097 tssm.dbl'),(667,'$ cd ..'),(668,'$ cd ..'),(669,'$ cd ..'),(670,'$ cd ..'),(671,'$ cd vvsg'),(672,'$ ls'),(673,'168715 bwtbht.dwq'),(674,'dir bwv'),(675,'dir hsswswtq'),(676,'dir lqmnjrlb'),(677,'dir mmrfrj'),(678,'175244 vct.tsc'),(679,'dir zwvlhs'),(680,'$ cd bwv'),(681,'$ ls'),(682,'201509 gcwcp'),(683,'62815 grbwdwsm.znn'),(684,'dir gwdh'),(685,'dir mfdvcn'),(686,'166355 pfwgtmtt.ccs'),(687,'dir ptsd'),(688,'169681 qdtbvqjj.fgh'),(689,'250573 wvndzgv'),(690,'$ cd gwdh'),(691,'$ ls'),(692,'306377 sphrj.pjh'),(693,'$ cd ..'),(694,'$ cd mfdvcn'),(695,'$ ls'),(696,'27796 bvclvtrm.jlf'),(697,'65045 cghr.vzg'),(698,'dir hsswswtq'),(699,'197145 jdqztgh.pvd'),(700,'$ cd hsswswtq');
        INSERT INTO #rawdata (ID, Val) VALUES (701,'$ ls'),(702,'298155 bwtbht.dwq'),(703,'$ cd ..'),(704,'$ cd ..'),(705,'$ cd ptsd'),(706,'$ ls'),(707,'27501 grbwdwsm.znn'),(708,'231999 jdnsv'),(709,'113528 rmfmb.zzw'),(710,'dir tssm'),(711,'dir vgjfsh'),(712,'$ cd tssm'),(713,'$ ls'),(714,'dir dndv'),(715,'226375 grbwdwsm.znn'),(716,'$ cd dndv'),(717,'$ ls'),(718,'152739 sdjrzcv.tvs'),(719,'$ cd ..'),(720,'$ cd ..'),(721,'$ cd vgjfsh'),(722,'$ ls'),(723,'211409 swtbttb.vrp'),(724,'170879 vvfnf.hrp'),(725,'$ cd ..'),(726,'$ cd ..'),(727,'$ cd ..'),(728,'$ cd hsswswtq'),(729,'$ ls'),(730,'dir qdtbvqjj'),(731,'dir tssm'),(732,'86418 vhsgq'),(733,'$ cd qdtbvqjj'),(734,'$ ls'),(735,'118588 bwtbht.dwq'),(736,'$ cd ..'),(737,'$ cd tssm'),(738,'$ ls'),(739,'113460 gml.wdg'),(740,'$ cd ..'),(741,'$ cd ..'),(742,'$ cd lqmnjrlb'),(743,'$ ls'),(744,'dir tssm'),(745,'$ cd tssm'),(746,'$ ls'),(747,'dir jdfwmhg'),(748,'$ cd jdfwmhg'),(749,'$ ls'),(750,'64663 nswd.rwc'),(751,'$ cd ..'),(752,'$ cd ..'),(753,'$ cd ..'),(754,'$ cd mmrfrj'),(755,'$ ls'),(756,'319070 gltlwnlt.jzw'),(757,'232039 hspr'),(758,'104688 hsswswtq.jsr'),(759,'dir jdfwmhg'),(760,'88712 jdfwmhg.zcw'),(761,'dir pfr'),(762,'dir prnnpwcd'),(763,'45488 qdtbvqjj'),(764,'dir tssm'),(765,'dir wcmwrtjn'),(766,'$ cd jdfwmhg'),(767,'$ ls'),(768,'140910 bjjhtzct.stm'),(769,'$ cd ..'),(770,'$ cd pfr'),(771,'$ ls'),(772,'289538 qdtbvqjj'),(773,'217502 vvpwf'),(774,'$ cd ..'),(775,'$ cd prnnpwcd'),(776,'$ ls'),(777,'dir qdtbvqjj'),(778,'$ cd qdtbvqjj'),(779,'$ ls'),(780,'dir pqg'),(781,'dir tssm'),(782,'$ cd pqg'),(783,'$ ls'),(784,'222392 ptsd.ggr'),(785,'$ cd ..'),(786,'$ cd tssm'),(787,'$ ls'),(788,'158252 dcnvjj.zfd'),(789,'10486 jdfwmhg.qmb'),(790,'4374 qdtbvqjj.vqm'),(791,'254229 vgqfw'),(792,'$ cd ..'),(793,'$ cd ..'),(794,'$ cd ..'),(795,'$ cd tssm'),(796,'$ ls'),(797,'dir ptsd'),(798,'$ cd ptsd'),(799,'$ ls'),(800,'173766 fvlsgqb');
        INSERT INTO #rawdata (ID, Val) VALUES (801,'35658 wtc.vvd'),(802,'$ cd ..'),(803,'$ cd ..'),(804,'$ cd wcmwrtjn'),(805,'$ ls'),(806,'160089 chfhpc'),(807,'76202 frgpdnd.ngw'),(808,'138996 jsfsfpqg.nhf'),(809,'dir mlm'),(810,'dir nbdbzsn'),(811,'dir ptsd'),(812,'278574 vrnb'),(813,'$ cd mlm'),(814,'$ ls'),(815,'dir gqwhhmvd'),(816,'dir nrzvzgrt'),(817,'dir nzplht'),(818,'dir zzp'),(819,'$ cd gqwhhmvd'),(820,'$ ls'),(821,'dir ddmvjpj'),(822,'dir jdfwmhg'),(823,'$ cd ddmvjpj'),(824,'$ ls'),(825,'273423 jdfwmhg'),(826,'43605 pfwgtmtt.ccs'),(827,'$ cd ..'),(828,'$ cd jdfwmhg'),(829,'$ ls'),(830,'239406 qctw.vzb'),(831,'$ cd ..'),(832,'$ cd ..'),(833,'$ cd nrzvzgrt'),(834,'$ ls'),(835,'20712 gcwcp'),(836,'239372 gjgdvbwb.gcz'),(837,'dir hdzhl'),(838,'124814 jdfwmhg'),(839,'dir jfzr'),(840,'295071 qwjgwqp'),(841,'221611 shrzpsj.dwh'),(842,'dir tssm'),(843,'dir wdlsvzvl'),(844,'$ cd hdzhl'),(845,'$ ls'),(846,'dir gfwbd'),(847,'184323 hsswswtq.mln'),(848,'177147 nqgqz.tnf'),(849,'4680 pfwgtmtt.ccs'),(850,'$ cd gfwbd'),(851,'$ ls'),(852,'254870 cldm.fft'),(853,'301411 tssm.cvn'),(854,'$ cd ..'),(855,'$ cd ..'),(856,'$ cd jfzr'),(857,'$ ls'),(858,'dir dvvflnnw'),(859,'dir jdfwmhg'),(860,'216389 lwtwn.ttt'),(861,'201727 pfwgtmtt.ccs'),(862,'107829 prphc.ncb'),(863,'5816 sdvq.jvn'),(864,'$ cd dvvflnnw'),(865,'$ ls'),(866,'24741 brtrbwh.wwd'),(867,'27700 mljfb.ggb'),(868,'$ cd ..'),(869,'$ cd jdfwmhg'),(870,'$ ls'),(871,'325218 bwtbht.dwq'),(872,'63718 mvl.ngz'),(873,'162645 vtd.vgp'),(874,'$ cd ..'),(875,'$ cd ..'),(876,'$ cd tssm'),(877,'$ ls'),(878,'60903 pfwgtmtt.ccs'),(879,'332768 qdtbvqjj.jwb'),(880,'$ cd ..'),(881,'$ cd wdlsvzvl'),(882,'$ ls'),(883,'142213 vgvd'),(884,'$ cd ..'),(885,'$ cd ..'),(886,'$ cd nzplht'),(887,'$ ls'),(888,'275904 hsswswtq'),(889,'157369 jdfwmhg'),(890,'84363 jvcvmbm.fht'),(891,'dir qbjqgg'),(892,'$ cd qbjqgg'),(893,'$ ls'),(894,'331934 gcwcp'),(895,'$ cd ..'),(896,'$ cd ..'),(897,'$ cd zzp'),(898,'$ ls'),(899,'151335 flsd.zmj'),(900,'dir gwlhqlp');
        INSERT INTO #rawdata (ID, Val) VALUES (901,'99086 jdfwmhg.hft'),(902,'$ cd gwlhqlp'),(903,'$ ls'),(904,'201894 glcnpqzp.jvc'),(905,'$ cd ..'),(906,'$ cd ..'),(907,'$ cd ..'),(908,'$ cd nbdbzsn'),(909,'$ ls'),(910,'169929 bwtbht.dwq'),(911,'$ cd ..'),(912,'$ cd ptsd'),(913,'$ ls'),(914,'128999 bwtbht.dwq'),(915,'dir jtlrn'),(916,'dir pszlt'),(917,'dir ptjnh'),(918,'dir ptsd'),(919,'2981 qdtbvqjj.qcn'),(920,'dir rpb'),(921,'dir tcjgpqj'),(922,'dir tmddnh'),(923,'dir tssm'),(924,'$ cd jtlrn'),(925,'$ ls'),(926,'124888 grbwdwsm.znn'),(927,'30046 jznz.dwf'),(928,'$ cd ..'),(929,'$ cd pszlt'),(930,'$ ls'),(931,'154368 dbblsg.mzr'),(932,'$ cd ..'),(933,'$ cd ptjnh'),(934,'$ ls'),(935,'306974 grbwdwsm.znn'),(936,'82840 ptsd'),(937,'$ cd ..'),(938,'$ cd ptsd'),(939,'$ ls'),(940,'dir ftjhsb'),(941,'dir jdfwmhg'),(942,'304012 lqgtvmrl.qbj'),(943,'96971 mljfb.ggb'),(944,'$ cd ftjhsb'),(945,'$ ls'),(946,'56965 dhgds'),(947,'$ cd ..'),(948,'$ cd jdfwmhg'),(949,'$ ls'),(950,'dir lssbmtms'),(951,'dir vmwshd'),(952,'$ cd lssbmtms'),(953,'$ ls'),(954,'95453 gcwcp'),(955,'198402 mljfb.ggb'),(956,'1507 mzlmp'),(957,'40526 twlqhml'),(958,'$ cd ..'),(959,'$ cd vmwshd'),(960,'$ ls'),(961,'267087 pfwgtmtt.ccs'),(962,'$ cd ..'),(963,'$ cd ..'),(964,'$ cd ..'),(965,'$ cd rpb'),(966,'$ ls'),(967,'dir lqbchlbp'),(968,'dir ptsd'),(969,'$ cd lqbchlbp'),(970,'$ ls'),(971,'151429 ptsd.tjz'),(972,'$ cd ..'),(973,'$ cd ptsd'),(974,'$ ls'),(975,'28900 gcwcp'),(976,'55920 llt'),(977,'$ cd ..'),(978,'$ cd ..'),(979,'$ cd tcjgpqj'),(980,'$ ls'),(981,'dir cvdlcvq'),(982,'329232 hcmj.nvp'),(983,'232764 nvtmgc.qgs'),(984,'108056 ptsd.gcn'),(985,'39056 qdtbvqjj'),(986,'91792 tssm.wqz'),(987,'$ cd cvdlcvq'),(988,'$ ls'),(989,'46978 grbwdwsm.znn'),(990,'17760 qrdbsdpj.dhm'),(991,'$ cd ..'),(992,'$ cd ..'),(993,'$ cd tmddnh'),(994,'$ ls'),(995,'238434 gggvq.tfc'),(996,'$ cd ..'),(997,'$ cd tssm'),(998,'$ ls'),(999,'dir tlllv'),(1000,'$ cd tlllv');
        INSERT INTO #rawdata (ID, Val) VALUES (1001,'$ ls'),(1002,'198184 trmf.qqw'),(1003,'$ cd ..'),(1004,'$ cd ..'),(1005,'$ cd ..'),(1006,'$ cd ..'),(1007,'$ cd ..'),(1008,'$ cd zwvlhs'),(1009,'$ ls'),(1010,'19923 gcwcp'),(1011,'129179 grbwdwsm.znn'),(1012,'214660 pghcvh'),(1013,'101270 ptsd.gzl'),(1014,'dir srjlz'),(1015,'$ cd srjlz'),(1016,'$ ls'),(1017,'221301 nrcg.pqw');
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Parse raw input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #data; --SELECT * FROM #data
    SELECT r.ID, r.Val
        , ChangeDir     = CASE
                            WHEN r.Val = '$ cd /'    THEN '{Root}'
                            WHEN r.Val LIKE '$ cd %' THEN SUBSTRING(r.Val, 6, 200)
                            ELSE NULL
                          END
        , FileSize      = CONVERT(int, IIF(x.IsFileListing = 1,      LEFT(r.Val, CHARINDEX(' ', r.Val)-1)     , NULL))
        , [FileName]    =              IIF(x.IsFileListing = 1, SUBSTRING(r.Val, CHARINDEX(' ', r.Val)+1, 200), NULL)
    INTO #data
    FROM #rawdata r
        CROSS APPLY (SELECT IsFileListing = IIF(LEFT(r.Val, 1) LIKE '[0-9]', 1, 0)) x
    WHERE r.Val <> '$ ls'
        AND r.Val NOT LIKE 'dir %';
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #dirsize; --SELECT * FROM #dirsize;
    WITH cte AS (
        SELECT r1.ID, r1.Val, r1.ChangeDir, r1.[FileName], r1.FileSize, y.ReducedFullPath
        --SELECT y.ReducedFullPath, r1.FileSize
        FROM #data r1
            OUTER APPLY (
                SELECT FullPath = STRING_AGG(r2.ChangeDir,'/') WITHIN GROUP (ORDER BY r2.ID) + '/'
                FROM #data r2
                WHERE r2.ID <= r1.ID
            ) x
            CROSS APPLY (
                SELECT ReducedFullPath  = dbo.uf_RecursiveRegexReplace(x.FullPath, N'[a-z]+?/\.\./', '')
            ) y
    )
    SELECT c.ReducedFullPath, DirSize = SUM(c.FileSize)
    INTO #dirsize
    FROM cte c
    GROUP BY c.ReducedFullPath;

    DROP TABLE IF EXISTS #recurDirSize;
    SELECT t1.ReducedFullPath, t1.DirSize, x.RecursiveDirSize
    INTO #recurDirSize
    FROM #dirsize t1
        OUTER APPLY (
            SELECT RecursiveDirSize = SUM(t2.DirSize)
            FROM #dirsize t2
            WHERE t2.ReducedFullPath LIKE t1.ReducedFullPath + '%'
        ) x

    SELECT Answer = SUM(x.RecursiveDirSize)
    FROM #recurDirSize x
    WHERE x.RecursiveDirSize <= 100000;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    DECLARE @RootSize int;
    SELECT @RootSize = RecursiveDirSize
    FROM #recurDirSize
    WHERE ReducedFullPath = '{Root}/'

    SELECT TOP(1) Answer = RecursiveDirSize
    FROM #recurDirSize
    WHERE RecursiveDirSize >= 30000000 - (70000000 - @RootSize)
    ORDER BY RecursiveDirSize
------------------------------------------------------------------------------

------------------------------------------------------------------------------






------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION dbo.uf_RecursiveRegexReplace (
    @StringValue nvarchar(4000), @SearchPattern nvarchar(4000), @ReplacePattern nvarchar(4000)
)
RETURNS nvarchar(4000)
AS
BEGIN;
    DECLARE @output_param nvarchar(4000) = @StringValue;

    WHILE(dbo.ISREGEXMATCH(@output_param, @SearchPattern) = 1)
    BEGIN;
        SELECT @output_param = dbo.REPLACE_REGEX(@output_param, @SearchPattern, @ReplacePattern);
    END;

    RETURN @output_param;
END;
------------------------------------------------------------------------------
GO
------------------------------------------------------------------------------
