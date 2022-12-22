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
            ('vJrwpWtwJgWrhcsFMMfFFhFp'),('jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL'),('PmmdzqPrVvPwwTWBwg'),('wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn'),('ttgJtRGJQctTZtZT'),('CrZsJsPPZsGzwwsLwLmpwMDw');
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('jVTBgVbgJQVrTLRRsLvRzWcZvnDs'),('dhtmhfdfNlNNldfqmPCflqGbNZDHsDWcRzvczWsczZNzHz'),('tmwwwCCfbJSMbwMb'),('hsrZZhHlhrHmPPbMbDFDQdnQgLfMFDdDQQ'),('GpBtwtqrcCcjgnLgqfgDDgRn'),('cJwVwpCpGJctJtBcCrSCGrVJhlsbvSvTvbmHmmsWmHslmsHm'),('gCtWJvmfmGGwVVMhJw'),('nzRSpZbSVFFRDFSDzcplddqplqMhQMclMp'),('zFLszzRTDnZnbTZTRZsVNgCjrvfvgtvNmtfvLW'),('glRQRpQQtQtGtQws'),('TnmbLqvBFRFFLPBFnPbvRBhshTtHWhwzdwtHdsdzWhws'),('qmCLPNmCFnLBnmPPqVbFLRrJjVggDgJjlZVVDjDlDD'),('vRRgpWvPQFdTFDDNQs'),('bqtCmltmlbwqLVLZqwtmLBBTMcGBddTTBgFNGcZGMD'),('bbtmJmjlVlwblwwbwzbbvrrznvzShgRhRvhfWrWn'),('ZMhThfNcpbbMNNjsHpmpsRqsPmRs'),('wQjDgggQDPqqDlsD'),('SCwSzvLVCSVtQVgLnrccfdGdTdZfcZMtjJhG'),('wNnNmNHnNPPwwPGCrLSZZvdVVZvBtMMvdm'),('WQzlhzjzbBtMMlBrMl'),('szbgWhJjTTcsWTqgzsqcsGHfwNcwfwnHHrCGCPPGwr'),('CNsbpFCMSrmDhQHNNGmH'),('fQPPPcqvljQzjVDDgRBhGGqDgqqD'),('ZctlcVzcfltQtnrndbQMCM'),('NQjQjQvZvZjcvrrrNjgTQgBQwTJsJswJlbGstqqtmGhmwhqw'),('PWpHRzRnPHHSCnPFwlqhbtqGZClJqGqG'),('ZzVpMpWPHnVzzpWzDRzSZrcdDQdrQNrcQgQfjcNfjf'),('BSZMtdtZBzMFvhCbBJDbhDDC'),('qcqVVmccrmVcjrlHqTrjDJRPQhWvPWWfPvblffDf'),('cHTrbGwpmGwVjdFMnzpLznMztd'),('DGDGGbNgTgJQQLMRMMTNVzvPsPbdsfPVsdVVZfPf'),('lcCmmlpwwnwSjCHtFpCpHzCrZsVrBZZzdvDfVrsfZd'),('lSHwnjpFmppHqppttttcFmnhMLGNRLhTMDqJLQNLLQNLhJ'),('WqWfDWBjBjLbfcbbqGbWqQsrFFztsppMFCzgCJzJCrFpCM'),('VRlhdHZTZVRRmZwlmFrJwFpMMDDrrrtJwg'),('PPVddvvDZmRmHvndTHmLcbcjSjLQBGWGGQWSqP'),('HHvgvwHMPMwHwmcRfJNFchFGNNCm'),('BsTDsjzBCCBJGffN'),('jznSnSdqzqnQTbdDljQjQSMHWWvvgWvtZlrWpPfWwtPr'),('DJCJJCNjCDRfDfDRhDnNhfjFPgbGbddBTjFdTFTPbgGSdF'),('cmMcMVqBZVcwsGFgGqgWdFqb'),('vcZVzwmHVcrtrwMMvvmBHwNNCDpQRfhLhrNJNfJDDDRC'),('VWSSScsncpDRdnsWsVncVzTwMMMHtMTrLTLMMVHM'),('fjJvQqBCQNhfQlZZnqmFHLFMTFTzwzLzrHMB'),('CqfjjQZJPjjvpRppDPgbnSnP'),('tLnjNwjRWttdCwRLsfGzfzPbzbWbQQPT'),('cvvBvlBrFrlTffsbfTqZ'),('vmrFpsrvFMMMNwhtDwhN'),('wzgRNqwtgzMWtqGwCssBBSBZnSRsrQQS'),('bbjLTmpjpHcpVncVdmffPCDrjZDSDsZffDQC'),('pbVFncvvbpbbHJJHVdvqMGMJNwWlNlJMwqzlNM'),('TdszlzFsRQqFdRzqwwQGlFsGmmSBBdmdVVmgSZdSPZBBBmSD'),('HMCCMbJHJJLHSmSvZLBcSDBP'),('NWbhPjfrbbNfWCPjhNnGsNzsqpQszTQGRwGQzR'),('ppQpTNCPBTlNBVmNQTNrrrrtqsrWbGrVFWqhZb'),('DMvDHnjRvMDLghhhgbqZWbqFSS'),('vWvMRRJDLMnHLJjDwWnnndcllNTzBmClQBpBBzQQzCBzCJ'),('VsNZfPMnrCnlCnWtbvBbvwtTbZwT'),('JhJQdQhmRHDRdLmHJhljhphgGwtttmcvbwwTWtvtbGBttc'),('jqLpjSLDHlhnffCMzsqCPP'),('JzJdLRmmzJwrLLwLJwLTWwBrMrpHlFnScVVqccrBHSlc'),('tvQDQhjhvbqFqFSpjHSV'),('QbgZtsgfbNNQbgbsbQRfmWRJwJGWWTPRwqzR'),('MwvDgpwszSpSJPsssMccTQfTDfTQRTljfRfT'),('PmGbWhbVtZWPTqRrcTrrjTrt'),('NbZbWHBmVGmLbZVBVNLPsMBzwSSzMJMCsCzvnvSp'),('cTpgTnpzbZlJHTZm'),('jRrLVtqtvtrjqsHZhvpmBfJHmhhp'),('FqDsFLCwCVRDqwgNQcQMwnncnMpg'),('sCCtssdZdZJmMbNJDmtmJzLSrcGfHGLTHDHnGLrHTSSn'),('gQwRRWqwqgpggFWPjPpFnSTSnHNfLLQrccrLGHLL'),('qqlpqhjFwPgPwvvRgFlPdslZCzMZtVdtVdVMtJlN'),('BWVmPtRVRRWDNtZBVQzCfdscmfjcfdfzzSfz'),('MhgJLbGggHbqpGgpgJbrFJdjwsCChCzllzCdjDSszCCD'),('grpDLFrbgpJnqJrHGFHGqMHBBPRWQTPWZBQVTQWnPNVvBt'),('gJfggdmHDgfJJWzCcbqvcqcmTG'),('hLZlRBZNlBlrpprzrWqvtHvvGtbvHT'),('sNLRjHZLNVnZZVLppnhNsMFJSjFPPQMjwgMPPfDMfS'),('mDDzHfrPBvJRJhpBRg'),('SsTSTwJwcbCtwssGFVWppgZRbLpLRNhpLhbLvg'),('ttVCGjTGrfJJMfjD'),('ffhcsTjnfqHLqvZSHvHB'),('CsgmPVmstsQVpRbHBvFbHBDMvZLZGB'),('ppgpmmRVpVPwPrrrTNlcrwrlWs'),('NDtssPNBjQtCtCcT'),('ZZqncfqhZqhJZFTJTllCGVljSl'),('ndrWbfZwWhngwbqbZnMZcwWhDmmLDmzvHPvzNLdmzsvBBHHP'),('FQtptwMppSFQRRQfSfvTrTJJJTrvLjMMJbgJ'),('CcDqWBWzbldcchDGCWBCBhdGrvhnrsrjjsJvLvghrjjnnjsJ'),('GDBldPDGqPGWVBBcwHFmSmbpSpNRwHFV'),('CwHwCFwtCmdCDflHDpwFnnvzhhNJhJNzmhzhhNMM'),('sTbZssPqScTrqSWSShdMvgMRRzdRRQ'),('brBrsWPTrdrWsPcBcTcGqDLDDHjFfDClwLLBfFlFlw'),('lNptNFWpbVMjlBgQgvdNBRQLrd'),('TsDCDfSCQqqQQqDq'),('TwTmwPPPzZSCccScJwpWZHljtbWMFFQVHpnj'),('fhFmwbrgnCcSnwtS'),('vZVVZvQZVPZsMnNSccMHPN'),('ddzvQJvQzBzWRTJzdRVSWGqbRbgmfbFFbmbgmpmlff'),('wdslVdQtdlBVHDrHBcBc'),
            ('TJWvpncCcJzCWcRfWvJRRpfZHBDZZHmDZPBjZHjZrSfb'),('TRJFvvWpTRRWCpCgGtgtGQdlcNtsGlwg'),('rCHvRLJtCjpbRCLpptHMVCQgGlMndVlQGNcCMc'),('zZfzSmsfSsMzMccQMVcN'),('ssSmPmSmhwVhZBZsTBRJrtRjtbDvjvrTHLtJ'),('wswRCNHHhsrWFsGfGWFBGb'),('lLtngDPLgLJPttgWzQWlbCfBlmBFCW'),('DcDnVpcnnJPngjjcdpRhwNZSCZNdNdvr'),('NWNzWpfMRHfwsRNznPdjtdjJtPVPHVdJ'),('CSLTZBrGbSmClvBVdGzFVVcFdjjjnV'),('SrZhZbTvmmbbLvwQzMhsfhqqWwQR'),('vvZqwFBZvzZzrqltPsQstrGGpMcbbR'),('bhJdjJJmTRQMTMMPPM'),('mCmgLbdVVVLhVnJmLgJhBWZFDlqFvwZDlZBnBvWB'),('sMrcmQcHHsLLrSHZhvdCddvtJJFl'),('jzjjWplWpPRPDzPzfRGjqvdJqqqCtqdqDvdDqtwC'),('pPNWVpGGVVffPlnSMnMsTmgsQVLr'),('zGMMRbpGmqqqNRmmzbNfbzPRPlvThCTrHPnrHSVPlTHR'),('LSjjwgsjtTjhPhHhvC'),('dJZtJwFgtBLDZZbmNMGzMMqS'),('ZrnstppPWccnsFWpnZnRdjRtjbCtSSRjjjLLbG'),('JgBQPJvPgHHJvmmzwGGLdjHGSjShGHqdHL'),('wTJvPzmTJvzJQBfwNmTmlPsrVfnVFpcMVZprDpFrsrVc'),('ssGCtltsSdJJtQjPdvHvfbfvqLHqZtBfVb'),('pzRwwDwDTgzbqVTVvHqVWB'),('grzHnRpmFpDMnmzFhplJCjlsPdGJSjsFCdFs'),('CTGBBGCBlSTTSsnTMrQbNrBMtpVzNddWHWzVpHVtdHmwhphm'),('JqPZgMRFFvFZvDZMDFcFFfDchdtdPWpzpWhtHWwwhVzWpddW'),('ZfLZMcgqRDjgjcLccDRDLsbbrSBBlQGQBCTrCBnT'),('VjVGVqSqFLFVSqCjFJSsbfPprHbCCRRPccRWPW'),('wwnQmtwlvNmpZRsPsWWNbZ'),('DBhhhznhddldnvjMqJMTqDMGPSjF'),('TTJbsJPPBDsBVbJJGJBGWLfmWzgmDmzmLqmmLddQ'),('jHwVZZjwFZlzLzWZLMdLqM'),('HHHhjHplrHSpcCSvjlsNPbNRbRnVTrRsNNNJ'),('NzMMLZtwRmbwFnVDhnqD'),('SlsJsSdSJdNJnFphVHFjph'),('vlrsTlGPTgvvSBScGcBvfzmmLLCtMWNZRBQMzftf'),('tRFLmZZRLrtRvtvvrvvGgvtLNfwzMzNwgdznMpwwpnMpqHdz'),('hcsBsWTcQJhjbHMncNwzMqnzwl'),('VWSWWTJhWBVDTJsTVWQWTVVbZtCPSvrrGSLCRFRGtRZLPmmq'),('hbdFhdShGsFSGBlQhNhQMLLLlLJCvLLDtVJDLlwtwD'),('WcqWsmcWrmqcmtDHJjVHrJCjjt'),('WPWcnggssmzqzzzgfzZnWRqqdGpSNFdMSFdBMSFZhSFBZZhh'),('GNFNtRQMGjDjwfgDZjmz'),('bqDsPWWbsqVsdvvBJvBfmgfLLzSwzLcmzmfB'),('WPWrrVrrVJhVWJDVsqnPdRQllRQRNhQGMlFQFMplGl'),('mChChmSQGSGJrjPHCpPFtwgsFZjtFVZfgVwtdV'),('MBMqvDWMlTbzlRWzllDzblZfsrgdZffgrtwrswZfdZTd'),('DlcMvBbBMnqMDqcRqDBMWvLmCGrGLSJhnLHCCHHnPmSQ'),('tscfGqftGfDnnppJGDGCZLbzMVMwPPhsblzbjzzMMz'),('TWPTWWmHTmFRSBSvgBPwwwlVzhMdwblhbVjRLL'),('TTQNNWWgHWQHPBWTNPWNcqJtGCnfqfpQZJCZpQZn'),('CqzCGDQJCzzftfRqRzzMdvFpFpccdZFvFMtMbd'),('rNHwmHVmswsHVsPTLnbFSTbZZpFcpvSZZgpg'),('vPLhLLwHLhVVNVvQhBqDCBfhDzCffG'),('WsBbBbsWNhsPsCNssRWLPLpmLDDQHlJlnlzFnDDnzF'),('gcGfqggMqfjjGwrdDZzQFmpJQzZlFDMF'),('qdwqvjdTrwfvvBCPtpVvtR'),('RQdbbRHtHRvqZtwVcmwVwV'),('WnLNnqFDlDWzzNLLrjClwCZCGZcglGCccZ'),('LnTFfWBpffrfrhBqdsSBqhBJHb'),('sqsgJpDMrNQgGsFMsPCfjCPChPWjqSWSjh'),('RBnRnZVcwZllLwbwwLbZVLclhpjRttSdtjPhjWShWdphjCPd'),('HwHwVVwVnBVBmmGppNFzrrsgJJ'),('WpmDFlQlzmmgMMLMLQVTvTTSwNbmTVwTtHHw'),('jrhPDnDnnZfjPTNtHSVTcjccwt'),('CJqPfGnhGZCBfnPJCrBCqdLqMlQqDLlLRgLQFFRW'),('vZVvDZsvhDZhZvzgVcgVqPqmwWMqcw'),('bdTbdBBFQcdCdcGmcP'),('bmjQpHfbpzDJRjNhJZ'),('twRrwjFptprQjjjtQRdWCmNJTlNSCmZQcNlmlSST'),('VVDzMWDnDHMzLZDNNJSqqCJZZD'),('HHhhsfVHGbnwgjfrgdpgWj'),('GmszZGMrLmnmsfGVRcVlwtwccc'),('SSCgbNqSTgCCJMHCJtlVcwVbVljlclVfwf'),('HTCgHSgHQThMqWQQSgDnvBdsFDvrzdZsLdmLZZ'),('PRlMlBPPctVBlstzVLhsdwCqCdCNDjSDdWmMqdNw'),('fZrQQHFffgGFprSJSgvZrfnqjmWdnndCNGWmWDwNNDCG'),('rTvvpJZZrfpFSbQQvrrsssLRVPPtlRtRPThzTR'),('FqgHFFMRTRjRFRpRRjFtNdCtJCMnNNdrdMLdrQ'),('VhWSmwGwWVbGbvlwwlLZJLZSdJZtNCtnTSCJ'),('BmWwWWzhvVfwWhmhwlmvwlRqHpscHRTpTDRFfTsjDPjD'),('MJMgGqMFLPGgWVjpcmjZTpmZjZpJ'),('hdSzzlCtzNdtWSdndttflBmjpBRmvvpjnjcvBjmvHj'),('zdhCrfztrDSzfWzdChrhlhgPPPGDgqFFLGGFVVqqPVQw'),('ZQZNQRZzFdCCgfLcCGDfScjDcG'),('vsmwVHTmTfGcSHjcDS'),('tMsmMVlSWWzdWNnQNJ'),('GPRcQnwwQWwFFnrnnldSqzMfSCdfdldrJf'),('LpTsjmZTsBZjpmzhLLMdSJJSMhCC'),('ZsZBssBsDpDmmVBjCmDZHgnVNWvPQPNPGvNQncQPcRWn'),('pznzpzlGFrvGHGrnnMvDmBMfgfTmsBsTTghDsg'),('LJtWVCWLCNPcSbdcShWBgBThgTfjzwfhhz'),('VZZCdLCVNNCVbCLzFnRqGqlHprQZHRqr'),('dFTsQPdMFsMnWFPdSnwBltftttvlflNN'),('VLZhZLqghCgzqgrLrcgVgbCvtDDtwpqNpDtlBRflDwNqDpNw'),('cLmVhVcgbZrVhrhCLhczhQdJHTmPJJTjvTJsPFWFTW'),('SSwNPNHldNJSngHqBssQvBfccB'),('mMppmDprWpFGRGWmWrDrtGzQfcvvQZBBzzczqRQgRqRT'),
            ('WtFtFvhvpLphNJJVSCbSNP'),('chpGMMzcwSSGnQFRQQFWcFWn'),('sgddTfjLqsWrRtLvQnJr'),('CsmlZgssbRdMhzCHDGpGGG'),('vHBrTzpMPTHMtbBRRJGtDsNB'),('QJWWVwnCZmQlWQWlLWCCmmLwRgtDdDbgngqtRdRGbDNDGtGq'),('LwmWQLJcWmwPrpvpjjrcjT'),('fcsWnWzhWcWgcbfbvtbHTRvpvHttmLtR'),('lNSjwjrDFjlFhlZlQTpLHvSHptvTSRtLmJ'),('NwjwrQDwFCZBCfWzqhqqzc'),('fgNJNRcvvWRfWRrZFldlwlFwfFllflDH'),('spQshQhpqhJsLpnQVLqBqlFwddHSdBFFjSFmwlFmwl'),('hppLsqPVLnpnzJPtqtPPJTCgNcrcNbrrGNcgRNrzcZbG'),('PWFdgDGCFPGhMtQqHBrpJqqW'),('nlllLNmnVNNLllVbVRLRsQMqqpccQQJcJtqcJcnBrc'),('NmvZLsNrbZNjNZVNGvdFFfwdDhPFdDzC'),('LpZpwgLsLSzDdjVGpS'),('bWBlHqqBhNJWNbJQFzGtCtDtGGjNGDgtGC'),('RBRbJggbWRRmhWqTcnnfnmZMTTsTcP'),('JJgzvfzpdzzJjJhgdfhvqfdScNsLwwGsrRbwRLbcbVrVRp'),('WDFBTTDtHTntltnCnnntCDwGlGGbSwNVSssrbwGVsVLs'),('nCHMDtCWWTCCHmmPDnZQgvfQgZNJJdvdMZQg'),('lFDgvlsGvvZGDsFZWgGvWrPqnmwwtqmMVSWrSqMM'),('hRpJhLQHhdTTVPmVSrqwtHmV'),('ctJJJfjLpjglZDGCGljF'),('CnnVMbhVRbQQZjBP'),('rlfsLFLtmLSJscttFfsdjZwZNNwBPWRjRNZBZBfQ'),('tFrmDFlDtmcltFvqVzDqQzGvCVCG'),('JzzJzVrmzJpCCmTFmjZS'),('HtDDtggWssqWfDgwDWvsfDBBchZjSnGGpCFjSFZjpGjFShZg'),('sbvbvfbbDblWtrNVNRzRlJPCzM'),('nlFnFWsWhrctWVdJPDPTnTNJPJQJ'),('fHqvHSqRqSHjBmqvmqqHCtJSTZGdMQJDPQDPPMdNTMZN'),('jzqmbtRRztmbLHcFpgWVsFphpcLV'),('PHZFZFVZZfHgpwjFtmgjtq'),('rpTrTNzzNdrTJwgMwqCBJzJz'),('vsTWbvccRcdRbrRnRRbRrcvVpGlGHZPspSVhSPPQGGZVHV'),('HWnDDjfPFccDPhfchnMMVWGzzpvGszCCGWWV'),('JNBtBTQJNwJQjTpRVRMvpLsQzsRR'),('JltNSrBjmrHfdPHnDlHg'),('ldCJHlZFspjzHMnp'),('zvcLQBQcQvhBwmcDppqbNpjMLnLDDn'),('BvcmQhWWRzPJJzWWWg'),('ggSTPZBwTPTPSTRwZPBnwPMLdVvBqzsqLzqqtVzqtzBszN'),('QRmhQhffCQhJcDfmpChQWJmJNNtzvqtLdvNsGtLqNGzvWqvG'),('HQFCDhDFCCQJQmZTZwTSSwrZnRFS'),('QbFlsMbgPWPlJWzsJsJZntvnvZtctHBfZvBZlD'),('VTqpTqmSrhVLqrpjNppgntfBgfjddHffZBdtcB'),('VCwpqqqNVgNVgMJJwbsWWGMGFR'),('GCwRjQlsCQrPrGMQPsRvpdvgnjgmVVmSStptgJ'),('DzNcZNHZZhzzHhDzDTLWhDzSdJSSpnnVSTSvJJmgvSdmmn'),('pfLNDppNWHqDWfWbzcHPRslCGbwRCPwQrGQPCF'),('hVLnDgCmbhltrmDlhbhVmcgFBWdSBSZZBFPwBLBPfWdPWZ'),('TNTjJNpjqGMTRRsTTCZddfWwFHFWHSSJSFPS'),('CGQqvQRTNzTpQsDtmcrgDQllhnQl'),('SWrtcHWjcWrPcwWrBwSPffnJNsqfMNCNqNfJFfSq'),('QLQvhBpbbvdvTdvpTdGDbDQqqqslsNMJlMMCqMfQnlfC'),('gThhpmDLbzBmGLptrmRZcwHWHZjVrW'),('gQvzQRvSSbvvJvQgfRrfbSpGqBPGwqwVjPBBwwjpRmjB'),('TcNHHVVtNsDHcMcdMBjqpBnGnwlGTwlPBl'),('MHsMDHFMdDtZddZdFdFrhhgbFFVvffrzzffrrS'),('QSFmrDSSQrqlfmDDHPRTdrrTPRbsTPTsNN'),('wBcclhhgwgMhWLLtVMgVvzRTNNjvbszzTdjNdsRbjp'),('nJgVMtBhwLBctmQHQlnCGqmQZZ'),('sggtjzzggfGmPbCMvRCMvTmT'),('RDqqhdQdDlcDpqVlLbSbZFSTTPllbCMv'),('hqpQWRhhdncDQcBsrwzjnfgtgGfgHs'),('MTrzlgMNQNggrrrPlzQDPCsFRfscTfFVhVftRsFFsScS'),('nWWHZHhZWJjjwjLjwbLbwHGSFppVfFVcGcFLfFSVttpf'),('jWhZZBhqBbwvZvBjZNNQrQQQzPMlzzglPB'),('jLVhJZQjwFCLRjQhPRZFLDzrGDHpDGsGqztGHststC'),('SBNlNmWnfvdLmlnvfNSbzrDTTzprdqrDpGqqpHrG'),('bNmSBnBmcfMmcmnlfcnNSnLhZPVVJhwjZRJPwjZMPjMZ'),('VpzBDgGTGVNNpSGzppMdTQwcvFdFMQdcdFwc'),('ZDsqfRftWtllmlWbLLtjFFMwMrjCcwfvMFvwcC'),('PHbDLHZtZJSJPpVgnV'),('bRvTdswLLSTvwswSbDhsDTvFmmGRVmJGZJnRcGGfFVJcqn'),('MWllQMllWHrjWPNplrllQMPZJmnnVmqJcNmVFFnJNFqVGC'),('PgpQrQjjzQWHzpBdvtwhwdSShBZTsT'),('MhTwjMTsTRFStjmSMqqppBrHpDrzHtPqbD'),('dllNcZWgldLvcsvvvvgvWddlHffqBHBBfPzbbqBpPHrpHNbq'),('VddvgWWdCZhnhsCSSCGT'),('LPjqHnDNqqHNllqLpqPCZCGRCssGdGrGFrPrgr'),('WVBztWTQSQMBQrGgRwwwCGgtwg'),('QJMTgvbTTWSzWWvSbVJTzJllJlHHhLpNqpHqjNjNHpjq'),('PCHCbPPPHPlTThBhjGTTNhMNTh'),('FrmfLqdqgfmfttqtWqfrqdhshchDBshDllDBcGDhGDWs'),('mqgdpvFmmdLdqqQCPHZZblvwZQZl'),('bQGqmngwwgSNrBWJWdHZmjfZWB'),('FlpRLCptFLMlLPRLlCCcCCMpjJZJHShWdWvBHHdcZdBWZvSv'),('FRPCDTTtFptVTnQnrGbwbS'),('LsdmnDMTLbzsbNtqcb'),('lJjCnHSvQRRwQQjRRHQbgWbqctNJPbcWrcPPgc'),('RhGSQGwBvvGShnGlHClwjmfpmfdmVmfFDBLDDZpmMf'),('ppDnPmwvNDjTjjcssT'),('qqfRHzdCPHWfhHHtTjjbbLLGZr'),('MhzqWdJCzqJWSJnpnpvvPSPP'),('NGWdQgDDHGJgQLznzzsJFFzvzB'),('twRCpZVjVWqVSqVwwjtZfrrfntfvznBssBncfLrc'),('jRRwCqwCZhlhZRpSZpjSqWwqmDMQdMmHPQQMHGdlHdTldNGd');
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Parse raw input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #data; --SELECT * FROM #data
    SELECT d.ID
        , Letter = x.Letter COLLATE SQL_Latin1_General_CP1_CS_AS
        , Val = ASCII(x.Letter)-IIF(ASCII(x.Letter)<97,38,96)
        , x.Place
        , Section = CEILING(x.Place / (LEN(d.Val) / 2.0))
        , GroupID = CEILING(ID / 3.0)
    INTO #data
    FROM #rawdata d
        CROSS APPLY (
            SELECT Place = x.[value]
                , Letter = SUBSTRING(d.Val, x.[value], 1)
            FROM GENERATE_SERIES(1, LEN(d.Val), 1) x
        ) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    SELECT Answer = SUM(x.Val)
    FROM (
        SELECT d.ID, d.Val
        FROM #data d
        GROUP BY d.ID, d.Val
        HAVING COUNT(*) > 1 AND MIN(d.Section) <> MAX(d.Section)
    ) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    SELECT Answer = SUM(x.Val)
    FROM (
        SELECT x.ID, x.Val
            , rn = ROW_NUMBER() OVER (PARTITION BY x.GroupID, x.Val ORDER BY x.ID)
        FROM (
            SELECT DISTINCT d.ID, d.GroupID, d.Val
            FROM #data d
        ) x
    ) x
    WHERE rn = 3
------------------------------------------------------------------------------

------------------------------------------------------------------------------
