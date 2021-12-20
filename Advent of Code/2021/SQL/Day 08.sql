USE SandBox;
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
            ('be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe'),
            ('edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc'),
            ('fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg'),
            ('fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb'),
            ('aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea'),
            ('fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb'),
            ('dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe'),
            ('bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef'),
            ('egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb'),
            ('gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce');
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('ecbad fdeacg gaecbd gbae gfcdbea cadge fcagdb abc cfdbe ab | beag bac dacgbe aegb'),('gad agcfb afegcd afed gacdf gdfce ad cfdgbe cfgdeba bdcgea | gbdecf cdgeaf abcgde ad'),('ebadf ag efgcdab fgced edgbcf begcfa adgef gcaedf afg dgca | agcd agdc fagcbde gfa'),('bgaefd gfcbe fgeda dbf dafbgc dfbge bd bdgcaef dfecga ebad | dbf db edab dbf'),('ebfcgd fedbc adc da gafdce bdaec bdcegaf edbafc bdfa gbcea | afbcedg cedbf decfb eacbg'),('fdabec adefcg dcf gabcf fedgcba gdaebf dfcga gfead decg dc | beafgd fcd dfc dcf'),('cgfbd gfb cgfa dcgeb fg bdafge gcfbad acbfd fcdabe aefcgbd | abfdc cgfa gbf gf'),('dfae aeg cfeag ea fgedac fdcbega agebdc cdegf fgcedb abcfg | feda fcgba ae efcgda'),('eafdgb bfaceg fba bf bgdf agdecbf cdafe gabde dfbae agcdeb | bfeda ecdaf fb fab'),('agebf dgbcef dagc ebcgadf da dfcge egdaf dea dfecag fabecd | gefab feadg ead agdc'),('afbcg bdgcfe aecgf gb dcafgeb bgad agfcdb bfg bfdeca bafcd | gdba dabegfc decbagf acfdbe'),('ag acdgfb fecgbd edacbgf dgcfb gbad gaf ecbaf cagbf gefacd | ag cebaf gbdfce ga'),('ecbg gb acdbg dgceab acdegfb beadfc cfagd ecbda adfegb dbg | efdagb gebc gb bg'),('cdafgb gdebca edgbf becf fb fegcbd fgb egdfa cadefgb bgced | bf cbfaegd fecb fceb'),('bacgedf afdgb ebagf bfadec ebafcg ecabg fae fe ecfg cdabge | fe adcgebf gabef ef'),('cdgbaf ebadfc afcbdge gfeadc fgcde egdbf ce cagfd geac cef | dgfaec agec fgdaec ce'),('dcag dfeabc cba bfcdg ecdbfg egafb afgcb gcaefbd ca gfcabd | fcebdg dbegcf bcefadg gdfcb'),('cdgefa fdebg abfdg dba agcdf bcadfg cbadfe dabfegc acbg ab | fgadceb fbcgead bda facgd'),('fbg bf agbfde bgcdefa fcdb gcfebd efgcb ecgbd gefac gaedcb | cgbfe cfgbe fcaeg bgdfae'),('dafcg cefd fcg geafbd deagcf fcdgbea fbgcea abgdc cf gdaef | gcf fcg dfec fc'),
            ('cbea gebdfa ecbgf cfgdbe afgcbe gae adgbefc eagfc ea gfdac | agbfec eacfbg ea begafc'),('ba dfaegb afbd gfbea cegbf caegdb fdaeg dcfgeba feagcd abg | bafge dfba feagd gceafdb'),('dea bgade geabf adcfbe adgebf adgf bdegacf cdebg da agcfbe | dfag dafecgb dcaegbf cedbfa'),('fedcag fdebgca dfeab gdcaeb be fdeag fbge fadegb aeb bcadf | eba bae ebcfgda egfda'),('dcfb cgf abgcf gdcab adcgfe cf dgcbfa fabeg beacgd fgdebac | cgfdab deagfc feabg cf'),('adbgc cabgef adec dfgbec gdbfa cbgdafe dgc begac cbaged dc | cade bgafec gdc edca'),('agef eac fbceg ecgbfa bcdgea fceadbg cbfda eabcf ebfdgc ea | gfae badgfce acgdeb ea'),('cfb cdegfa badf gcaeb dbacgf cagdf eacgfdb fcagb dfgebc fb | bf gfdebc fcgdba cafgdb'),('dbgfae bgfeac bc cgb gecfd facb fbega fdgbace gbefc adecbg | edafgb cbg dgeafb fabc'),('geafcdb ec gcedfb acgbfd ecd cedfg gaefd bcfdg ecgb dcafeb | cde dfcbge acdfgb fegcd'),('decab acegf bfgdec cabegf bfc aebfc cbdefga adgcfe bf bagf | aecbfgd cfb bf cfdgbea'),('egf gfbade dbecg gdfeb edaf cadgbf fe cfaebg bgedcfa fadbg | fe gdfabc gfdbe fdbcag'),('fdgecb geb gdcfeba edagf dcefga dgbac bfdgea be eadgb ebaf | fdegba caegdf deabfg dgbea'),('egfbad efgacb bgfea cea gaefdcb cdeagf aecfb cgeb dbfac ec | ecbaf bafedcg ce dfaebcg'),('gecad dbeag dfcgea bd deb eabgf eabdfgc agbdec bcad fdcgeb | edb adgfce eagbf db'),('gdbac cbgea cdb gadfb cd faegdb dgfc dbceagf fbcadg ecadfb | facbdg cafdbe dc gcfd'),('cagbe abdgcf ca fcbgea baedg gac gdbfce ecfbg aefc gcfadeb | cafe face abcge febgc'),('gaebd fcba debca adc dacfge cfbde afdbce dgbefc ac fbceagd | ac becfd fcdbgae cefagd'),('cfdgbae abcgdf afbcg aecbg eb gedac bfgcea cbef fdbage bea | eabcg gcfba be geacdbf'),('cbfga faeg bcfae gbcda efbdac bfgcde bdefgac gf gfc agfbec | dgaebfc bdcfaeg gfea fage'),
            ('fb egacb bdacgfe afgbc cbf aebf adcgeb fbgace fedgbc cdafg | cfb cfbag ebaf fb'),('beafd cafbe gedfca dfebagc bceg ec fcbdag fbecga gacfb ace | bgcfad afdgbec ec efcab'),('abefdg bacgd ecfg fag ebfca fcgba gcefab beafdc fg agefcbd | fgec cfeba fga gf'),('degf adgcf edcfgba ead cbaefd bcega cafdeg ed dagce gbcdfa | ead aebdfcg agbdfc egdf'),('gfecdb dacfe dacgb fb facbd facedb bdf fbae bcdafeg aedfgc | bf cedaf fgacde dfb'),('gabdf cfbegad dbagfc decaf bgdecf aedgf eg egab gaedfb edg | eg gadfb abdgf gde'),('dgaf faecb bacfdg gbdac abdegc cbfgade fcbag efgcdb bfg gf | defacbg gcdfeb fgbadc bagcf'),('adfgcb feg aedbg fdgbc gafcebd bdgef fe fcdegb eafbcg decf | ef fdce eabgd faebcg'),('fb fgbde bdgefca cgbf fdb deacgb cefdgb bdafec aefdg degbc | bfcgde bdgec befcda dfb'),('efcgb fgcaed fcdbga fed acfdbge eadbfg edgfb de deab bfgda | fbgda ed fgdbae aebd'),('ecfabg dfegbac ecfbd cbdaf gceadb cgbdfa dagbc af fba gafd | fa bagfcd bafgdec af'),('bae dcbfag fadgebc acgbf fageb cbfega bdafce ea bfgde cega | eba efbgd eab bdecfa'),('dfgeacb fgcbed cfbdg gbcaed fcebg cd fced ecgbaf fdagb bdc | dc bdc bcgfde dcbfage'),('cgbeaf adefgb gbefcd cbfa bcfedag bfage cb ceb gcdae gcbea | ecb cb cegabf eacfdgb'),('gfbea adgfb dfbage fad fd agcbd defcga fdeb baecfg gcbdafe | df dgfab egbfa afegb'),('acedbg becgdfa dcfe gbfda gdceb bcf fc fgbdce cdgfb efcbga | fcgdb fbc bcf bcf'),('deb gfbdeca cead agbed dcefbg ecgdba bgacd gbfea de fdabgc | cegbfd feabg bed badfgce'),('acegdf cdaefbg acbgf df agced aedgbf gbedac adf cfed gfacd | dcegfa fbeagd edcf df'),('ecbfa dbegfc bcdga bgafedc bcadge gdcafb de bed bcade geda | caebf bdcafg eabgcd cbefa'),('edbcfg agedf bacgfd bdagf dfgcaeb gdabc bgf gdbaec fabc bf | bgdcef bf gbf adgcb'),
            ('fg afegcb gbf aegf gbfceda fcbgad decbg fabec gcfbe bacdef | bgf dgbefca fg agfcebd'),('eb fgebdc dcafge bgdeacf acedf bdae fecbda ecb fcgba cbfae | efgcda facdeb eadb ebc'),('gbafecd bgaced cabed eg bega fgadc fadcbe dge cadge dcgbfe | edg cadbfe cfgad ageb'),('badc fbcgde bgfaed cb febca fbc eadcbf gceaf aebfd bdfcage | acdb fcb bcad bdac'),('ecgfa deafcg bcdgfea ed cdaeg acfgeb aedf ecd gcbad bgcfde | ecd befgac de cgbad'),('cbeda bc ecbfdag gcabdf egbdca bgce aebfdg bcd gbade dcfae | decaf gacfdb bgce cbeg'),('ecdgb dc dbc cfegb decf fgacbe dafcbg gbcefd bacdfge gbdea | fdabgc cd gecadbf cbfeg'),('afbcdg gcaef degfca ec cge aedc efadbcg fgaeb gcfad fcdbge | aefcg fcbgda ec acde'),('adcfgb afe acegf cdefgab dafegc aedbfc dfcga fegd ef ceagb | dafceb cdaegf gdfe fe'),('gacdf bedgac bgfe bg gdb feabcdg fabdeg gdbaf bfade afdbce | begf bg egbcad gdb'),('beda aecfdg dgfaceb fegbc gbaec cba dbfacg gaedc ba dbcage | acdegf gcbfda aedcg edab'),('dbce ecgab cadge fcabg bfadegc ebdafg beg eb becdag fedacg | eb be efgdba be'),('cagebd df agdec fegcdba abfdce gfda cdgfe gdecfa cbgfe fde | egadfc fd cgdef dfga'),('da dgcafb acfbeg abgd dfbec fbacg fad fdagecb egafcd bfadc | feabcg fgaceb cbfeag bfgca'),('dcegaf dabgcf bedac febgadc fcdaeb eagcb cdfae dab db fedb | efdagbc bfdcga ebcagfd dab'),('bfc facgb deagbc fgeac badf bgdac bfdgac gcadfeb bf cdfbge | abgdecf afegc efgabcd fb'),('afbcde da bcfdge dbecg cad dgfebac dgbac edag cgbfa baedgc | gdeabc dega abdegcf dage'),('abfdc fa gabdcf gcbfd dfaebcg gbfeac bdeca acf cgbfde agdf | gdfa af caf fa'),('cfdg bedfca cfdbeg fdceb edcbga agbfe cg fcgbe bgc gaecdbf | bfaegcd bgc bcg cg'),('gcdafe fgec eafdcgb agdcf cfdea dgf fcaebd gf eadgbf adcbg | efcg cfge abgdef fg'),
            ('cadgf dfacb cb ebdcafg cbf ebcdgf dabfe fbaged bcea fdacbe | gdcaf gbcefd dagcf cfabed'),('gcbdafe acd bacegd feca ac fgbdc facdg adegbf adegf dcgeaf | ebgacdf begdfca cgdaf cad'),('bfdc debfac acdeg baegcf afecd afd fd beacf bfedga acdgfeb | baedfc egcafb dfa afecd'),('geacfb efdacg eag cagdf cdea dgebf eagdf fgbacd dbgface ea | cdae acdgf acdgf efgdb'),('gafced eacgf cgbfe egdca eaf af eacbgd bacefdg adcf ebafgd | dbgaef agedbc fcda geacdb'),('eabcg gadb acgdeb db cegabf fecad dgefcab daceb dcb cbgdfe | db dgab gdba defgbc'),('eacf acgdfeb dgace cgfda gbcfad ebdgc efbdga aed ae cegdfa | cfgad cgdfa ae gadfec'),('bfdacg gdbfc cfbadge fcagb bcfdeg adfg dgebac ga agb bfaec | fgbeacd bdgeca ag ga'),('fabedc ed abegfcd bdfga feacb fecd ebadf agecfb aed adcbeg | ed fcde agcbdef fadeb'),('afgdce ecgabdf fc debaf cadbf gdabc cgadbf cebadg gfbc fca | fgbc eafdcg ecfdbag gdcabf'),('gad agedcf gebfadc gafbd fbcgd da abdc begfa bcgdaf dcefbg | efdcga gbfecad befga bagfe'),('feg afgb abdceg ecdgaf faedbgc afbcge cebdf efbcg cbage gf | gafbcde bgecaf feg egbfc'),('ba fdcagb dab adcefbg edacg dfecb gdabec cgfead gbea cedab | adb abd baecd cedbf'),('ged acgd dg cgabdfe cedgba fdcaeb baegd adecb bagef dgcbef | edg edg cdaeb ebfcad'),('bgdfe dfgae eabgfdc fdaebg egb afbg fcdbe bg agdebc degacf | egb egb bge bcfedga'),('adbfc ceabdgf aced facedb gadfcb dbe cdfbeg fdaeb efabg de | deabfc geadcfb ed fabdc'),('bc badgce gecb dabcg egfcad bdfaec cdgae abgdf beagdfc bca | dcaegbf cb dcbfage gdbca'),('debgafc becgda bdgfca dea bcdfe dcagb ae ecgadf egba ebdac | ebgdac gdaefc bgae eagb'),('gbdae adegbc daf gadbf fd dgef bfacg eafdcb cgefadb eadgbf | dfgab df daf adf'),('gbad fbdecg bcgfea bdafc defac dgbfc cgbfad ba bafecdg fba | bcgdf ba edcgbf efgdcb'),
            ('ged gfecab cgfbdea aedc agefdb aebcgd ed dbceg abgce gdcbf | ged ged aegfbc dge'),('gbedcf be bfe afgdb aecb decafgb cgadef aebfd dacbfe faedc | be dcegbf cadbfeg cdfaeb'),('adfeb ecfadgb cbdefg ebdfag efag af daf acdbfg caedb fbedg | fdgbe daf daf af'),('gcbefda agfebc cedaf gface fecgad dc eadfb acd cdeg gfbcda | cgfdbea acd dcfea dc'),('gecafd aebfgd cde gcdf gdafe adcbge ecfba cgbfade cd decfa | egfadcb gbfdace cagfed fgcd'),('fgcdb gefcbd agb ag dcfegab bgcfda fbadge gacf bcgda dbace | degbafc agb dcgba gab'),('abfgde acdgfbe gabd gfecdb dfeca abgfe fdaeg gfd dg begcfa | bdag dgab gdafebc dfcae'),('eadcb dbcfe dgecbaf agdcfb cf fbc cbdfea abgedc fedbg ecaf | cf bfdace fbc fcb'),('ad efdgc cdafbg fecadg dbcegfa fgbae gdfae fbecdg adg cdea | decgbf acgbfde gabef da'),('gbf cdbgfea acfeb bedfgc adgbe gfeadb cegbad fg fdag afegb | gfb bgf cbefdga cafbe'),('adbcf gefb agbce acfbg gbfaecd fg fcg gceafd edagbc cfaebg | beagc fdeagc gf gfc'),('gdfbcea cdaeb egdbc fcgdbe gc cfdage gdbfe eadbfg fcbg cge | fbdecg fcegda bfdge bagdfe'),('adfbgc aegdb dc ecgdab dceb cedag fcgea dac ebagdfc dfbgae | efacdgb abcgfd egdab dac'),('dfg eacgbd ceadg gfac cefadg fg efagd gcfdbe begdacf eabdf | afgc acegd gf fg'),('fe eagfbd cgfab egf cadge begacd cedf caefg ecfagd dgbfaec | adegcb fe gdecbfa ecdf'),('da cedabg cfegad edacb bgcfdae dbcge gabd efbdgc adc ceabf | ceagfd bcefa cgdeb da'),('cebgdf bgcad dgface agbecf dfceg ecdbfag ae edaf ecdag eac | eca decgbf daef acefdg'),('aebgcd fdgcabe gecbfa fbgec bgfad gbecdf face cab ac acgbf | bfceg ca agdefbc efbgc'),('cgf caedf dfgabce gf ceagb bgaf cegdab fagebc dfcgeb fcega | eabcdfg fg gfc fgadbec'),('egfabdc gbfaed fcdea egadb fdgecb beacdg gc cge cedag gabc | bdgcef dceag gbac acedf'),
            ('ecfdgab bd cadb bdg cbgdfa dbfcge bdafg efgda acbfg afbcge | bgd bd bgd dbg'),('aef acbefg ebcgf ecafdb degcbf fcadg afcge gaefdcb ae bage | daegbfc fgeabdc abge beag'),('egdc dacgf cafegd ebfgca cadfe gc gdbfa gfc dgfcaeb dacbfe | dfgeacb gc cg fgc'),('ebadgf acegfd ad debgfac efdba ebdcfg gbad gdfeb beacf aed | fagdbe da adgb gebcfda'),('gecfb ebadcf gbdcae ecg fabce gbdef fabceg beacdgf cg cagf | ceg fcegb gce dfbeg'),('dabcge gbdafe facbed fbacdge ecgfa dabeg bdgf fb bef fageb | bdeag bcdaef fbgd bdaeg'),('ac cfabe ecfbgd cbefg gbceda efcagdb edbfa bca cafg ecagfb | cgefdb cfgaebd ac edgcfba'),('cef abefcgd cabfe facgde cabgef agdecb fabdc fbge cgbae fe | agbec fcdabge gebf dfcega'),('agcbed aefgdbc ca gfabd dca abgcdf cbfa efbadg fcagd fcgde | ca cad gedfc dca'),('gadfcbe dc bcdag cdb dbcegf dbagce dabge gfdeab agcfb eacd | ecfgbd adce fgcdeab cead'),('cbafed bcefag ga aefbdcg abcef fgabcd aegc bedfg afg gaefb | gfa gdbfe acbef ecag'),('gdefa agedcfb gadbec fegbd gad da gdaefc cgabfe gfeca cdaf | dcgabef agd fcgea fcgea'),('fgcea fab cgfbae cefab ecbfd cgfdae dgefab gebdfac ba agcb | deacfbg beadgfc cgab cbga'),('dag dfebca gd bcdfa adbgc dfgeba cfgbad ebagc badcegf fgdc | gceab dag gd dag'),('gefbd aedgbf dgebcf ea aefd gea fbgae decgbaf gbafc agbcde | bgfed efad agbfe fbecgd'),('ebfc gfe ef ebgacfd cefdgb egcbd degfc dcabeg dfbgae dagfc | faegdb fge gefdc egf'),('dgefab fbeadgc gcadbe bdgcef bcgae edca cbdeg gae cgabf ae | age ae cdgbe cfdgeb'),('agdbf fe eabdc efd bfdaecg dbcage bfdae bdefcg cefa acbdef | fe ef efcgadb bedfacg'),('fcebga badecg adcef cfg cdebg cbdegf gfbd gefcd dfbaegc fg | edcbfg bfgd fceda fg'),('df dfgbca gfed feacb bdf bdfegc dagbcfe cgbeda bdecf ebdgc | acdbfg edfcb debcf debcf'),
            ('dbc beac edfgb afdce facdbe debcf cb abdcfg gdecfa aedcbfg | eacb becdfa deafcbg cbd'),('gcdbfa afdceg abdfge befag gba efbgc ba cfeabgd dfaeg baed | feagb agb ba acdbgfe'),('gfdace ecdgafb fdegb ebdagc gb fcegd dgfbce bge debaf fcbg | bcdage egfbd gdebcf gb'),('bfa gface fb fabgdc dacfeb becgad bcead fbed dgbcfea eacbf | bedf beacgd gceaf caegbd'),('adgcb de edafgc egfba eda abecgf geabd abfged egbcadf bdef | ebfdcga ebdf ed dae'),('cgbed ebdgfc aebdcg bcdga efcbadg cfgab cfaged aedb da dag | bagcfed cdefgab cgdeba aegcbd'),('efabdg aedc cd fdcge cbdafg dcbeafg ecbgf fdgae dgcfea gdc | gdc dc aegdf dc'),('edgfca febgac egcfb efcgbd begcfda acg gdbea aegbc bcfa ac | bcaf fcegb bcaefdg bedfcga'),('ecfba bg cgdafbe cbfag cgbe aegfbc dafecb efbgad agb dgafc | bag fcbea aefcbg cegb'),('ebagdc fgaecd gcaefb dgceb ebfgd gcb dgfbeca bdac cb decag | cafebgd fcgdea adcbgfe cb'),('caedfb bdcegf dgac fad cbfdg gfabd gacdfb feabcdg da afgbe | deagcfb adf dfcgb aefgb'),('adgfbe ed eda dbaec bcagde egcd gacbe bfdac bagecf edfcbag | cedab bgfeda bdfac ed'),('abcgf cd edbag gbacd fcgd gfebca dfbgca adc bcgdafe facebd | dac fcdg gacdb dc'),('fagde badfe acdeg gbefacd gf bdgecf ecdgba fagc fecdga fdg | bfdgec dfg gf egcadbf'),('aedcfb cadeb agbecd cfda aefbg ecabgfd fbecdg bfaec fc efc | dcfa acfd dcaeb fagbe'),('ecbdga bacefg ea dcefb bcdae adeg dgbac fcgdba aeb cgafbde | dcbea ae cbefd aecdbg'),('df ecabgf fbde efgba fad dbfgca fdebga fegad cdgbfae acdge | daf agced egfba fcdbega'),('bfaecg gfdaebc dgec dcb baegc agdfb cd befdac bcdga cdgeba | decfab dcb cedg agdbc'),('gbadecf gbef gadec ebdcg bg dgb gcbfad dcfbea bfdecg fcbed | dbg dgb gb bfeg'),('bdfca cbdea dae ebgdfac cabedg efcbgd egdcb ae agce badfeg | dabcf dcabf dbecag cabedfg'),
            ('edcafb ed aedgbc cedbf dgfbc dafe abefc deb cdfbeag bagfec | fdea ecabgd fcbgd ecfab'),('afbdce agc dcgf bcdag cedgfba dbgcfa bacfge gaedb bdfca cg | cbafd dcgf cg edbacf'),('eabfgc cfaeg cbfde adgbfc bface eagb acdbefg ab acb edacgf | ba cfdgab ab ab'),('egdfb dfbgaec dfaeg abgedf defcga egba feb dgbfc fabdec eb | efb eabg fbgcead aegdcfb'),('df fbdace gdebcf efabdcg dbf cagbfe efgd gbcda cgdfb cebfg | bgfecd aedfcgb dfbcae abcgd'),('ebgacf adcebf gcbaf df adbfcg bdcfega cfgbd dbf gecbd fadg | fcbga agbefdc fdb fadg'),('bagfe efcab cbf cbfgad abgfed faecbg begc cb daebfcg feadc | bcafe ecgb fcb cb'),('afdecg adbfeg cdgebf fecbgad eafc eacgd ec ceg cagbd afedg | gec ce ecfa fegdca'),('fgcade fbadeg abcedf ebcgf adcgfbe eca dafge ac cagd agecf | agdc cdgfae begfc geafcdb'),('cadbeg beagc ba afgbed cefdga bacd fecgb caedg gfebcda bag | gebacdf fcegb gdebaf ba'),('fbgad fcad egdab fdb cbedfg cbafedg gdcfab fd agbfc abcegf | df dfagecb gbefcd aebgcf'),('gbacfd ebacfd fcadb eagfbc ag adbgf cedfgab bag dfbge acgd | ga ag ag acbfgd'),('gebdfc fbedac efbag cdebf dg decg fbgadce egfdb dfcgba bdg | fegdb dfbec fbdacge dg'),('dbgfc fabcd fcegb bacdfe bgd eabdgc gd bdagfc fadg afdebgc | bcgdf dg dgb gd'),('aefcgdb faegcb fead edc aecbd bgcad de bfaec bdegfc afdbce | badfec cfgeab gbacef baecdf'),('fecdga cdgaf gba dbcafg dbfg cbfae agedcb dafgecb bgcaf bg | fdbg bgcfa dbagcf gefbdac'),('fea gfdbec abdf abefg edbgf bacge dcebgfa af egdabf cefadg | abfgdce dacfegb efa efa'),('bdgafc ebcgf bfea dgcbe abfcge egbcdaf efc gabcf ef cgdaef | fce fe fe fgbac'),('gadefbc dg egdcaf fdcbe caegb gcfedb dfbg gde edcbg fedbca | aebgc bfeacd cgdafbe gebdc'),('ec dcgfe aebgfd cagfbde fec dcgfa ebdc gebdf cbfdge ecbafg | egdbf cbegfa ebdc egcfba'),
            ('dcbgf dcgeb cf dfc fgdbeac eacdfg gcdabf gafbd adfgbe bafc | cgdafb bfac dgeafc fdabg'),('aefbcd cadgf eacdg bgade facgbd eac ec dacegbf gfec acfged | gecf bedagfc geadc eac'),('egcab eagdfc egcdfb aegdf dec afcd cgead eadcfgb agdfbe cd | eafcdg cgdae aedgc dbfacge'),('ag bfdcge gca bgcef fgcae bagdfc egab bcdeafg afdce abcgfe | fdagcb ag egab faegc'),('abdfgec bgdca edcg abedgf bcd cd cgeadb fgcab dbgea dacefb | cbd dgbca gabdce dcfbaeg'),('eacbg gbe egacd dbecfg agedcb bg dgab edfacg cafeb fbgcaed | dgba dgab aecfb gb'),('fcgabe fecab fabedcg edbca bdgfce afeg efbcg dabfcg fab af | bgedfc afb baf ebgcafd'),('badcgf bef cgedbf fbagc ceafbdg begfa afgecb eabc egfad eb | abefcg fbgae gebafc gdcfeb'),('dafecg defbc fbgcae dbcg abfed gecfd ebc cgefbd cb dfagcbe | cb ceb bdcg bgcd'),('acgefb cae dgecbfa fcead abfdc gdcfe dbae bdcgaf ea dbface | cefdg cea eca cefdabg'),('fab egfda fb egbcda bgfc gafdb afdbgc dfebac gbadcef cdabg | dbcfag fb bgfad ecafdb'),('bgace badceg fdeacbg bedc gdebfa bge eb cdaeg dgefac fcgba | be fcabgde gdcafeb be'),('cg dcg gdabcfe dcgfae gcdea abgdef fgec abedc bgcafd gadef | gfdea cbead ecfg dcg'),('aecbfg edagc edc edcgfa gcbad gfcae gefd adecbgf bdafec de | cgaefd efcga cagef bgcaef'),('fedgc dafecg bcedfag agdbc dgbfec bge dbceg bcgfea be bdfe | cdgefab gdabc gbe eadgfc'),('eagf fcgbad edgabf cfegbd efb dbeaf decba fbgad bfedcag fe | dfbaeg ef ebf fbe'),('cebfag dbefgc cdgba dcgaeb dfbagce dg bgeca aged adcbf gdc | cbdegaf gefcab abcgd daeg'),('gafdb bdfea afbgcd fgd dgcfaeb gdbc facbg gd acdfeg efbcag | gdcb adfeb gcafb bagcef'),('fdaec adbcf acegfbd efbdag afcedg ea gbefdc geac cfdge ead | aegc dgcef fdcae gcae'),('afcbed dce fgadc gcea abfcgde dgefb ec bfagcd fadgce fcegd | efbdca bfdecag cde cefgd');
    END;

    IF OBJECT_ID('tempdb..#part1_data','U') IS NOT NULL DROP TABLE #part1_data; --SELECT * FROM #part1_data
    SELECT r.ID
        , OutputValue = x.[value]
        , OutputOrder = ROW_NUMBER() OVER (PARTITION BY r.ID ORDER BY 1/0) -- Relying on STRING_SPLIT ordering, not good, but good enough for this
    INTO #part1_data
    FROM #rawdata r
        CROSS APPLY STRING_SPLIT(SUBSTRING(r.Val, CHARINDEX(' | ', r.Val) + 3, 1000), ' ') x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    SELECT Answer = COUNT(*)
    FROM #part1_data o
    WHERE LEN(o.OutputValue) IN (2, 4, 3, 7); -- display digits = 1, 4, 7, 8
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    /*
        Not sure if the wiring needs to be determined for every input record,
        or if you only need to do it once to decode the whole dataset

        I'm going to assume it needs to be decoded for every input record.
        If that's the case then building a one-off mapping table won't work.

        | Digit | Segments |
        |-------|----------|
        |   0   |    6     |
        |   1   |    2     | *
        |   2   |    5     |
        |   3   |    5     |
        |   4   |    4     | *
        |   5   |    5     |
        |   6   |    6     |
        |   7   |    3     | *
        |   8   |    7     | *
        |   9   |    6     |

        We need to figure out how to map 0, 2, 3, 5, 6, 9 to their criss-crossed values
        2, 3, 5 have 5 segments
        0, 6, 9 have 6 segments

        Perhaps some sort of checksum could be used? Where AB = BA
        Or maybe a bitmap. Where 0101010 could represent which wires are on, and use bitwise operators to determine relationships?
            For example, 
    */
    ------------------------------------------------------------------------------
    GO
    ------------------------------------------------------------------------------
    CREATE OR ALTER FUNCTION dbo.uf_SplitDigits (
        @string varchar(200)
    )
    RETURNS TABLE
    AS
    RETURN (
        SELECT i.DigitOrder, i.DigitSegments, y.Bitmap
        FROM (
            SELECT DigitOrder = ROW_NUMBER() OVER (ORDER BY 1/0)
                , DigitSegments = x.[value]
            FROM STRING_SPLIT(@string, ' ') x
        ) i
            CROSS APPLY (
                SELECT Bitmap = SUM(x.PowerValue)
                FROM (
                    SELECT PowerValue = POWER(2, ASCII(SUBSTRING(i.DigitSegments, ROW_NUMBER() OVER (ORDER BY 1/0), 1)) - 97)
                    FROM STRING_SPLIT(REPLICATE(',', LEN(i.DigitSegments)-1), ',') z
                ) x
            ) y
    );
    ------------------------------------------------------------------------------
    GO
    ------------------------------------------------------------------------------
    CREATE OR ALTER FUNCTION dbo.uf_DecodeSegments (
        @string varchar(200)
    )
    RETURNS TABLE
    AS
    RETURN (
        SELECT x.Bitmap
            , Digit = CASE x.Bitmap
                        WHEN x.Segment_0 THEN 0
                        WHEN x.Segment_1 THEN 1
                        WHEN x.Segment_2 THEN 2
                        WHEN x.Segment_3 THEN 3
                        WHEN x.Segment_4 THEN 4
                        WHEN x.Segment_5 THEN 5
                        WHEN x.Segment_6 THEN 6
                        WHEN x.Segment_7 THEN 7
                        WHEN x.Segment_8 THEN 8
                        WHEN x.Segment_9 THEN 9
                        ELSE NULL
                    END
        FROM (
            SELECT x.*
                , Segment_0 = FIRST_VALUE(y.Segment_0) OVER (ORDER BY y.Segment_0 DESC)
                , Segment_2 = FIRST_VALUE(y.Segment_2) OVER (ORDER BY y.Segment_2 DESC)
                , Segment_3 = FIRST_VALUE(y.Segment_3) OVER (ORDER BY y.Segment_3 DESC)
            FROM (
                SELECT x.*, Segment_6 = FIRST_VALUE(y.Segment_6) OVER (ORDER BY y.Segment_6 DESC)
                FROM (
                    SELECT x.*, Segment_5 = FIRST_VALUE(y.Segment_5) OVER (ORDER BY y.Segment_5 DESC)
                    FROM (
                        SELECT x.*, Segment_9 = FIRST_VALUE(y.Segment_9) OVER (ORDER BY y.Segment_9 DESC)
                        FROM (
                            SELECT [value] = x.DigitSegments, x.Bitmap, m.Mapping
                                , Segment_1 = FIRST_VALUE(x.Bitmap) OVER (ORDER BY IIF(m.Mapping = 1, 1, 0) DESC)
                                , Segment_4 = FIRST_VALUE(x.Bitmap) OVER (ORDER BY IIF(m.Mapping = 4, 1, 0) DESC)
                                , Segment_7 = FIRST_VALUE(x.Bitmap) OVER (ORDER BY IIF(m.Mapping = 7, 1, 0) DESC)
                                , Segment_8 = FIRST_VALUE(x.Bitmap) OVER (ORDER BY IIF(m.Mapping = 8, 1, 0) DESC)
                            FROM dbo.uf_SplitDigits(@string)  x
                                -- Start with the obvious...1, 7, 4, 8 are unique so we can hard code those
                                CROSS APPLY (SELECT Mapping = CHOOSE(LEN(x.DigitSegments), NULL, 1, 7, 4, NULL, NULL, 8)) m
                        ) x
                            -- Digit 9 is the only unmapped digit which shares all 4 segments of Digit 4
                            CROSS APPLY (SELECT Segment_9 = IIF(x.Mapping IS NULL AND x.Segment_4 & x.Bitmap = x.Segment_4, x.Bitmap, NULL)) y
                    ) x
                        -- Digit 5 combined with Digit 1 looks like 9 which we previously decoded
                        CROSS APPLY (SELECT Segment_5 = IIF(x.Bitmap <> x.Segment_9 AND x.Bitmap | x.Segment_1 = x.Segment_9, x.Bitmap, NULL)) y
                ) x
                    -- This is a bit trickier. Here we take the xor of Digit 9 and Digit 5, which leaves us with only a single segment. Adding that segment to digit 6 makes it look like an 8
                    CROSS APPLY (SELECT Segment_6 = IIF(x.Bitmap <> x.Segment_8 AND (x.Segment_9 ^ x.Segment_5) | x.Bitmap = x.Segment_8, x.Bitmap, NULL)) y
            ) x
                -- And finally...Digit 0 is the last 6 segment digit; 2 and 3 are different by 1 segment, so we "and it" with Digit 1 to see which is which
                CROSS APPLY (
                    SELECT Segment_0 = IIF(LEN(x.[value]) = 6 AND x.Bitmap NOT IN (x.Segment_6, x.Segment_9), x.Bitmap, NULL)
                        ,  Segment_2 = IIF(LEN(x.[Value]) = 5 AND x.Bitmap & x.Segment_1 <> x.Segment_1 AND x.Bitmap <> x.Segment_5, x.Bitmap, NULL)
                        ,  Segment_3 = IIF(LEN(x.[value]) = 5 AND x.Bitmap & x.Segment_1 = x.Segment_1, x.Bitmap, NULL)
                ) y
        ) x
    );
    ------------------------------------------------------------------------------
    GO
    ------------------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#part2_data','U') IS NOT NULL DROP TABLE #part2_data; --SELECT * FROM #part2_data
    SELECT cInput = LEFT(r.Val, CHARINDEX(' | ', r.Val))
        , cOutput = SUBSTRING(r.Val, CHARINDEX(' | ', r.Val) + 3, 1000)
    INTO #part2_data
    FROM #rawdata r;

    SELECT Answer = SUM(CONVERT(int, x.Val))
    FROM #part2_data d
        CROSS APPLY (
            SELECT Val = STRING_AGG(i.Digit, '') WITHIN GROUP (ORDER BY o.DigitOrder)
            FROM dbo.uf_SplitDigits(d.cOutput) o
                CROSS APPLY (SELECT i.Digit FROM dbo.uf_DecodeSegments(d.cInput) i WHERE i.Bitmap = o.Bitmap) i
        ) x;
------------------------------------------------------------------------------

------------------------------------------------------------------------------