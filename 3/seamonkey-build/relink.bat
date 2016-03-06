setlocal
set ltcg=-ltcg:pgi

set base=d:\mozilla\obj
alias mmt=call %base\..\mymt.bat
timer /3
setlocal

iff "%@upper[%@right[3,%ltcg]]" != "PGO" then
cd %base\nsprpub\pr\src
lib -NOLOGO %ltcg -OUT:"nspr4_s.lib"  .\prvrsion.obj io\.\prfdcach.obj io\.\prmwait.obj io\.\prmapopt.obj  io\.\priometh.obj io\.\pripv6.obj io\.\prlayer.obj io\.\prlog.obj io\.\prmmap.obj io\.\prpolevt.obj  io\.\prprf.obj io\.\prscanf.obj io\.\prstdio.obj threads\.\prcmon.obj threads\.\prrwlock.obj threads\.\prtpd.obj linking\.\prlink.obj malloc\.\prmem.obj md\.\prosdep.obj memory\.\prshm.obj memory\.\prshma.obj memory\.\prseg.obj misc\.\pralarm.obj misc\.\pratom.obj misc\.\prcountr.obj misc\.\prdtoa.obj misc\.\prenv.obj misc\.\prerr.obj misc\.\prerror.obj misc\.\prerrortable.obj misc\.\prinit.obj misc\.\prinrval.obj misc\.\pripc.obj misc\.\prlog2.obj misc\.\prlong.obj misc\.\prnetdb.obj misc\.\prolock.obj misc\.\prrng.obj misc\.\prsystem.obj misc\.\prthinfo.obj misc\.\prtpool.obj misc\.\prtrace.obj misc\.\prtime.obj malloc\.\prmalloc.obj io\.\prdir.obj io\.\prfile.obj io\.\prio.obj io\.\prsocket.obj misc\.\pripcsem.obj threads\.\prcthr.obj threads\.\prdump.obj threads\.\prmon.obj threads\.\prsem.obj threads\combined\.\prucpu.obj threads\combined\.\prucv.obj threads\combined\.\prulock.obj threads\combined\.\prustack.obj threads\combined\.\pruthr.obj md\windows\.\ntmisc.obj md\windows\.\ntsec.obj md\windows\.\ntsem.obj md\windows\.\ntinrval.obj md\windows\.\ntgc.obj md\windows\.\w95thred.obj md\windows\.\w95io.obj md\windows\.\w95cv.obj md\windows\.\w95sock.obj md\windows\.\win32_errors.obj md\windows\.\w32ipcsem.obj md\windows\.\w32poll.obj md\windows\.\w32rng.obj md\windows\.\w32shm.obj md\windows\.\w95dllmain.obj  
nsinstall -m 444 .\nspr4_s.lib %base\dist\lib

cd %base\nsprpub\lib\ds
 lib -NOLOGO %ltcg -OUT:"plds4_s.lib"  .\plarena.obj .\plhash.obj .\plvrsion.obj  
nsinstall -m 444 .\plds4_s.lib %base\dist\lib

cd %base\nsprpub\lib\libc\src
 lib -NOLOGO %ltcg -OUT:"plc4_s.lib"  .\plvrsion.obj .\strlen.obj .\strcpy.obj .\strdup.obj .\strcat.obj .\strcmp.obj .\strccmp.obj .\strchr.obj .\strpbrk.obj .\strstr.obj .\strcstr.obj .\strtok.obj .\base64.obj .\plerror.obj .\plgetopt.obj  
nsinstall -m 444 .\plc4_s.lib %base\dist\lib

cd %base\directory\c-sdk\ldap\libraries\liblber
lib -nologo %ltcg -OUT:"nslber32v50.lib"  .\decode.obj .\encode.obj .\io.obj .\bprint.obj 
nsinstall -R -m 444 .\nslber32v50.lib %base\dist\lib

cd %base\directory\c-sdk\ldap\libraries\libldif
lib -nologo %ltcg -OUT:"nsldif32v50.lib"  .\line64.obj 
nsinstall -R -m 444 .\nsldif32v50.lib %base\dist\lib

cd %base\directory\c-sdk\ldap\libraries\libiutil
lib -nologo %ltcg -OUT:"nsiutil32v50.lib"  .\iutil-lock.obj 
nsinstall -R -m 444 .\nsiutil32v50.lib %base\dist\lib

cd %base\dbm\src
lib -NOLOGO %ltcg -OUT:"dbm32.lib"  db.obj h_bigkey.obj h_func.obj h_log2.obj h_page.obj hash.obj hash_buf.obj hsearch.obj mktemp.obj ndbm.obj strerror.obj nsres.obj memmove.obj snprintf.obj  
nsinstall -m 644 dbm32.lib %base\dist\lib

cd %base\jpeg
lib -NOLOGO %ltcg -OUT:"jpeg3250.lib"  jdapimin.obj jdapistd.obj jdatasrc.obj jdatadst.obj jdmaster.obj jdinput.obj jdmarker.obj jdhuff.obj jdphuff.obj jdmainct.obj jdcoefct.obj jdpostct.obj jddctmgr.obj jidctfst.obj jidctflt.obj jidctint.obj jdsample.obj jdcolor.obj jquant1.obj jquant2.obj jdmerge.obj jcomapi.obj jutils.obj jerror.obj jmemmgr.obj jmemnobs.obj jfdctflt.obj jfdctfst.obj jfdctint.obj jcapimin.obj jcparam.obj jcapistd.obj jcmarker.obj jcinit.obj jcmainct.obj jchuff.obj jcsample.obj jcmaster.obj jccoefct.obj jccolor.obj jcphuff.obj jcdctmgr.obj jcprepct.obj  
nsinstall -m 644 jpeg3250.lib %base\dist\lib

cd %base\xpcom\typelib\xpt\src
lib -NOLOGO %ltcg -OUT:"xpt.lib"  xpt_arena.obj xpt_struct.obj xpt_xdr.obj  
nsinstall -m 644 xpt.lib %base\dist\lib

cd %base\js\src\fdlibm
lib -NOLOGO %ltcg -OUT:"fdm.lib"  e_acos.obj e_asin.obj e_atan2.obj e_exp.obj e_fmod.obj e_log.obj e_pow.obj e_rem_pio2.obj s_scalbn.obj e_sqrt.obj k_cos.obj k_sin.obj k_rem_pio2.obj k_tan.obj s_atan.obj s_ceil.obj s_copysign.obj s_cos.obj s_fabs.obj s_finite.obj s_floor.obj s_isnan.obj s_lib_version.obj s_sin.obj s_tan.obj w_acos.obj w_asin.obj w_atan2.obj w_exp.obj w_fmod.obj w_log.obj w_pow.obj w_sqrt.obj  
nsinstall -m 644 fdm.lib %base\dist\lib

cd %base\xpcom\string\src
lib -NOLOGO %ltcg -OUT:"string_s.lib"  nsDependentString.obj nsDependentSubstring.obj nsPrintfCString.obj nsPromiseFlatString.obj nsReadableUtils.obj nsSubstring.obj nsSubstringTuple.obj nsString.obj nsStringComparator.obj nsStringObsolete.obj nsAString.obj nsObsoleteAStringThunk.obj  
nsinstall -m 644 string_s.lib %base\dist\lib

cd %base\xpcom\glue
lib -NOLOGO %ltcg -OUT:"xpcomglue_s.lib"  pldhash.obj nsCOMPtr.obj nsComponentManagerUtils.obj nsDebug.obj nsID.obj nsIInterfaceRequestorUtils.obj nsINIParser.obj nsMemory.obj nsTraceRefcnt.obj nsWeakReference.obj nsGREGlue.obj nsVersionComparator.obj nsTHashtable.obj nsGenericFactory.obj  
nsinstall -m 644 xpcomglue_s.lib %base\dist\lib

cd %base\xpcom\glue\standalone
lib -NOLOGO %ltcg -OUT:"xpcomglue.lib"  pldhash.obj nsCOMPtr.obj nsComponentManagerUtils.obj nsDebug.obj nsID.obj nsIInterfaceRequestorUtils.obj nsINIParser.obj nsMemory.obj nsTraceRefcnt.obj nsWeakReference.obj nsGREGlue.obj nsVersionComparator.obj nsTHashtable.obj nsXPCOMGlue.obj nsGREDirServiceProvider.obj nsGlueLinkingWin.obj  
nsinstall -m 644 xpcomglue.lib %base\dist\lib
nsinstall -m 755 xpcomglue.lib %base\dist\sdk\lib

cd %base\xpcom\base
lib -NOLOGO %ltcg -OUT:"xpcombase_s.lib"  nsAllocator.obj nsVersionComparatorImpl.obj nsConsoleMessage.obj nsConsoleService.obj nsDebugImpl.obj nsErrorService.obj nsExceptionService.obj nsMemoryImpl.obj nsTraceRefcntImpl.obj nsInterfaceRequestorAgg.obj nsStackFrameWin.obj  
nsinstall -m 644 xpcombase_s.lib %base\dist\lib

cd %base\xpcom\ds
lib -NOLOGO %ltcg -OUT:"xpcomds_s.lib"  nsAtomTable.obj nsAtomService.obj nsByteBuffer.obj nsCheapSets.obj nsCRT.obj nsDeque.obj nsEmptyEnumerator.obj nsEnumeratorUtils.obj nsFixedSizeAllocator.obj nsHashSets.obj nsHashtable.obj nsObserverList.obj nsObserverService.obj nsProperties.obj nsPersistentProperties.obj nsQuickSort.obj nsRecyclingAllocator.obj nsStaticNameTable.obj nsStringEnumerator.obj nsSupportsArray.obj nsSupportsArrayEnumerator.obj nsSupportsPrimitives.obj nsUnicharBuffer.obj nsVariant.obj nsVoidArray.obj nsTextFormatter.obj nsTimelineService.obj nsValueArray.obj nsCOMArray.obj nsArray.obj nsArrayEnumerator.obj nsHashPropertyBag.obj nsWindowsRegKey.obj  
nsinstall -m 644 xpcomds_s.lib %base\dist\lib

cd %base\xpcom\io
lib -NOLOGO %ltcg -OUT:"xpcomio_s.lib"  nsAppFileLocationProvider.obj nsBinaryStream.obj nsByteArrayInputStream.obj nsDirectoryService.obj nsEscape.obj nsFastLoadFile.obj nsFastLoadService.obj nsInputStreamTee.obj nsLinebreakConverter.obj nsLocalFileCommon.obj nsMultiplexInputStream.obj nsPipe3.obj nsStreamUtils.obj nsScriptableInputStream.obj nsSegmentedBuffer.obj SpecialSystemDirectory.obj nsStorageStream.obj nsStringStream.obj nsUnicharInputStream.obj nsNativeCharsetUtils.obj nsLocalFileWin.obj  
nsinstall -m 644 xpcomio_s.lib %base\dist\lib

cd %base\xpcom\components
lib -NOLOGO %ltcg -OUT:"xpcomcomponents_s.lib"  nsCategoryManager.obj nsComponentManager.obj nsNativeComponentLoader.obj nsStaticComponentLoader.obj nsServiceManagerObsolete.obj xcDll.obj  
nsinstall -m 644 xpcomcomponents_s.lib %base\dist\lib

cd %base\xpcom\threads
lib -NOLOGO %ltcg -OUT:"xpcomthreads_s.lib"  plevent.obj nsAutoLock.obj nsEnvironment.obj nsEventQueue.obj nsEventQueueService.obj nsThread.obj nsTimerImpl.obj nsProcessCommon.obj TimerThread.obj  
nsinstall -m 644 xpcomthreads_s.lib %base\dist\lib

cd %base\xpcom\reflect\xptinfo\src
lib -NOLOGO %ltcg -OUT:"xptinfo.lib"  xptiFile.obj xptiInterfaceInfo.obj xptiInterfaceInfoManager.obj xptiManifest.obj xptiMisc.obj xptiTypelibGuts.obj xptiWorkingSet.obj xptiZipItem.obj xptiZipLoader.obj  
nsinstall -m 644 xptinfo.lib %base\dist\lib

cd %base\xpcom\reflect\xptcall\src
lib -NOLOGO %ltcg -OUT:"xptcall.lib"  xptcall.obj  
nsinstall -m 644 xptcall.lib %base\dist\lib

cd %base\xpcom\reflect\xptcall\src\md\win32
lib -NOLOGO %ltcg -OUT:"xptcmd.lib"  xptcinvoke.obj xptcstubs.obj  
nsinstall -m 644 xptcmd.lib %base\dist\lib

cd %base\xpcom\proxy\src
lib -NOLOGO %ltcg -OUT:"xpcomproxy_s.lib"  nsProxyEvent.obj nsProxyEventClass.obj nsProxyEventObject.obj nsProxyObjectManager.obj nsProxyRelease.obj  
nsinstall -m 644 xpcomproxy_s.lib %base\dist\lib

cd %base\modules\libreg\src
lib -NOLOGO %ltcg -OUT:"mozreg_s.lib"  reg.obj VerReg.obj vr_stubs.obj nr_bufio.obj  
nsinstall -m 644 mozreg_s.lib %base\dist\lib

cd %base\modules\libreg\standalone
lib -NOLOGO %ltcg -OUT:"mozregsa_s.lib"  reg.obj VerReg.obj vr_stubs.obj  
nsinstall -m 644 mozregsa_s.lib %base\dist\lib

cd %base\js\src\xpconnect\loader
lib -NOLOGO %ltcg -OUT:"jsloader_s.lib"  mozJSComponentLoader.obj mozJSSubScriptLoader.obj  
nsinstall -m 644 jsloader_s.lib %base\dist\lib

cd %base\intl\unicharutil\util
lib -NOLOGO %ltcg -OUT:"unicharutil_s.lib"  nsUnicharUtils.obj nsCompressedCharMap.obj  
nsinstall -m 644 unicharutil_s.lib %base\dist\lib

cd %base\intl\unicharutil\src
lib -NOLOGO %ltcg -OUT:"ucharucomp_s.lib"  nsCaseConversionImp2.obj nsHankakuToZenkaku.obj nsEntityConverter.obj nsSaveAsCharset.obj nsUnicodeNormalizer.obj  
nsinstall -m 644 ucharucomp_s.lib %base\dist\lib

cd %base\intl\uconv\util
lib -NOLOGO %ltcg -OUT:"ucvutil_s.lib"  nsUCSupport.obj nsUCConstructors.obj  
nsinstall -m 644 ucvutil_s.lib %base\dist\lib

cd %base\intl\uconv\ucvja
lib -NOLOGO %ltcg -OUT:"ucvja_s.lib"  nsJapaneseToUnicode.obj nsUnicodeToSJIS.obj nsCP932ToUnicode.obj nsUnicodeToCP932.obj nsUnicodeToEUCJP.obj nsUnicodeToISO2022JP.obj nsUnicodeToJISx0201.obj  
nsinstall -m 644 ucvja_s.lib %base\dist\lib

cd %base\intl\uconv\ucvcn
lib -NOLOGO %ltcg -OUT:"ucvcn_s.lib"  nsGB2312ToUnicodeV2.obj nsUnicodeToGB2312V2.obj nsGBKToUnicode.obj nsUnicodeToGBK.obj nsISO2022CNToUnicode.obj nsUnicodeToISO2022CN.obj nsHZToUnicode.obj nsUnicodeToHZ.obj nsCP936ToUnicode.obj nsUnicodeToCP936.obj nsGBKConvUtil.obj  
nsinstall -m 644 ucvcn_s.lib %base\dist\lib

cd %base\intl\uconv\ucvlatin
lib -NOLOGO %ltcg -OUT:"ucvlatin_s.lib"  nsUEscapeToUnicode.obj nsAsciiToUnicode.obj nsISO88592ToUnicode.obj nsISO88593ToUnicode.obj nsISO88594ToUnicode.obj nsISO88595ToUnicode.obj nsISO88596ToUnicode.obj nsISO88596EToUnicode.obj nsISO88596IToUnicode.obj nsISO88597ToUnicode.obj nsISO88598ToUnicode.obj nsISO88598EToUnicode.obj nsISO88598IToUnicode.obj nsISO88599ToUnicode.obj nsISO885910ToUnicode.obj nsISO885911ToUnicode.obj nsISO885913ToUnicode.obj nsISO885914ToUnicode.obj nsISO885915ToUnicode.obj nsISO885916ToUnicode.obj nsISOIR111ToUnicode.obj nsCP1250ToUnicode.obj nsCP1251ToUnicode.obj nsCP1253ToUnicode.obj nsCP1254ToUnicode.obj nsCP1255ToUnicode.obj nsCP1256ToUnicode.obj nsCP1257ToUnicode.obj nsCP1258ToUnicode.obj nsCP866ToUnicode.obj nsCP874ToUnicode.obj nsTIS620ToUnicode.obj nsKOI8UToUnicode.obj nsKOI8RToUnicode.obj nsMacCEToUnicode.obj nsMacGreekToUnicode.obj nsMacTurkishToUnicode.obj nsMacCroatianToUnicode.obj nsMacRomanianToUnicode.obj nsMacCyrillicToUnicode.obj nsMacUkrainianToUnicode.obj nsMacIcelandicToUnicode.obj nsMacHebrewToUnicode.obj nsMacArabicToUnicode.obj nsMacDevanagariToUnicode.obj nsMacFarsiToUnicode.obj nsMacGujaratiToUnicode.obj nsMacGurmukhiToUnicode.obj nsGEOSTD8ToUnicode.obj nsARMSCII8ToUnicode.obj nsTCVN5712ToUnicode.obj nsVISCIIToUnicode.obj nsVPSToUnicode.obj nsVIQRToUnicode.obj nsVNIToUnicode.obj nsUTF7ToUnicode.obj nsMUTF7ToUnicode.obj nsUCS2BEToUnicode.obj nsUTF32ToUnicode.obj nsT61ToUnicode.obj nsUserDefinedToUnicode.obj nsUnicodeToUEscape.obj nsUnicodeToAscii.obj nsUnicodeToISO88592.obj nsUnicodeToISO88593.obj nsUnicodeToISO88594.obj nsUnicodeToISO88595.obj nsUnicodeToISO88596.obj nsUnicodeToISO88596E.obj nsUnicodeToISO88596I.obj nsUnicodeToISO88597.obj nsUnicodeToISO88598.obj nsUnicodeToISO88598E.obj nsUnicodeToISO88598I.obj nsUnicodeToISO88599.obj nsUnicodeToISO885910.obj nsUnicodeToISO885911.obj nsUnicodeToISO885913.obj nsUnicodeToISO885914.obj nsUnicodeToISO885915.obj nsUnicodeToISO885916.obj nsUnicodeToISOIR111.obj nsUnicodeToCP1250.obj nsUnicodeToCP1251.obj nsUnicodeToCP1253.obj nsUnicodeToCP1254.obj nsUnicodeToCP1255.obj nsUnicodeToCP1256.obj nsUnicodeToCP1257.obj nsUnicodeToCP1258.obj nsUnicodeToCP874.obj nsUnicodeToTIS620.obj nsUnicodeToCP866.obj nsUnicodeToKOI8R.obj nsUnicodeToKOI8U.obj nsUnicodeToMacCE.obj nsUnicodeToMacGreek.obj nsUnicodeToMacTurkish.obj nsUnicodeToMacCroatian.obj nsUnicodeToMacRomanian.obj nsUnicodeToMacCyrillic.obj nsUnicodeToMacUkrainian.obj nsUnicodeToMacIcelandic.obj nsUnicodeToMacHebrew.obj nsUnicodeToMacArabic.obj nsUnicodeToMacDevanagari.obj nsUnicodeToMacFarsi.obj nsUnicodeToMacGujarati.obj nsUnicodeToMacGurmukhi.obj nsUnicodeToGEOSTD8.obj nsUnicodeToARMSCII8.obj nsUnicodeToTCVN5712.obj nsUnicodeToVISCII.obj nsUnicodeToVPS.obj nsUnicodeToVIQR.obj nsUnicodeToVNI.obj nsUnicodeToUTF7.obj nsUnicodeToMUTF7.obj nsUnicodeToUCS2BE.obj nsUnicodeToUTF32.obj nsUnicodeToT61.obj nsUnicodeToUserDefined.obj nsUnicodeToSymbol.obj nsUnicodeToZapfDingbat.obj nsUnicodeToAdobeEuro.obj nsUnicodeToTSCII.obj  
nsinstall -m 644 ucvlatin_s.lib %base\dist\lib

cd %base\intl\uconv\ucvtw
lib -NOLOGO %ltcg -OUT:"ucvtw_s.lib"  nsBIG5ToUnicode.obj nsUnicodeToBIG5.obj nsBIG5HKSCSToUnicode.obj nsUnicodeToBIG5HKSCS.obj nsUnicodeToHKSCS.obj nsCP950ToUnicode.obj nsUnicodeToCP950.obj  
nsinstall -m 644 ucvtw_s.lib %base\dist\lib

cd %base\intl\uconv\ucvtw2
lib -NOLOGO %ltcg -OUT:"ucvtw2_s.lib"  nsEUCTWToUnicode.obj nsUnicodeToEUCTW.obj  
nsinstall -m 644 ucvtw2_s.lib %base\dist\lib

cd %base\intl\uconv\ucvko
lib -NOLOGO %ltcg -OUT:"ucvko_s.lib"  nsEUCKRToUnicode.obj nsUnicodeToEUCKR.obj nsISO2022KRToUnicode.obj nsUnicodeToISO2022KR.obj nsCP949ToUnicode.obj nsUnicodeToCP949.obj nsUnicodeToJohab.obj nsJohabToUnicode.obj nsUnicodeToJamoTTF.obj  
nsinstall -m 644 ucvko_s.lib %base\dist\lib

cd %base\intl\uconv\ucvibm
lib -NOLOGO %ltcg -OUT:"ucvibm_s.lib"  nsCP850ToUnicode.obj nsCP852ToUnicode.obj nsCP855ToUnicode.obj nsCP857ToUnicode.obj nsCP862ToUnicode.obj nsCP864ToUnicode.obj nsCP864iToUnicode.obj nsUnicodeToCP850.obj nsUnicodeToCP852.obj nsUnicodeToCP855.obj nsUnicodeToCP857.obj nsUnicodeToCP862.obj nsUnicodeToCP864.obj nsUnicodeToCP864i.obj  
nsinstall -m 644 ucvibm_s.lib %base\dist\lib

cd %base\intl\locale\src
lib -NOLOGO %ltcg -OUT:"nslocale_s.lib"  nsCollation.obj nsScriptableDateFormat.obj nsLanguageAtomService.obj nsLocale.obj nsLocaleService.obj nsFontPackageService.obj  
nsinstall -m 644 nslocale_s.lib %base\dist\lib

cd %base\intl\locale\src\windows
lib -NOLOGO %ltcg -OUT:"platlocale_s.lib"  nsCollationWin.obj nsDateTimeFormatWin.obj nsIWin32LocaleImpl.obj  
nsinstall -m 644 platlocale_s.lib %base\dist\lib

cd %base\intl\strres\src
lib -NOLOGO %ltcg -OUT:"strres_s.lib"  nsStringBundle.obj nsStringBundleTextOverride.obj  
nsinstall -m 644 strres_s.lib %base\dist\lib

cd %base\intl\lwbrk\src
lib -NOLOGO %ltcg -OUT:"lwbrk_s.lib"  rulebrk.obj nsJISx4501LineBreaker.obj nsLWBreakerFImp.obj nsSampleWordBreaker.obj nsSemanticUnitScanner.obj  
nsinstall -m 644 lwbrk_s.lib %base\dist\lib

cd %base\intl\chardet\src
lib -NOLOGO %ltcg -OUT:"chardet_s.lib"  nsObserverBase.obj nsXMLEncodingObserver.obj nsMetaCharsetObserver.obj nsDetectionAdaptor.obj nsDebugDetector.obj nsPSMDetectors.obj nsCyrillicDetector.obj nsDocumentCharsetInfo.obj  
nsinstall -m 644 chardet_s.lib %base\dist\lib

cd %base\modules\libutil\src
lib -NOLOGO %ltcg -OUT:"mozutil_s.lib"  stopwatch.obj  
nsinstall -m 644 mozutil_s.lib %base\dist\lib

cd %base\netwerk\base\src
lib -NOLOGO %ltcg -OUT:"neckobase_s.lib"  nsIOThreadPool.obj nsTransportUtils.obj nsAsyncStreamCopier.obj nsAsyncStreamListener.obj nsBufferedStreams.obj nsDirectoryIndexStream.obj nsDownloader.obj nsFileStreams.obj nsIncrementalDownload.obj nsInputStreamChannel.obj nsInputStreamPump.obj nsStreamTransportService.obj nsIOService.obj nsLoadGroup.obj nsMIMEInputStream.obj nsProtocolProxyService.obj nsProxyInfo.obj nsPACMan.obj nsRequestObserverProxy.obj nsSimpleStreamListener.obj nsSimpleURI.obj nsStandardURL.obj nsSocketTransport2.obj nsSocketTransportService2.obj nsServerSocket.obj nsStreamListenerTee.obj nsStreamLoader.obj nsSyncStreamListener.obj nsUnicharStreamLoader.obj nsURIChecker.obj nsURLHelper.obj nsURLParsers.obj nsNetStrings.obj nsURLHelperWin.obj nsNativeConnectionHelper.obj nsAutodialWin.obj  
nsinstall -m 644 neckobase_s.lib %base\dist\lib

cd %base\netwerk\cookie\src
lib -NOLOGO %ltcg -OUT:"neckocookie_s.lib"  nsCookie.obj nsCookieService.obj  
nsinstall -m 644 neckocookie_s.lib %base\dist\lib

cd %base\netwerk\dns\src
lib -NOLOGO %ltcg -OUT:"neckodns_s.lib"  race.obj nameprep.obj punycode.obj nsIDNService.obj nsDNSService2.obj nsHostResolver.obj  
nsinstall -m 644 neckodns_s.lib %base\dist\lib

cd %base\netwerk\socket\base
lib -NOLOGO %ltcg -OUT:"neckosocket_s.lib"  nsSocketProviderService.obj nsSOCKSSocketProvider.obj nsSOCKSIOLayer.obj  
nsinstall -m 644 neckosocket_s.lib %base\dist\lib

cd %base\netwerk\mime\src
lib -NOLOGO %ltcg -OUT:"nkmime_s.lib"  nsMIMEHeaderParamImpl.obj  
nsinstall -m 644 nkmime_s.lib %base\dist\lib

cd %base\netwerk\streamconv\src
lib -NOLOGO %ltcg -OUT:"nkconv_s.lib"  nsStreamConverterService.obj  
nsinstall -m 644 nkconv_s.lib %base\dist\lib

cd %base\netwerk\streamconv\converters
lib -NOLOGO %ltcg -OUT:"nkcnvts_s.lib"  mozTXTToHTMLConv.obj nsUnknownDecoder.obj nsHTTPCompressConv.obj nsTXTToHTMLConv.obj nsDirIndex.obj nsDirIndexParser.obj nsIndexedToHTML.obj nsMultiMixedConv.obj ParseFTPList.obj nsFTPDirListingConv.obj nsGopherDirListingConv.obj nsBinHexDecoder.obj  
nsinstall -m 644 nkcnvts_s.lib %base\dist\lib

cd %base\netwerk\cache\src
lib -NOLOGO %ltcg -OUT:"nkcache_s.lib"  nsCache.obj nsCacheEntry.obj nsCacheEntryDescriptor.obj nsCacheMetaData.obj nsCacheService.obj nsCacheSession.obj nsMemoryCacheDevice.obj nsDiskCacheBinding.obj nsDiskCacheBlockFile.obj nsDiskCacheDevice.obj nsDiskCacheEntry.obj nsDiskCacheMap.obj nsDiskCacheStreams.obj nsDeleteDir.obj  
nsinstall -m 644 nkcache_s.lib %base\dist\lib

cd %base\netwerk\protocol\about\src
lib -NOLOGO %ltcg -OUT:"nkabout_s.lib"  nsAboutProtocolHandler.obj nsAboutBlank.obj nsAboutBloat.obj nsAboutCache.obj nsAboutCacheEntry.obj nsAboutRedirector.obj  
nsinstall -m 644 nkabout_s.lib %base\dist\lib

cd %base\netwerk\protocol\data\src
lib -NOLOGO %ltcg -OUT:"nkdata_s.lib"  nsDataHandler.obj nsDataChannel.obj  
nsinstall -m 644 nkdata_s.lib %base\dist\lib

cd %base\netwerk\protocol\keyword\src
lib -NOLOGO %ltcg -OUT:"nkkeyword_s.lib"  nsKeywordProtocolHandler.obj  
nsinstall -m 644 nkkeyword_s.lib %base\dist\lib

cd %base\netwerk\protocol\res\src
lib -NOLOGO %ltcg -OUT:"nkres_s.lib"  nsResProtocolHandler.obj  
nsinstall -m 644 nkres_s.lib %base\dist\lib

cd %base\netwerk\protocol\file\src
lib -NOLOGO %ltcg -OUT:"nkfile_s.lib"  nsFileProtocolHandler.obj nsFileChannel.obj  
nsinstall -m 644 nkfile_s.lib %base\dist\lib

cd %base\netwerk\protocol\http\src
lib -NOLOGO %ltcg -OUT:"nkhttp_s.lib"  nsHttp.obj nsHttpHeaderArray.obj nsHttpConnectionInfo.obj nsHttpConnection.obj nsHttpConnectionMgr.obj nsHttpRequestHead.obj nsHttpResponseHead.obj nsHttpChunkedDecoder.obj nsHttpAuthCache.obj nsHttpAuthManager.obj nsHttpBasicAuth.obj nsHttpDigestAuth.obj nsHttpNTLMAuth.obj nsHttpTransaction.obj nsHttpHandler.obj nsHttpChannel.obj nsHttpPipeline.obj  
nsinstall -m 644 nkhttp_s.lib %base\dist\lib

cd %base\netwerk\protocol\viewsource\src
lib -NOLOGO %ltcg -OUT:"nkviewsource_s.lib"  nsViewSourceHandler.obj nsViewSourceChannel.obj  
nsinstall -m 644 nkviewsource_s.lib %base\dist\lib

cd %base\netwerk\protocol\ftp\src
lib -NOLOGO %ltcg -OUT:"nkftp_s.lib"  nsFtpProtocolHandler.obj nsFTPChannel.obj nsFtpConnectionThread.obj nsFtpControlConnection.obj  
nsinstall -m 644 nkftp_s.lib %base\dist\lib

cd %base\netwerk\protocol\gopher\src
lib -NOLOGO %ltcg -OUT:"nkgopher_s.lib"  nsGopherHandler.obj nsGopherChannel.obj  
nsinstall -m 644 nkgopher_s.lib %base\dist\lib

cd %base\uriloader\base
lib -NOLOGO %ltcg -OUT:"uriloaderbase_s.lib"  nsURILoader.obj nsDocLoader.obj  
nsinstall -m 644 uriloaderbase_s.lib %base\dist\lib

cd %base\uriloader\exthandler
lib -NOLOGO %ltcg -OUT:"exthandler_s.lib"  nsExternalHelperAppService.obj nsExternalProtocolHandler.obj nsMIMEInfoImpl.obj nsOSHelperAppService.obj nsMIMEInfoWin.obj  
nsinstall -m 644 exthandler_s.lib %base\dist\lib

cd %base\uriloader\prefetch
lib -NOLOGO %ltcg -OUT:"prefetch_s.lib"  nsPrefetchService.obj  
nsinstall -m 644 prefetch_s.lib %base\dist\lib

cd %base\modules\libimg\png
lib -NOLOGO %ltcg -OUT:"png.lib"  png.obj pngerror.obj pngget.obj pngmem.obj pngpread.obj pngread.obj pngrio.obj pngrutil.obj pngset.obj pngtrans.obj pngwio.obj pngwrite.obj pngwtran.obj pngrtran.obj pngwutil.obj  
nsinstall -m 644 png.lib %base\dist\lib

cd %base\rdf\base\src
lib -NOLOGO %ltcg -OUT:"rdfbase_s.lib"  rdfTriplesSerializer.obj nsCompositeDataSource.obj nsContainerEnumerator.obj nsDefaultResourceFactory.obj nsInMemoryDataSource.obj nsNameSpaceMap.obj nsRDFContentSink.obj nsRDFContainer.obj nsRDFContainerUtils.obj nsRDFParserUtils.obj nsRDFService.obj nsRDFXMLDataSource.obj nsRDFXMLParser.obj nsRDFXMLSerializer.obj rdfutil.obj  
nsinstall -m 644 rdfbase_s.lib %base\dist\lib

cd %base\rdf\util\src
lib -NOLOGO %ltcg -OUT:"rdfutil_s.lib"  nsRDFResource.obj  
nsinstall -m 644 rdfutil_s.lib %base\dist\lib

cd %base\rdf\datasource\src
lib -NOLOGO %ltcg -OUT:"rdfdatasource_s.lib"  nsLocalStore.obj nsFileSystemDataSource.obj  
nsinstall -m 644 rdfdatasource_s.lib %base\dist\lib

cd %base\parser\expat\lib
lib -NOLOGO %ltcg -OUT:"expat_s.lib"  xmlparse.obj xmlrole.obj xmltok.obj  
nsinstall -m 644 expat_s.lib %base\dist\lib

cd %base\gfx\cairo\libpixman\src
lib -NOLOGO %ltcg -OUT:"mozlibpixman.lib"  fbcompose.obj fbedge.obj fbpict.obj fbtrap.obj icblt.obj icbltone.obj iccolor.obj icformat.obj icimage.obj icpixels.obj icrect.obj icstipple.obj ictransform.obj ictrap.obj ictri.obj icutil.obj pixregion.obj renderedge.obj  
nsinstall -m 644 mozlibpixman.lib %base\dist\lib

cd %base\gfx\cairo\cairo\src
lib -NOLOGO %ltcg -OUT:"mozcairo.lib"  cairo.obj cairo-arc.obj cairo-array.obj cairo-cache.obj cairo-clip.obj cairo-color.obj cairo-debug.obj cairo-fixed.obj cairo-font-options.obj cairo-font.obj cairo-gstate.obj cairo-hash.obj cairo-hull.obj cairo-image-surface.obj cairo-matrix.obj cairo-meta-surface.obj cairo-output-stream.obj cairo-path-bounds.obj cairo-path-data.obj cairo-path-fill.obj cairo-path-stroke.obj cairo-path.obj cairo-pattern.obj cairo-pen.obj cairo-polygon.obj cairo-region.obj cairo-slope.obj cairo-spline.obj cairo-surface.obj cairo-traps.obj cairo-unicode.obj cairo-wideint.obj cairo-win32-font.obj cairo-win32-surface.obj  
nsinstall -m 644 mozcairo.lib %base\dist\lib

cd %base\gfx\src\shared
lib -NOLOGO %ltcg -OUT:"gfxshared_s.lib"  nsRenderingContextImpl.obj gfxImageFrame.obj nsNativeTheme.obj  
nsinstall -m 644 gfxshared_s.lib %base\dist\lib

cd %base\modules\libpr0n\src
lib -NOLOGO %ltcg -OUT:"imglib2_s.lib"  imgCache.obj imgContainer.obj imgLoader.obj imgRequest.obj imgRequestProxy.obj  
nsinstall -m 644 imglib2_s.lib %base\dist\lib

cd %base\modules\libpr0n\decoders\icon\win
lib -NOLOGO %ltcg -OUT:"imgiconwin_s.lib"  nsIconChannel.obj  
nsinstall -m 644 imgiconwin_s.lib %base\dist\lib

cd %base\modules\libpr0n\decoders\png
lib -NOLOGO %ltcg -OUT:"imgpng_s.lib"  nsPNGDecoder.obj  
nsinstall -m 644 imgpng_s.lib %base\dist\lib

cd %base\modules\libpr0n\decoders\gif
lib -NOLOGO %ltcg -OUT:"imggif_s.lib"  GIF2.obj nsGIFDecoder2.obj imgContainerGIF.obj  
nsinstall -m 644 imggif_s.lib %base\dist\lib

cd %base\modules\libpr0n\decoders\jpeg
lib -NOLOGO %ltcg -OUT:"imgjpeg_s.lib"  nsJPEGDecoder.obj nsJPEGEncoder.obj  
nsinstall -m 644 imgjpeg_s.lib %base\dist\lib

cd %base\modules\libpr0n\decoders\bmp
lib -NOLOGO %ltcg -OUT:"imgbmp_s.lib"  nsBMPDecoder.obj nsICODecoder.obj  
nsinstall -m 644 imgbmp_s.lib %base\dist\lib

cd %base\modules\libpr0n\decoders\xbm
lib -NOLOGO %ltcg -OUT:"imgxbm_s.lib"  nsXBMDecoder.obj  
nsinstall -m 644 imgxbm_s.lib %base\dist\lib

cd %base\dom\src\base
lib -NOLOGO %ltcg -OUT:"jsdombase_s.lib"  nsBarProps.obj nsDOMException.obj nsDOMWindowUtils.obj nsJSEnvironment.obj nsFocusController.obj nsGlobalWindow.obj nsGlobalWindowCommands.obj nsLocation.obj nsDOMWindowList.obj nsJSUtils.obj nsScreen.obj nsHistory.obj nsMimeTypeArray.obj nsPluginArray.obj nsWindowRoot.obj nsDOMClassInfo.obj nsScriptNameSpaceManager.obj nsDOMScriptObjectFactory.obj  
nsinstall -m 644 jsdombase_s.lib %base\dist\lib

cd %base\dom\src\jsurl
lib -NOLOGO %ltcg -OUT:"jsurl_s.lib"  nsJSProtocolHandler.obj  
nsinstall -m 644 jsurl_s.lib %base\dist\lib

cd %base\dom\src\events
lib -NOLOGO %ltcg -OUT:"jsdomevents_s.lib"  nsJSEventListener.obj  
nsinstall -m 644 jsdomevents_s.lib %base\dist\lib

cd %base\view\src
lib -NOLOGO %ltcg -OUT:"gkview_s.lib"  nsView.obj nsScrollPortView.obj nsViewManager.obj  
nsinstall -m 644 gkview_s.lib %base\dist\lib

cd %base\widget\src\xpwidgets
lib -NOLOGO %ltcg -OUT:"xpwidgets_s.lib"  nsBaseWidget.obj nsTransferable.obj nsHTMLFormatConverter.obj nsBaseDragService.obj nsPrimitiveHelpers.obj nsXPLookAndFeel.obj nsClipboardHelper.obj nsBaseClipboard.obj nsBaseFilePicker.obj  
nsinstall -m 644 xpwidgets_s.lib %base\dist\lib

cd %base\widget\src\support
lib -NOLOGO %ltcg -OUT:"widgetsupport_s.lib"  nsWidgetSupport.obj  
nsinstall -m 644 widgetsupport_s.lib %base\dist\lib

cd %base\widget\src\windows
lib -NOLOGO %ltcg -OUT:"widget_windows.lib"  L_Ienumfe.obj nsWindow.obj nsAppShell.obj nsLookAndFeel.obj nsToolkit.obj nsDataObj.obj nsDataObjCollection.obj nsClipboard.obj nsNativeDragTarget.obj nsNativeDragSource.obj nsDragService.obj nsImageClipboard.obj nsBidiKeyboard.obj nsFilePicker.obj nsSound.obj  
nsinstall -m 644 widget_windows.lib %base\dist\lib

cd %base\content\base\src
lib -NOLOGO %ltcg -OUT:"gkconbase_s.lib"  mozSanitizingSerializer.obj nsAtomListUtils.obj nsAttrAndChildArray.obj nsAttrValue.obj nsCommentNode.obj nsContentAreaDragDrop.obj nsContentIterator.obj nsContentList.obj nsContentPolicy.obj nsContentSink.obj nsContentUtils.obj nsCopySupport.obj nsDataDocumentContentPolicy.obj nsDOMAttribute.obj nsDOMAttributeMap.obj nsDOMDocumentType.obj nsDOMLists.obj nsDocument.obj nsDocumentEncoder.obj nsDocumentFragment.obj nsFrameLoader.obj nsGenConImageContent.obj nsGeneratedIterator.obj nsGenericDOMDataNode.obj nsGenericDOMNodeList.obj nsGenericElement.obj nsHTMLContentSerializer.obj nsImageLoadingContent.obj nsMappedAttributes.obj nsNameSpaceManager.obj nsNoDataProtocolContentPolicy.obj nsNodeInfo.obj nsNodeInfoManager.obj nsParserUtils.obj nsPlainTextSerializer.obj nsPropertyTable.obj nsRange.obj nsScriptEventManager.obj nsScriptLoader.obj nsStubDocumentObserver.obj nsStyleLinkElement.obj nsSyncLoadService.obj nsTextFragment.obj nsTextNode.obj nsTreeWalker.obj nsXMLContentSerializer.obj nsXMLNameSpaceMap.obj  
nsinstall -m 644 gkconbase_s.lib %base\dist\lib

cd %base\content\canvas\src
lib -NOLOGO %ltcg -OUT:"gkconcvs_s.lib"  dummy.obj nsCanvasRenderingContext2D.obj  
nsinstall -m 644 gkconcvs_s.lib %base\dist\lib

cd %base\content\html\content\src
lib -NOLOGO %ltcg -OUT:"gkconhtmlcon_s.lib"  nsGenericHTMLElement.obj nsGenericDOMHTMLCollection.obj nsFormSubmission.obj nsHTMLAtoms.obj nsImageMapUtils.obj nsHTMLAnchorElement.obj nsHTMLAppletElement.obj nsHTMLAreaElement.obj nsHTMLBRElement.obj nsHTMLBodyElement.obj nsHTMLButtonElement.obj nsHTMLCanvasElement.obj nsHTMLDelElement.obj nsHTMLDivElement.obj nsHTMLFieldSetElement.obj nsHTMLFontElement.obj nsHTMLFormElement.obj nsHTMLFrameElement.obj nsHTMLFrameSetElement.obj nsHTMLHRElement.obj nsHTMLHeadElement.obj nsHTMLHeadingElement.obj nsHTMLHtmlElement.obj nsHTMLIFrameElement.obj nsHTMLImageElement.obj nsHTMLInputElement.obj nsHTMLLIElement.obj nsHTMLLabelElement.obj nsHTMLLegendElement.obj nsHTMLLinkElement.obj nsHTMLMapElement.obj nsHTMLMetaElement.obj nsHTMLOListElement.obj nsHTMLObjectElement.obj nsHTMLOptionElement.obj nsHTMLOptGroupElement.obj nsHTMLParagraphElement.obj nsHTMLPreElement.obj nsHTMLScriptElement.obj nsHTMLSelectElement.obj nsHTMLSharedElement.obj nsHTMLSpanElement.obj nsHTMLStyleElement.obj nsHTMLTableElement.obj nsHTMLTableCaptionElement.obj nsHTMLTableCellElement.obj nsHTMLTableColElement.obj nsHTMLTableRowElement.obj nsHTMLTableSectionElement.obj nsHTMLTextAreaElement.obj nsHTMLTitleElement.obj  
nsinstall -m 644 gkconhtmlcon_s.lib %base\dist\lib

cd %base\content\html\document\src
lib -NOLOGO %ltcg -OUT:"gkconhtmldoc_s.lib"  nsHTMLContentSink.obj nsHTMLFragmentContentSink.obj nsHTMLDocument.obj nsMediaDocument.obj nsPluginDocument.obj nsImageDocument.obj nsWyciwygChannel.obj nsWyciwygProtocolHandler.obj  
nsinstall -m 644 gkconhtmldoc_s.lib %base\dist\lib

cd %base\content\xml\content\src
lib -NOLOGO %ltcg -OUT:"gkconxmlcon_s.lib"  nsXMLElement.obj nsXMLCDATASection.obj nsXMLProcessingInstruction.obj nsXMLStylesheetPI.obj  
nsinstall -m 644 gkconxmlcon_s.lib %base\dist\lib

cd %base\content\xml\document\src
lib -NOLOGO %ltcg -OUT:"gkconxmldoc_s.lib"  nsXMLContentSink.obj nsXMLFragmentContentSink.obj nsXMLDocument.obj nsXMLPrettyPrinter.obj  
nsinstall -m 644 gkconxmldoc_s.lib %base\dist\lib

cd %base\content\xul\document\src
lib -NOLOGO %ltcg -OUT:"gkconxuldoc_s.lib"  nsXULControllers.obj nsElementMap.obj nsXULCommandDispatcher.obj nsXULContentSink.obj nsXULDocument.obj nsXULPrototypeCache.obj nsXULPrototypeDocument.obj  
nsinstall -m 644 gkconxuldoc_s.lib %base\dist\lib

cd %base\content\xul\content\src
lib -NOLOGO %ltcg -OUT:"gkconxulcon_s.lib"  nsXULAtoms.obj nsXULElement.obj nsXULPopupListener.obj  
nsinstall -m 644 gkconxulcon_s.lib %base\dist\lib

cd %base\content\xul\templates\src
lib -NOLOGO %ltcg -OUT:"gkconxultmpl_s.lib"  nsClusterKey.obj nsClusterKeySet.obj nsConflictSet.obj nsContentSupportMap.obj nsContentTagTestNode.obj nsContentTestNode.obj nsInstantiationNode.obj nsTreeRowTestNode.obj nsTreeRows.obj nsRDFConInstanceTestNode.obj nsRDFConMemberTestNode.obj nsRDFPropertyTestNode.obj nsResourceSet.obj nsRuleNetwork.obj nsTemplateMatch.obj nsTemplateMatchSet.obj nsTemplateRule.obj nsXULContentBuilder.obj nsXULContentUtils.obj nsXULTreeBuilder.obj nsXULSortService.obj nsXULTemplateBuilder.obj  
nsinstall -m 644 gkconxultmpl_s.lib %base\dist\lib

cd %base\content\xbl\src
lib -NOLOGO %ltcg -OUT:"gkconxbl_s.lib"  nsXBLAtoms.obj nsXBLBinding.obj nsXBLPrototypeBinding.obj nsXBLPrototypeResources.obj nsXBLResourceLoader.obj nsXBLDocumentInfo.obj nsXBLContentSink.obj nsXBLProtoImplProperty.obj nsXBLProtoImplMethod.obj nsXBLProtoImplField.obj nsXBLProtoImpl.obj nsXBLEventHandler.obj nsXBLWindowHandler.obj nsXBLWindowKeyHandler.obj nsXBLWindowDragHandler.obj nsXBLPrototypeHandler.obj nsXBLService.obj nsBindingManager.obj nsXBLInsertionPoint.obj  
nsinstall -m 644 gkconxbl_s.lib %base\dist\lib

cd %base\content\svg\document\src
lib -NOLOGO %ltcg -OUT:"gkconsvgdoc_s.lib"  nsSVGDocument.obj  
nsinstall -m 644 gkconsvgdoc_s.lib %base\dist\lib

cd %base\content\svg\content\src
lib -NOLOGO %ltcg -OUT:"gkcontentsvg_s.lib"  nsDOMSVGZoomEvent.obj nsDOMSVGEvent.obj nsSVGAngle.obj nsSVGAnimatedAngle.obj nsSVGAnimatedEnumeration.obj nsSVGAnimatedLength.obj nsSVGAnimatedLengthList.obj nsSVGAnimatedNumber.obj nsSVGAnimatedNumberList.obj nsSVGAnimatedRect.obj nsSVGAnimatedPreserveAspectRatio.obj nsSVGAnimatedString.obj nsSVGAnimatedTransformList.obj nsSVGAtoms.obj nsSVGCircleElement.obj nsSVGClassValue.obj nsSVGClipPathElement.obj nsSVGCoordCtxProvider.obj nsSVGDefsElement.obj nsSVGDescElement.obj nsSVGElement.obj nsSVGElementFactory.obj nsSVGEllipseElement.obj nsSVGEnum.obj nsSVGFeatures.obj nsSVGGElement.obj nsSVGGenericStringValue.obj nsSVGGradientElement.obj nsSVGGraphicElement.obj nsSVGImageElement.obj nsSVGLength.obj nsSVGLengthList.obj nsSVGLineElement.obj nsSVGMarkerElement.obj nsSVGMatrix.obj nsSVGMetadataElement.obj nsSVGNumber.obj nsSVGNumberList.obj nsSVGPathDataParser.obj nsSVGPathElement.obj nsSVGPathSeg.obj nsSVGPathSegList.obj nsSVGPoint.obj nsSVGPointList.obj nsSVGPolygonElement.obj nsSVGPolylineElement.obj nsSVGPreserveAspectRatio.obj nsSVGScriptElement.obj nsSVGStringProxyValue.obj nsSVGStylableElement.obj nsSVGRect.obj nsSVGRectElement.obj nsSVGSVGElement.obj nsSVGStopElement.obj nsSVGStyleElement.obj nsSVGSymbolElement.obj nsSVGTSpanElement.obj nsSVGTextElement.obj nsSVGTitleElement.obj nsSVGTransform.obj nsSVGTransformList.obj nsSVGUseElement.obj nsSVGValue.obj  
nsinstall -m 644 gkcontentsvg_s.lib %base\dist\lib

cd %base\content\xtf\src
lib -NOLOGO %ltcg -OUT:"gkcontentxtf_s.lib"  nsXMLContentBuilder.obj nsXTFElementWrapper.obj nsXTFGenericElementWrapper.obj nsXTFInterfaceAggregator.obj nsXTFService.obj nsXTFVisualWrapper.obj nsXTFWeakTearoff.obj nsXTFXMLVisualWrapper.obj nsXTFXULVisualWrapper.obj nsXTFBindableElementWrapper.obj nsXTFSVGVisualWrapper.obj  
nsinstall -m 644 gkcontentxtf_s.lib %base\dist\lib

cd %base\content\events\src
lib -NOLOGO %ltcg -OUT:"gkconevents_s.lib"  nsEventListenerManager.obj nsEventStateManager.obj nsDOMEvent.obj nsDOMUIEvent.obj nsDOMKeyboardEvent.obj nsDOMTextEvent.obj nsDOMMouseEvent.obj nsDOMMutationEvent.obj nsDOMPopupBlockedEvent.obj nsDOMBeforeUnloadEvent.obj nsDOMPageTransitionEvent.obj nsPrivateTextRange.obj nsDOMEventGroup.obj nsXMLEventsManager.obj nsXMLEventsElement.obj nsPLDOMEvent.obj  
nsinstall -m 644 gkconevents_s.lib %base\dist\lib

cd %base\layout\style
lib -NOLOGO %ltcg -OUT:"gkstyle_s.lib"  nsCSSAnonBoxes.obj nsCSSDataBlock.obj nsCSSDeclaration.obj nsCSSKeywords.obj nsCSSLoader.obj nsCSSOMFactory.obj nsCSSParser.obj nsCSSProps.obj nsCSSPseudoClasses.obj nsCSSPseudoElements.obj nsCSSRule.obj nsCSSRules.obj nsCSSScanner.obj nsCSSStruct.obj nsCSSStyleRule.obj nsCSSStyleSheet.obj nsCSSValue.obj nsComputedDOMStyle.obj nsDOMCSSAttrDeclaration.obj nsDOMCSSDeclaration.obj nsDOMCSSRGBColor.obj nsDOMCSSRect.obj nsDOMCSSValueList.obj nsHTMLCSSStyleSheet.obj nsHTMLStyleSheet.obj nsInspectorCSSUtils.obj nsLayoutStylesheetCache.obj nsROCSSPrimitiveValue.obj nsRuleNode.obj nsStyleContext.obj nsStyleCoord.obj nsStyleSet.obj nsStyleStruct.obj nsStyleUtil.obj  
nsinstall -m 644 gkstyle_s.lib %base\dist\lib

cd %base\layout\base
lib -NOLOGO %ltcg -OUT:"gkbase_s.lib"  nsBidiUtils.obj nsCSSColorUtils.obj nsCSSFrameConstructor.obj nsCSSRendering.obj nsCaret.obj nsChildIterator.obj nsCounterManager.obj nsDocumentViewer.obj nsFrameContentIterator.obj nsFrameManager.obj nsFrameTraversal.obj nsGenConList.obj nsImageLoader.obj nsLayoutAtoms.obj nsLayoutDebugger.obj nsLayoutHistoryState.obj nsLayoutUtils.obj nsPresContext.obj nsPresShell.obj nsPresState.obj nsQuoteList.obj nsStyleChangeList.obj nsStyleSheetService.obj nsBidiPresUtils.obj nsBidi.obj  
nsinstall -m 644 gkbase_s.lib %base\dist\lib

cd %base\layout\generic
lib -NOLOGO %ltcg -OUT:"gkgeneric_s.lib"  nsAbsoluteContainingBlock.obj nsAreaFrame.obj nsBRFrame.obj nsBlockBandData.obj nsBlockFrame.obj nsBlockReflowContext.obj nsBlockReflowState.obj nsBulletFrame.obj nsColumnSetFrame.obj nsContainerFrame.obj nsFirstLetterFrame.obj nsFrame.obj nsFrameFrame.obj nsFrameList.obj nsFrameSetFrame.obj nsFrameUtil.obj nsGfxScrollFrame.obj nsHTMLCanvasFrame.obj nsHTMLContainerFrame.obj nsHTMLFrame.obj nsHTMLReflowCommand.obj nsHTMLReflowState.obj nsImageFrame.obj nsImageMap.obj nsInlineFrame.obj nsIntervalSet.obj nsLeafFrame.obj nsLineBox.obj nsLineLayout.obj nsObjectFrame.obj nsPageContentFrame.obj nsPageFrame.obj nsPlaceholderFrame.obj nsReflowPath.obj nsSelection.obj nsSimplePageSequence.obj nsSpaceManager.obj nsSpacerFrame.obj nsSplittableFrame.obj nsTextFrame.obj nsTextTransformer.obj nsViewportFrame.obj nsBidiFrames.obj  
nsinstall -m 644 gkgeneric_s.lib %base\dist\lib

cd %base\layout\forms
lib -NOLOGO %ltcg -OUT:"gkforms_s.lib"  nsButtonFrameRenderer.obj nsComboboxControlFrame.obj nsFieldSetFrame.obj nsFileControlFrame.obj nsFormControlFrame.obj nsFormControlHelper.obj nsGfxButtonControlFrame.obj nsGfxCheckboxControlFrame.obj nsGfxRadioControlFrame.obj nsTextControlFrame.obj nsHTMLButtonControlFrame.obj nsImageControlFrame.obj nsLegendFrame.obj nsListControlFrame.obj nsIsIndexFrame.obj nsSelectsAreaFrame.obj  
nsinstall -m 644 gkforms_s.lib %base\dist\lib

cd %base\layout\printing
lib -NOLOGO %ltcg -OUT:"gkprinting_s.lib"  nsPrintEngine.obj nsPrintData.obj nsPrintObject.obj nsPagePrintTimer.obj nsPrintPreviewListener.obj  
nsinstall -m 644 gkprinting_s.lib %base\dist\lib

cd %base\layout\tables
lib -NOLOGO %ltcg -OUT:"gktable_s.lib"  BasicTableLayoutStrategy.obj FixedTableLayoutStrategy.obj nsCellMap.obj nsTableCellFrame.obj nsTableColFrame.obj nsTableColGroupFrame.obj nsTableFrame.obj nsTableOuterFrame.obj nsTableRowFrame.obj nsTableRowGroupFrame.obj nsTablePainter.obj  
nsinstall -m 644 gktable_s.lib %base\dist\lib

cd %base\layout\xul\base\src
lib -NOLOGO %ltcg -OUT:"gkxulbase_s.lib"  nsScrollBoxFrame.obj nsRootBoxFrame.obj nsBox.obj nsBoxFrame.obj nsBoxLayoutState.obj nsSprocketLayout.obj nsStackFrame.obj nsStackLayout.obj nsBoxLayout.obj nsScrollbarFrame.obj nsScrollbarButtonFrame.obj nsButtonBoxFrame.obj nsSliderFrame.obj nsNativeScrollbarFrame.obj nsRepeatService.obj nsXULTooltipListener.obj nsScrollBoxObject.obj nsBrowserBoxObject.obj nsIFrameBoxObject.obj nsEditorBoxObject.obj nsMenuBoxObject.obj nsPopupBoxObject.obj nsListBoxObject.obj nsBoxObject.obj nsImageBoxFrame.obj nsDocElementBoxFrame.obj nsLeafBoxFrame.obj nsTextBoxFrame.obj nsGroupBoxFrame.obj nsFrameNavigator.obj nsSplitterFrame.obj nsGrippyFrame.obj nsDeckFrame.obj nsProgressMeterFrame.obj nsMenuPopupFrame.obj nsMenuFrame.obj nsMenuBarFrame.obj nsMenuBarListener.obj nsMenuListener.obj nsMenuDismissalListener.obj nsPopupSetFrame.obj nsTitleBarFrame.obj nsResizerFrame.obj nsListBoxBodyFrame.obj nsListItemFrame.obj nsListBoxLayout.obj  
nsinstall -m 644 gkxulbase_s.lib %base\dist\lib

cd %base\layout\xul\base\src\tree\src
lib -NOLOGO %ltcg -OUT:"gkxultree_s.lib"  nsTreeBodyFrame.obj nsTreeBoxObject.obj nsTreeColFrame.obj nsTreeColumns.obj nsTreeContentView.obj nsTreeImageListener.obj nsTreeSelection.obj nsTreeStyleCache.obj nsTreeUtils.obj  
nsinstall -m 644 gkxultree_s.lib %base\dist\lib

cd %base\layout\xul\base\src\grid
lib -NOLOGO %ltcg -OUT:"gkxulgrid_s.lib"  nsGridLayout2.obj nsGridRowLayout.obj nsGridRowLeafLayout.obj nsGridRowLeafFrame.obj nsGridRowGroupLayout.obj nsGridRowGroupFrame.obj nsGrid.obj nsGridRow.obj nsGridCell.obj  
nsinstall -m 644 gkxulgrid_s.lib %base\dist\lib

cd %base\layout\mathml\content\src
lib -NOLOGO %ltcg -OUT:"gkmathmlcon_s.lib"  nsMathMLAtoms.obj nsMathMLOperators.obj  
nsinstall -m 644 gkmathmlcon_s.lib %base\dist\lib

cd %base\layout\mathml\base\src
lib -NOLOGO %ltcg -OUT:"gkmathmlbase_s.lib"  nsMathMLChar.obj nsMathMLFrame.obj nsMathMLContainerFrame.obj nsMathMLForeignFrameWrapper.obj nsMathMLTokenFrame.obj nsMathMLmoFrame.obj nsMathMLmrowFrame.obj nsMathMLmphantomFrame.obj nsMathMLmfencedFrame.obj nsMathMLmfracFrame.obj nsMathMLmsupFrame.obj nsMathMLmsubFrame.obj nsMathMLmsubsupFrame.obj nsMathMLmmultiscriptsFrame.obj nsMathMLmtableFrame.obj nsMathMLmunderFrame.obj nsMathMLmoverFrame.obj nsMathMLmunderoverFrame.obj nsMathMLmpaddedFrame.obj nsMathMLmspaceFrame.obj nsMathMLmstyleFrame.obj nsMathMLmsqrtFrame.obj nsMathMLmrootFrame.obj nsMathMLmactionFrame.obj  
nsinstall -m 644 gkmathmlbase_s.lib %base\dist\lib

cd %base\layout\xtf\src
lib -NOLOGO %ltcg -OUT:"gkxtfbase_s.lib"  nsXTFXULDisplayFrame.obj nsXTFXMLDisplayFrame.obj nsXTFFrameUtils.obj nsXTFSVGDisplayFrame.obj  
nsinstall -m 644 gkxtfbase_s.lib %base\dist\lib

cd %base\layout\svg\base\src
lib -NOLOGO %ltcg -OUT:"gksvgbase_s.lib"  nsSVGCircleFrame.obj nsSVGClipPathFrame.obj nsSVGDefsFrame.obj nsSVGEllipseFrame.obj nsSVGGFrame.obj nsSVGGenericContainerFrame.obj nsSVGGlyphFrame.obj nsSVGGradientFrame.obj nsSVGImageFrame.obj nsSVGInnerSVGFrame.obj nsSVGLineFrame.obj nsSVGMarkerFrame.obj nsSVGOuterSVGFrame.obj nsSVGPathFrame.obj nsSVGPathGeometryFrame.obj nsSVGPolygonFrame.obj nsSVGPolylineFrame.obj nsSVGRectFrame.obj nsSVGStopFrame.obj nsSVGTSpanFrame.obj nsSVGTextFrame.obj nsSVGUseFrame.obj nsSVGUtils.obj  
nsinstall -m 644 gksvgbase_s.lib %base\dist\lib

cd %base\layout\svg\renderer\src\cairo
lib -NOLOGO %ltcg -OUT:"gksvgrenderercairo_s.lib"  nsSVGRendererCairo.obj nsSVGCairoCanvas.obj nsSVGCairoPathGeometry.obj nsSVGCairoPathBuilder.obj nsSVGCairoRegion.obj nsSVGCairoGlyphMetrics.obj nsSVGCairoGlyphGeometry.obj nsSVGCairoGradient.obj nsSVGCairoSurface.obj  
nsinstall -m 644 gksvgrenderercairo_s.lib %base\dist\lib

cd %base\xpfe\components\shistory\src
lib -NOLOGO %ltcg -OUT:"shistory_s.lib"  nsSHEntry.obj nsSHTransaction.obj nsSHistory.obj  
nsinstall -m 644 shistory_s.lib %base\dist\lib

cd %base\docshell\base
lib -NOLOGO %ltcg -OUT:"basedocshell_s.lib"  nsDocShell.obj nsWebShell.obj nsDocShellLoadInfo.obj nsDocShellEditorData.obj nsDocShellTransferableHooks.obj nsDocShellEnumerator.obj nsDSURIContentListener.obj nsDefaultURIFixup.obj nsGlobalHistoryAdapter.obj nsGlobalHistory2Adapter.obj nsWebNavigationInfo.obj  
nsinstall -m 644 basedocshell_s.lib %base\dist\lib

cd %base\embedding\base
lib -NOLOGO %ltcg -OUT:"embed_base_s.lib"  nsEmbedAPI.obj nsEmbedWin32.obj  
nsinstall -m 644 embed_base_s.lib %base\dist\lib

cd %base\embedding\components\windowwatcher\src
lib -NOLOGO %ltcg -OUT:"windowwatcher_s.lib"  nsPrompt.obj nsWWJSUtils.obj nsWindowWatcher.obj nsDialogParamBlock.obj nsPromptService.obj  
nsinstall -m 644 windowwatcher_s.lib %base\dist\lib

cd %base\embedding\components\appstartup\src
lib -NOLOGO %ltcg -OUT:"appstartupnotifier_s.lib"  nsAppStartupNotifier.obj  
nsinstall -m 644 appstartupnotifier_s.lib %base\dist\lib

cd %base\embedding\components\find\src
lib -NOLOGO %ltcg -OUT:"find_s.lib"  nsWebBrowserFind.obj nsFind.obj  
nsinstall -m 644 find_s.lib %base\dist\lib

cd %base\embedding\components\webbrowserpersist\src
lib -NOLOGO %ltcg -OUT:"webbrowserpersist_s.lib"  nsWebBrowserPersist.obj  
nsinstall -m 644 webbrowserpersist_s.lib %base\dist\lib

cd %base\embedding\components\commandhandler\src
lib -NOLOGO %ltcg -OUT:"commandhandler_s.lib"  nsBaseCommandController.obj nsCommandGroup.obj nsCommandManager.obj nsCommandParams.obj nsControllerCommandTable.obj  
nsinstall -m 644 commandhandler_s.lib %base\dist\lib

cd %base\embedding\components\jsconsole\src
lib -NOLOGO %ltcg -OUT:"jsconsole_s.lib"  nsJSConsoleService.obj  
nsinstall -m 644 jsconsole_s.lib %base\dist\lib

cd %base\embedding\components\printingui\src\win
lib -NOLOGO %ltcg -OUT:"printingui_s.lib"  nsPrintingPromptService.obj nsPrintProgressParams.obj nsPrintProgress.obj nsPrintDialogUtil.obj  
nsinstall -m 644 printingui_s.lib %base\dist\lib

cd %base\embedding\browser\webBrowser
lib -NOLOGO %ltcg -OUT:"nsWebBrowser_s.lib"  nsDocShellTreeOwner.obj nsWebBrowser.obj nsCommandHandler.obj nsWebBrowserContentPolicy.obj nsContextMenuInfo.obj nsEmbedStream.obj  
nsinstall -m 644 nsWebBrowser_s.lib %base\dist\lib

cd %base\editor\txtsvc\src
lib -NOLOGO %ltcg -OUT:"txtsvc_s.lib"  nsFilteredContentIterator.obj nsTextServicesDocument.obj nsTSDNotifier.obj  
nsinstall -m 644 txtsvc_s.lib %base\dist\lib

cd %base\editor\libeditor\base
lib -NOLOGO %ltcg -OUT:"editorbase_s.lib"  nsEditor.obj nsEditorCommands.obj nsEditorController.obj nsEditorUtils.obj nsSelectionState.obj EditTxn.obj PlaceholderTxn.obj ChangeAttributeTxn.obj ChangeCSSInlineStyleTxn.obj CreateElementTxn.obj DeleteElementTxn.obj DeleteRangeTxn.obj DeleteTextTxn.obj EditAggregateTxn.obj IMETextTxn.obj InsertElementTxn.obj InsertTextTxn.obj JoinElementTxn.obj SetDocTitleTxn.obj SplitElementTxn.obj nsStyleSheetTxns.obj TransactionFactory.obj  
nsinstall -m 644 editorbase_s.lib %base\dist\lib

cd %base\editor\libeditor\text
lib -NOLOGO %ltcg -OUT:"texteditor_s.lib"  nsPlaintextDataTransfer.obj nsPlaintextEditor.obj nsTextEditUtils.obj nsTextEditRules.obj nsEditorEventListeners.obj nsWrapUtils.obj nsInternetCiter.obj nsAOLCiter.obj nsTextEditRulesBidi.obj  
nsinstall -m 644 texteditor_s.lib %base\dist\lib

cd %base\editor\libeditor\html
lib -NOLOGO %ltcg -OUT:"htmleditor_s.lib"  nsEditProperty.obj nsHTMLAbsPosition.obj nsHTMLAnonymousUtils.obj nsHTMLDataTransfer.obj nsHTMLCSSUtils.obj nsHTMLEditor.obj nsHTMLEditorStyle.obj nsHTMLEditRules.obj nsHTMLEditUtils.obj nsHTMLObjectResizer.obj nsHTMLEditorMouseListener.obj nsHTMLInlineTableEditor.obj nsHTMLURIRefObject.obj nsTableEditor.obj nsWSRunObject.obj TypeInState.obj TextEditorTest.obj  
nsinstall -m 644 htmleditor_s.lib %base\dist/lib

cd %base\accessible\src\msaa
lib -NOLOGO %ltcg -OUT:"accessibility_toolkit_s.lib"  nsAccessNodeWrap.obj nsAccessibleWrap.obj nsTextAccessibleWrap.obj nsDocAccessibleWrap.obj nsRootAccessibleWrap.obj nsHTMLFormControlAccessibleWrap.obj nsHTMLWin32ObjectAccessible.obj nsXULMenuAccessibleWrap.obj nsXULTreeAccessibleWrap.obj  
nsinstall -m 644 accessibility_toolkit_s.lib %base\dist\lib

cd %base\accessible\src\base
lib -NOLOGO %ltcg -OUT:"accessibility_base_s.lib"  nsAccessNode.obj nsAccessibleEventData.obj nsDocAccessible.obj nsOuterDocAccessible.obj nsAccessibilityAtoms.obj nsAccessibilityService.obj nsAccessible.obj nsAccessibleTreeWalker.obj nsBaseWidgetAccessible.obj nsFormControlAccessible.obj nsRootAccessible.obj nsCaretAccessible.obj nsTextAccessible.obj  
nsinstall -m 644 accessibility_base_s.lib %base\dist\lib

cd %base\accessible\src\html
lib -NOLOGO %ltcg -OUT:"accessibility_html_s.lib"  nsHTMLAreaAccessible.obj nsHTMLFormControlAccessible.obj nsHTMLImageAccessible.obj nsHTMLLinkAccessible.obj nsHTMLSelectAccessible.obj nsHTMLTableAccessible.obj nsHTMLTextAccessible.obj  
nsinstall -m 644 accessibility_html_s.lib %base\dist\lib

cd %base\accessible\src\xul
lib -NOLOGO %ltcg -OUT:"accessibility_xul_s.lib"  nsXULAlertAccessible.obj nsXULColorPickerAccessible.obj nsXULFormControlAccessible.obj nsXULMenuAccessible.obj nsXULSelectAccessible.obj nsXULTabAccessible.obj nsXULTextAccessible.obj nsXULTreeAccessible.obj  
nsinstall -m 644 accessibility_xul_s.lib %base\dist\lib

cd %base\rdf\chrome\src
lib -NOLOGO %ltcg -OUT:"chrome_s.lib"  nsChromeRegistry.obj nsChromeUIDataSource.obj nsChromeProtocolHandler.obj  
nsinstall -m 644 chrome_s.lib %base\dist\lib

cd %base\profile\dirserviceprovider\src
lib -NOLOGO %ltcg -OUT:"profdirserviceprovider_s.lib"  nsProfileDirServiceProvider.obj nsProfileLock.obj  
nsinstall -m 644 profdirserviceprovider_s.lib %base\dist\lib

cd %base\profile\dirserviceprovider\standalone
lib -NOLOGO %ltcg -OUT:"profdirserviceprovidersa_s.lib"  nsProfileDirServiceProvider.obj nsProfileLock.obj  
nsinstall -m 644 profdirserviceprovidersa_s.lib %base\dist\lib

cd %base\profile\src
lib -NOLOGO %ltcg -OUT:"profile_s.lib"  nsProfile.obj nsProfileAccess.obj  
nsinstall -m 644 profile_s.lib %base\dist\lib

cd %base\db\mork\src
lib -NOLOGO %ltcg -OUT:"msgmork_s.lib"  orkinHeap.obj morkArray.obj morkAtom.obj morkAtomMap.obj morkAtomSpace.obj morkBlob.obj morkBuilder.obj morkCell.obj morkCellObject.obj morkCh.obj morkConfig.obj morkCursor.obj morkDeque.obj morkEnv.obj morkFactory.obj morkFile.obj morkHandle.obj morkIntMap.obj morkMap.obj morkNode.obj morkNodeMap.obj morkObject.obj morkParser.obj morkPool.obj morkRow.obj morkRowCellCursor.obj morkRowMap.obj morkRowObject.obj morkRowSpace.obj morkSink.obj morkSpace.obj morkStore.obj morkStream.obj morkTable.obj morkPortTableCursor.obj morkTableRowCursor.obj morkThumb.obj morkWriter.obj morkYarn.obj morkBead.obj morkProbeMap.obj morkZone.obj morkSearchRowCursor.obj  
nsinstall -m 644 msgmork_s.lib %base\dist\lib

cd %base\xpfe\browser\src
lib -NOLOGO %ltcg -OUT:"mozbrwsr_s.lib"  nsBrowserInstance.obj nsBrowserStatusFilter.obj  
nsinstall -m 644 mozbrwsr_s.lib %base\dist\lib

cd %base\xpfe\components\directory
lib -NOLOGO %ltcg -OUT:"directory_s.lib"  nsDirectoryViewer.obj  
nsinstall -m 644 directory_s.lib %base\dist\lib

cd %base\xpfe\components\intl
lib -NOLOGO %ltcg -OUT:"appcompintl_s.lib"  nsCharsetMenu.obj nsFontPackageHandler.obj  
nsinstall -m 644 appcompintl_s.lib %base\dist\lib

cd %base\xpfe\components\windowds
lib -NOLOGO %ltcg -OUT:"windowds_s.lib"  nsWindowDataSource.obj  
nsinstall -m 644 windowds_s.lib %base\dist\lib

cd %base\xpfe\components\related\src
lib -NOLOGO %ltcg -OUT:"related_s.lib"  nsRelatedLinksHandler.obj  
nsinstall -m 644 related_s.lib %base\dist\lib

cd %base\xpfe\components\autocomplete\src
lib -NOLOGO %ltcg -OUT:"autocomplete_s.lib"  nsAutoComplete.obj nsLDAPAutoCompleteSession.obj  
nsinstall -m 644 autocomplete_s.lib %base\dist\lib

cd %base\xpfe\components\bookmarks\src
lib -NOLOGO %ltcg -OUT:"bookmarks_s.lib"  nsBookmarksService.obj  
nsinstall -m 644 bookmarks_s.lib %base\dist\lib

cd %base\xpfe\components\download-manager\src
lib -NOLOGO %ltcg -OUT:"downloadmanager_s.lib"  nsDownloadManager.obj  
nsinstall -m 644 downloadmanager_s.lib %base\dist\lib

cd %base\xpfe\components\history\src
lib -NOLOGO %ltcg -OUT:"history_s.lib"  nsGlobalHistory.obj  
nsinstall -m 644 history_s.lib %base\dist\lib

cd %base\xpfe\components\startup\src
lib -NOLOGO %ltcg -OUT:"appstartup_s.lib"  nsAppStartup.obj nsCommandLineService.obj nsUserInfoWin.obj  
nsinstall -m 644 appstartup_s.lib %base\dist\lib

cd %base\xpfe\components\alerts\src
lib -NOLOGO %ltcg -OUT:"alerts_s.lib"  nsAlertsService.obj  
nsinstall -m 644 alerts_s.lib %base\dist\lib

cd %base\xpfe\components\urlwidget
lib -NOLOGO %ltcg -OUT:"urlwidgt_s.lib"  nsUrlWidget.obj  
nsinstall -m 644 urlwidgt_s.lib %base\dist\lib

cd %base\xpfe\components\winhooks
lib -NOLOGO %ltcg -OUT:"winhooks_s.lib"  nsWindowsHooks.obj  
nsinstall -m 644 winhooks_s.lib %base\dist\lib

cd %base\..\security\nss\lib\util
lib -NOLOGO %ltcg -OUT:"%base\nss\secutil\secutil.lib" %base\nss\secutil\quickder.obj %base\nss\secutil\secdig.obj %base\nss\secutil\derdec.obj %base\nss\secutil\derenc.obj %base\nss\secutil\dersubr.obj %base\nss\secutil\dertime.obj %base\nss\secutil\nssb64d.obj %base\nss\secutil\nssb64e.obj %base\nss\secutil\nssrwlk.obj %base\nss\secutil\nssilock.obj %base\nss\secutil\nsslocks.obj %base\nss\secutil\portreg.obj %base\nss\secutil\pqgutil.obj %base\nss\secutil\secalgid.obj %base\nss\secutil\secasn1d.obj %base\nss\secutil\secasn1e.obj %base\nss\secutil\secasn1u.obj %base\nss\secutil\secitem.obj %base\nss\secutil\secoid.obj %base\nss\secutil\sectime.obj %base\nss\secutil\secport.obj %base\nss\secutil\secinit.obj %base\nss\secutil\utf8.obj
nsinstall -m 664 %base\nss\secutil\secutil.lib %base\dist\lib

cd %base\..\security\nss\lib\freebl
lib -NOLOGO %ltcg -OUT:"%base\nss\freebl\freebl.lib" %base\nss\freebl\ldvector.obj %base\nss\freebl\prng_fips1861.obj %base\nss\freebl\sysrand.obj %base\nss\freebl\sha_fast.obj %base\nss\freebl\md2.obj %base\nss\freebl\md5.obj %base\nss\freebl\sha512.obj %base\nss\freebl\alg2268.obj %base\nss\freebl\arcfour.obj %base\nss\freebl\arcfive.obj %base\nss\freebl\desblapi.obj %base\nss\freebl\des.obj %base\nss\freebl\rijndael.obj %base\nss\freebl\aeskeywrap.obj %base\nss\freebl\dh.obj %base\nss\freebl\ec.obj %base\nss\freebl\pqg.obj %base\nss\freebl\dsa.obj %base\nss\freebl\rsa.obj %base\nss\freebl\shvfy.obj %base\nss\freebl\mpprime.obj %base\nss\freebl\mpmontg.obj %base\nss\freebl\mplogic.obj %base\nss\freebl\mpi.obj %base\nss\freebl\mp_gf2m.obj %base\nss\freebl\mpi_x86.obj
nsinstall -m 664 %base\nss\freebl\freebl.lib %base\dist\lib

cd %base\..\security\nss\lib\softoken
 lib -NOLOGO %ltcg -OUT:"%base\nss\softokn\softokn.lib" %base\nss\softokn\alghmac.obj %base\nss\softokn\dbinit.obj %base\nss\softokn\dbmshim.obj %base\nss\softokn\ecdecode.obj %base\nss\softokn\fipstest.obj %base\nss\softokn\fipstokn.obj %base\nss\softokn\keydb.obj %base\nss\softokn\lowcert.obj %base\nss\softokn\lowkey.obj %base\nss\softokn\lowpbe.obj %base\nss\softokn\padbuf.obj %base\nss\softokn\pcertdb.obj %base\nss\softokn\pk11db.obj %base\nss\softokn\pkcs11.obj %base\nss\softokn\pkcs11c.obj %base\nss\softokn\pkcs11u.obj %base\nss\softokn\rawhash.obj %base\nss\softokn\rsawrapr.obj %base\nss\softokn\softkver.obj %base\nss\softokn\tlsprf.obj
nsinstall -m 664 %base\nss\softokn\softokn.lib %base\dist\lib

cd %base\..\security\nss\lib\base
lib -NOLOGO %ltcg -OUT:"%base\nss\nssb\nssb.lib" %base\nss\nssb\arena.obj %base\nss\nssb\error.obj %base\nss\nssb\errorval.obj %base\nss\nssb\hashops.obj %base\nss\nssb\libc.obj %base\nss\nssb\tracker.obj %base\nss\nssb\item.obj %base\nss\nssb\utf8.obj %base\nss\nssb\list.obj %base\nss\nssb\hash.obj %base\nss\nssb\whatnspr.obj
nsinstall -m 664 %base\nss\nssb\nssb.lib %base\dist\lib

cd %base\..\security\nss\lib\asn1
lib -NOLOGO %ltcg -OUT:"%base\nss\asn1\asn1.lib" %base\nss\asn1\asn1.obj
nsinstall -m 664 %base\nss\asn1\asn1.lib %base\dist\lib

cd %base\..\security\nss\lib\dev
lib -NOLOGO %ltcg -OUT:"%base\nss\nssdev\nssdev.lib" %base\nss\nssdev\devmod.obj %base\nss\nssdev\devslot.obj %base\nss\nssdev\devtoken.obj %base\nss\nssdev\devutil.obj %base\nss\nssdev\ckhelper.obj
nsinstall -m 664 %base\nss\nssdev\nssdev.lib %base\dist\lib

cd %base\..\security\nss\lib\pki
lib -NOLOGO %ltcg -OUT:"%base\nss\nsspki\nsspki.lib" %base\nss\nsspki\asymmkey.obj %base\nss\nsspki\certificate.obj %base\nss\nsspki\cryptocontext.obj %base\nss\nsspki\symmkey.obj %base\nss\nsspki\trustdomain.obj %base\nss\nsspki\tdcache.obj %base\nss\nsspki\certdecode.obj %base\nss\nsspki\pkistore.obj %base\nss\nsspki\pkibase.obj %base\nss\nsspki\pki3hack.obj
nsinstall -m 664 %base\nss\nsspki\nsspki.lib %base\dist\lib

cd %base\..\security\nss\lib\certdb
lib -NOLOGO %ltcg -OUT:"%base\nss\certdb\certdb.lib" %base\nss\certdb\alg1485.obj %base\nss\certdb\certdb.obj %base\nss\certdb\certv3.obj %base\nss\certdb\certxutl.obj %base\nss\certdb\crl.obj %base\nss\certdb\genname.obj %base\nss\certdb\stanpcertdb.obj %base\nss\certdb\polcyxtn.obj %base\nss\certdb\secname.obj %base\nss\certdb\xauthkid.obj %base\nss\certdb\xbsconst.obj %base\nss\certdb\xconst.obj
nsinstall -m 664 %base\nss\certdb\certdb.lib %base\dist\lib

cd %base\..\security\nss\lib\certhigh
lib -NOLOGO %ltcg -OUT:"%base\nss\certhi\certhi.lib" %base\nss\certhi\certhtml.obj %base\nss\certhi\certreq.obj %base\nss\certhi\crlv2.obj %base\nss\certhi\ocsp.obj %base\nss\certhi\certhigh.obj %base\nss\certhi\certvfy.obj %base\nss\certhi\xcrldist.obj
nsinstall -m 664 %base\nss\certhi\certhi.lib %base\dist\lib

cd %base\..\security\nss\lib\pk11wrap
lib -NOLOGO %ltcg -OUT:"%base\nss\pk11wrap\pk11wrap.lib" %base\nss\pk11wrap\dev3hack.obj %base\nss\pk11wrap\pk11akey.obj %base\nss\pk11wrap\pk11auth.obj %base\nss\pk11wrap\pk11cert.obj %base\nss\pk11wrap\pk11cxt.obj %base\nss\pk11wrap\pk11err.obj %base\nss\pk11wrap\pk11kea.obj %base\nss\pk11wrap\pk11list.obj %base\nss\pk11wrap\pk11load.obj %base\nss\pk11wrap\pk11mech.obj %base\nss\pk11wrap\pk11nobj.obj %base\nss\pk11wrap\pk11obj.obj %base\nss\pk11wrap\pk11pars.obj %base\nss\pk11wrap\pk11pbe.obj %base\nss\pk11wrap\pk11pk12.obj %base\nss\pk11wrap\pk11pqg.obj %base\nss\pk11wrap\pk11sdr.obj %base\nss\pk11wrap\pk11skey.obj %base\nss\pk11wrap\pk11slot.obj %base\nss\pk11wrap\pk11util.obj
nsinstall -m 664 %base\nss\pk11wrap\pk11wrap.lib %base\dist\lib

cd %base\..\security\nss\lib\cryptohi
lib -NOLOGO %ltcg -OUT:"%base\nss\cryptohi\cryptohi.lib" %base\nss\cryptohi\sechash.obj %base\nss\cryptohi\seckey.obj %base\nss\cryptohi\secsign.obj %base\nss\cryptohi\secvfy.obj %base\nss\cryptohi\dsautil.obj
nsinstall -m 664 %base\nss\cryptohi\cryptohi.lib %base\dist\lib

cd %base\..\security\nss\lib\nss
lib -NOLOGO %ltcg -OUT:"%base\nss\nss\nss.lib" %base\nss\nss\nssinit.obj %base\nss\nss\nssver.obj
nsinstall -m 664 %base\nss\nss\nss.lib %base\dist\lib

cd %base\..\security\nss\lib\ssl
lib -NOLOGO %ltcg -OUT:"%base\nss\ssl\ssl.lib" %base\nss\ssl\emulate.obj %base\nss\ssl\prelib.obj %base\nss\ssl\ssl3con.obj %base\nss\ssl\ssl3gthr.obj %base\nss\ssl\sslauth.obj %base\nss\ssl\sslcon.obj %base\nss\ssl\ssldef.obj %base\nss\ssl\sslenum.obj %base\nss\ssl\sslerr.obj %base\nss\ssl\sslgathr.obj %base\nss\ssl\sslmutex.obj %base\nss\ssl\sslnonce.obj %base\nss\ssl\sslreveal.obj %base\nss\ssl\sslsecur.obj %base\nss\ssl\sslsnce.obj %base\nss\ssl\sslsock.obj %base\nss\ssl\ssltrace.obj %base\nss\ssl\sslver.obj %base\nss\ssl\authcert.obj %base\nss\ssl\cmpcert.obj %base\nss\ssl\nsskea.obj %base\nss\ssl\sslinfo.obj %base\nss\ssl\win32err.obj
nsinstall -m 664 %base\nss\ssl\ssl.lib %base\dist\lib

cd %base\..\security\nss\lib\pkcs12
lib -NOLOGO %ltcg -OUT:"%base\nss\pkcs12\pkcs12.lib" %base\nss\pkcs12\p12local.obj %base\nss\pkcs12\p12creat.obj %base\nss\pkcs12\p12dec.obj %base\nss\pkcs12\p12plcy.obj %base\nss\pkcs12\p12tmpl.obj %base\nss\pkcs12\p12e.obj %base\nss\pkcs12\p12d.obj
nsinstall -m 664 %base\nss\pkcs12\pkcs12.lib %base\dist\lib

cd %base\..\security\nss\lib\pkcs7
lib -NOLOGO %ltcg -OUT:"%base\nss\pkcs7\pkcs7.lib" %base\nss\pkcs7\certread.obj %base\nss\pkcs7\p7common.obj %base\nss\pkcs7\p7create.obj %base\nss\pkcs7\p7decode.obj %base\nss\pkcs7\p7encode.obj %base\nss\pkcs7\p7local.obj %base\nss\pkcs7\secmime.obj
nsinstall -m 664 %base\nss\pkcs7\pkcs7.lib %base\dist\lib

cd %base\..\security\nss\lib\smime
lib -NOLOGO %ltcg -OUT:"%base\nss\smime\smime.lib" %base\nss\smime\cmsarray.obj %base\nss\smime\cmsasn1.obj %base\nss\smime\cmsattr.obj %base\nss\smime\cmscinfo.obj %base\nss\smime\cmscipher.obj %base\nss\smime\cmsdecode.obj %base\nss\smime\cmsdigdata.obj %base\nss\smime\cmsdigest.obj %base\nss\smime\cmsencdata.obj %base\nss\smime\cmsencode.obj %base\nss\smime\cmsenvdata.obj %base\nss\smime\cmsmessage.obj %base\nss\smime\cmspubkey.obj %base\nss\smime\cmsrecinfo.obj %base\nss\smime\cmsreclist.obj %base\nss\smime\cmssigdata.obj %base\nss\smime\cmssiginfo.obj %base\nss\smime\cmsutil.obj %base\nss\smime\smimemessage.obj %base\nss\smime\smimeutil.obj %base\nss\smime\smimever.obj
nsinstall -m 664 %base\nss\smime\smime.lib %base\dist\lib

cd %base\..\security\nss\lib\crmf
lib -NOLOGO %ltcg -OUT:"%base\nss\crmf\crmf.lib" %base\nss\crmf\crmfenc.obj %base\nss\crmf\crmftmpl.obj %base\nss\crmf\crmfreq.obj %base\nss\crmf\crmfpop.obj %base\nss\crmf\crmfdec.obj %base\nss\crmf\crmfget.obj %base\nss\crmf\crmfcont.obj %base\nss\crmf\cmmfasn1.obj %base\nss\crmf\cmmfresp.obj %base\nss\crmf\cmmfrec.obj %base\nss\crmf\cmmfchal.obj %base\nss\crmf\servget.obj %base\nss\crmf\encutil.obj %base\nss\crmf\respcli.obj %base\nss\crmf\respcmn.obj %base\nss\crmf\challcli.obj %base\nss\crmf\asn1cmn.obj
nsinstall -m 664 %base\nss\crmf\crmf.lib %base\dist\lib

cd %base\..\security\nss\lib\jar
lib -NOLOGO %ltcg -OUT:"%base\nss\jar\jar.lib" %base\nss\jar\jarver.obj %base\nss\jar\jarsign.obj %base\nss\jar\jar.obj %base\nss\jar\jar-ds.obj %base\nss\jar\jarfile.obj %base\nss\jar\jarevil.obj %base\nss\jar\jarjart.obj %base\nss\jar\jarint.obj
nsinstall -m 664 %base\nss\jar\jar.lib %base\dist\lib

cd %base\..\security\nss\lib\ckfw
lib -NOLOGO %ltcg -OUT:"%base\nss\nssckfw\nssckfw.lib" %base\nss\nssckfw\find.obj %base\nss\nssckfw\hash.obj %base\nss\nssckfw\instance.obj %base\nss\nssckfw\mutex.obj %base\nss\nssckfw\nsprstub.obj %base\nss\nssckfw\object.obj %base\nss\nssckfw\session.obj %base\nss\nssckfw\sessobj.obj %base\nss\nssckfw\slot.obj %base\nss\nssckfw\token.obj %base\nss\nssckfw\wrap.obj %base\nss\nssckfw\mechanism.obj
nsinstall -m 664 %base\nss\nssckfw\nssckfw.lib %base\dist\lib

cd %base\..\security\nss\lib\fortcrypt\swfort
lib -NOLOGO %ltcg -OUT:"%base\nss\swfci\swfci.lib" %base\nss\swfci\swfalg.obj %base\nss\swfci\swfparse.obj %base\nss\swfci\swflib.obj %base\nss\swfci\swfutl.obj %base\nss\swfci\nslib.obj
nsinstall -m 664 %base\nss\swfci\swfci.lib %base\dist\lib

cd %base\..\security\nss\cmd\lib
lib -NOLOGO %ltcg -OUT:"%base\nss\sectool\sectool.lib" %base\nss\sectool\secutil.obj %base\nss\sectool\secpwd.obj %base\nss\sectool\derprint.obj %base\nss\sectool\moreoids.obj %base\nss\sectool\pppolicy.obj %base\nss\sectool\secerror.obj %base\nss\sectool\ffs.obj
nsinstall -m 664 %base\nss\sectool\sectool.lib %base\dist\lib

cd %base\extensions\wallet\editor
lib -NOLOGO %ltcg -OUT:"walleteditor_s.lib"  nsWalletEditor.obj  
nsinstall -m 644 walleteditor_s.lib %base\dist\lib

cd %base\extensions\wallet\signonviewer
lib -NOLOGO %ltcg -OUT:"signonviewer_s.lib"  nsSignonViewer.obj  
nsinstall -m 644 signonviewer_s.lib %base\dist\lib

cd %base\extensions\wallet\walletpreview
lib -NOLOGO %ltcg -OUT:"walletpreview_s.lib"  nsWalletPreview.obj  
nsinstall -m 644 walletpreview_s.lib %base\dist\lib

cd %base\extensions\xmlextras\base\src
lib -NOLOGO %ltcg -OUT:"xmlextrasbase_s.lib"  nsDOMSerializer.obj nsXMLHttpRequest.obj nsDOMParser.obj nsLoadListenerProxy.obj nsRect.obj  
nsinstall -m 644 xmlextrasbase_s.lib %base\dist\lib

cd %base\extensions\xmlextras\pointers\src
lib -NOLOGO %ltcg -OUT:"xmlextraspointers_s.lib"  nsFIXptr.obj nsXPointer.obj  
nsinstall -m 644 xmlextraspointers_s.lib %base\dist\lib

cd %base\extensions\transformiix\source\base
lib -NOLOGO %ltcg -OUT:"txbase_s.lib"  Double.obj List.obj txAtoms.obj txExpandedNameMap.obj txNamespaceMap.obj txURIUtils.obj  
nsinstall -m 644 txbase_s.lib %base\dist\lib

cd %base\extensions\transformiix\source\xml
lib -NOLOGO %ltcg -OUT:"txxml_s.lib"  XMLUtils.obj  
nsinstall -m 644 txxml_s.lib %base\dist\lib

cd %base\extensions\transformiix\source\xml\parser
lib -NOLOGO %ltcg -OUT:"txxmlparser_s.lib"  txXMLParser.obj  
nsinstall -m 644 txxmlparser_s.lib %base\dist\lib

cd %base\extensions\transformiix\source\xpath
lib -NOLOGO %ltcg -OUT:"txxpath_s.lib"  AdditiveExpr.obj AttributeValueTemplate.obj BooleanExpr.obj BooleanFunctionCall.obj BooleanResult.obj ExprLexer.obj ExprParser.obj FilterExpr.obj FunctionCall.obj LocationStep.obj MultiplicativeExpr.obj NodeSetFunctionCall.obj NumberFunctionCall.obj NumberResult.obj PathExpr.obj PredicateList.obj RelationalExpr.obj RootExpr.obj StringFunctionCall.obj StringResult.obj txErrorExpr.obj txLiteralExpr.obj txNameTest.obj txNodeSet.obj txNodeTypeTest.obj txForwardContext.obj txNodeSetContext.obj txResultRecycler.obj UnionExpr.obj UnaryExpr.obj VariableRefExpr.obj nsXPathEvaluator.obj nsXPathException.obj nsXPathExpression.obj nsXPathNSResolver.obj nsXPathResult.obj nsXPath1Scheme.obj txMozillaXPathTreeWalker.obj nsXFormsXPathEvaluator.obj XFormsFunctionCall.obj  
nsinstall -m 644 txxpath_s.lib %base\dist\lib

cd %base\extensions\transformiix\source\xslt
lib -NOLOGO %ltcg -OUT:"txxslt_s.lib"  txBufferingHandler.obj txExecutionState.obj txInstructions.obj txOutputFormat.obj txRtfHandler.obj txStylesheet.obj txStylesheetCompileHandlers.obj txStylesheetCompiler.obj txTextHandler.obj txToplevelItems.obj txXSLTNumber.obj txXSLTNumberCounters.obj txXSLTPatterns.obj txXSLTProcessor.obj txPatternParser.obj txUnknownHandler.obj txMozillaStylesheetCompiler.obj txMozillaTextOutput.obj txMozillaXMLOutput.obj txMozillaXSLTProcessor.obj  
nsinstall -m 644 txxslt_s.lib %base\dist\lib

cd %base\extensions\transformiix\source\xslt\functions
lib -NOLOGO %ltcg -OUT:"txxsltfunctions_s.lib"  CurrentFunctionCall.obj DocumentFunctionCall.obj ElementAvailableFnCall.obj FunctionAvailableFnCall.obj GenerateIdFunctionCall.obj SystemPropertyFunctionCall.obj txFormatNumberFunctionCall.obj txKeyFunctionCall.obj  
nsinstall -m 644 txxsltfunctions_s.lib %base\dist\lib

cd %base\extensions\transformiix\source\xslt\util
lib -NOLOGO %ltcg -OUT:"txxsltutil_s.lib"  txNodeSorter.obj txXPathResultComparator.obj  
nsinstall -m 644 txxsltutil_s.lib %base\dist\lib

cd %base\extensions\inspector\base\src
lib -NOLOGO %ltcg -OUT:"inspector_s.lib"  inDOMView.obj inDeepTreeWalker.obj inFlasher.obj inSearchLoop.obj inCSSValueSearch.obj inFileSearch.obj inDOMUtils.obj inLayoutUtils.obj  
nsinstall -m 644 inspector_s.lib %base\dist\lib

cd %base\extensions\webservices\security\src
lib -NOLOGO %ltcg -OUT:"websrvcssecurity_s.lib"  nsWebScriptsAccess.obj nsWSAUtils.obj  
nsinstall -m 644 websrvcssecurity_s.lib %base\dist\lib

cd %base\extensions\webservices\schema\src
lib -NOLOGO %ltcg -OUT:"websrvcsschema_s.lib"  nsSchema.obj nsSchemaComponentBase.obj nsSchemaSimpleTypes.obj nsSchemaComplexType.obj nsSchemaParticles.obj nsSchemaAttributes.obj nsSchemaLoader.obj nsSOAPTypes.obj  
nsinstall -m 644 websrvcsschema_s.lib %base\dist\lib

cd %base\extensions\webservices\soap\src
lib -NOLOGO %ltcg -OUT:"websrvcssoap_s.lib"  nsDefaultSOAPEncoder.obj nsHTTPSOAPTransport.obj nsSOAPBlock.obj nsSOAPCall.obj nsSOAPEncoding.obj nsSOAPException.obj nsSOAPFault.obj nsSOAPHeaderBlock.obj nsSOAPMessage.obj nsSOAPParameter.obj nsSOAPPropertyBag.obj nsSOAPResponse.obj nsSOAPUtils.obj  
nsinstall -m 644 websrvcssoap_s.lib %base\dist\lib

cd %base\extensions\webservices\interfaceinfo\src
lib -NOLOGO %ltcg -OUT:"websrvcsinterfaceinfo_s.lib"  nsGenericInterfaceInfoSet.obj nsScriptableInterfaceInfo.obj  
nsinstall -m 644 websrvcsinterfaceinfo_s.lib %base\dist\lib

cd %base\extensions\webservices\wsdl\src
lib -NOLOGO %ltcg -OUT:"websrvcswsdl_s.lib"  nsWSDLLoader.obj nsWSDLDefinitions.obj  
nsinstall -m 644 websrvcswsdl_s.lib %base\dist\lib

cd %base\extensions\webservices\proxy\src
lib -NOLOGO %ltcg -OUT:"websrvcsproxy_s.lib"  wspinfoservice.obj wspproxy.obj wspcallcontext.obj wspfactory.obj wspexception.obj wspcomplextypewrapper.obj wsppropertybagwrapper.obj  
nsinstall -m 644 websrvcsproxy_s.lib %base\dist\lib

cd %base\mailnews\base\src
lib -NOLOGO %ltcg -OUT:"msgbase_s.lib"  nsMessenger.obj nsMessengerBootstrap.obj nsUrlListenerManager.obj nsMsgMailSession.obj nsMsgAccountManager.obj nsMsgAccount.obj nsCopyMessageStreamListener.obj nsMsgRDFDataSource.obj nsMsgFolderDataSource.obj nsMsgAccountManagerDS.obj nsMsgRDFUtils.obj nsMsgBiffManager.obj nsMsgPurgeService.obj nsMsgCopyService.obj nsMsgFolderCache.obj nsMsgFolderCacheElement.obj nsMsgFolderCompactor.obj nsMsgStatusFeedback.obj nsMsgWindow.obj nsMessengerMigrator.obj nsMsgServiceProvider.obj nsSubscribeDataSource.obj nsSubscribableServer.obj nsMsgPrintEngine.obj nsStatusBarBiffManager.obj nsMsgDBView.obj nsMsgThreadedDBView.obj nsMsgSpecialViews.obj nsMsgQuickSearchDBView.obj nsMsgSearchDBView.obj nsMsgXFVirtualFolderDBView.obj nsMsgGroupThread.obj nsMsgGroupView.obj nsMsgOfflineManager.obj nsMsgProgress.obj nsMessengerContentHandler.obj nsSpamSettings.obj nsCidProtocolHandler.obj nsMessengerWinIntegration.obj  
nsinstall -m 644 msgbase_s.lib %base\dist\lib

cd %base\mailnews\base\search\src
lib -NOLOGO %ltcg -OUT:"msgsearch_s.lib"  nsMsgFilterService.obj nsMsgFilterList.obj nsMsgFilter.obj nsMsgSearchTerm.obj nsMsgBodyHandler.obj nsMsgLocalSearch.obj nsMsgSearchValue.obj nsMsgSearchAdapter.obj nsMsgSearchSession.obj nsMsgImapSearch.obj nsMsgSearchNews.obj nsMsgFilterDataSource.obj nsMsgFilterDelegateFactory.obj  
nsinstall -m 644 msgsearch_s.lib %base\dist\lib

cd %base\mailnews\db\msgdb\src
lib -NOLOGO %ltcg -OUT:"msgdb_s.lib"  nsMsgDatabase.obj nsDBFolderInfo.obj nsMsgHdr.obj nsNewsDatabase.obj nsMailDatabase.obj nsImapMailDatabase.obj nsMsgThread.obj nsMsgOfflineImapOperation.obj  
nsinstall -m 644 msgdb_s.lib %base\dist\lib

cd %base\mailnews\news\src
lib -NOLOGO %ltcg -OUT:"msgnews_s.lib"  nsNNTPArticleList.obj nsNNTPNewsgroupList.obj nsNNTPNewsgroupPost.obj nsNNTPProtocol.obj nsNntpUrl.obj nsNntpService.obj nsNewsFolder.obj nsNntpIncomingServer.obj nsNewsUtils.obj nsNewsDownloadDialogArgs.obj nsNewsDownloader.obj  
nsinstall -m 644 msgnews_s.lib %base\dist\lib

cd %base\mailnews\local\src
lib -NOLOGO %ltcg -OUT:"msglocal_s.lib"  nsPop3Protocol.obj nsPop3URL.obj nsPop3Sink.obj nsParseMailbox.obj nsMailboxProtocol.obj nsMailboxUrl.obj nsLocalMailFolder.obj nsMailboxService.obj nsPop3Service.obj nsPop3IncomingServer.obj nsLocalUtils.obj nsLocalUndoTxn.obj nsLocalStringBundle.obj nsNoIncomingServer.obj nsNoneService.obj nsRssIncomingServer.obj nsRssService.obj  
nsinstall -m 644 msglocal_s.lib %base\dist\lib

cd %base\mailnews\mime\src
lib -NOLOGO %ltcg -OUT:"mime_s.lib"  nsMimeObjectClassAccess.obj nsMimeConverter.obj nsSimpleMimeConverterStub.obj mimecont.obj mimeebod.obj mimeenc.obj mimeeobj.obj mimehdrs.obj mimei.obj mimeiimg.obj mimeleaf.obj mimemalt.obj mimemapl.obj mimemdig.obj mimemmix.obj mimempar.obj mimemrel.obj mimemsg.obj mimemsig.obj mimemult.obj mimeobj.obj mimepbuf.obj mimesun.obj mimetenr.obj mimetext.obj mimethtm.obj mimethpl.obj mimethsa.obj mimetpla.obj mimetpfl.obj mimetric.obj mimeunty.obj mimecth.obj mimebuf.obj mimecom.obj mimemoz2.obj comi18n.obj nsMsgHeaderParser.obj nsStreamConverter.obj mimedrft.obj nsMimeHeaders.obj mimecryp.obj mimecms.obj mimemcms.obj  
nsinstall -m 644 mime_s.lib %base\dist\lib

cd %base\mailnews\mime\emitters\src
lib -NOLOGO %ltcg -OUT:"emitterutil_s.lib"  nsMimeBaseEmitter.obj nsEmitterUtils.obj nsMimeRebuffer.obj nsMimeRawEmitter.obj nsMimePlainEmitter.obj nsMimeXmlEmitter.obj nsMimeHtmlEmitter.obj  
nsinstall -m 644 emitterutil_s.lib %base\dist\lib

cd %base\mailnews\mime\cthandlers\glue
lib -NOLOGO %ltcg -OUT:"mimecthglue_s.lib"  mimexpcom.obj nsMimeContentTypeHandler.obj  
nsinstall -m 644 mimecthglue_s.lib %base\dist\lib

cd %base\mailnews\compose\src
lib -NOLOGO %ltcg -OUT:"msgcompose_s.lib"  nsMsgCompFields.obj nsSmtpUrl.obj nsSmtpProtocol.obj nsMsgSend.obj nsMsgSendPart.obj nsMsgSendReport.obj nsSmtpService.obj nsMsgCreate.obj nsMsgCopy.obj nsMsgSendLater.obj nsMsgDeliveryListener.obj nsMsgComposeStringBundle.obj nsMsgEncoders.obj nsMsgCompUtils.obj nsMsgAttachment.obj nsMsgAttachmentHandler.obj nsMsgPrompts.obj nsMsgComposeService.obj nsMsgComposeParams.obj nsMsgComposeProgressParams.obj nsMsgComposeContentHandler.obj nsMsgCompose.obj nsMsgQuote.obj nsMsgRecipientArray.obj nsURLFetcher.obj nsSmtpServer.obj nsSmtpDataSource.obj nsSmtpDelegateFactory.obj  
nsinstall -m 644 msgcompose_s.lib %base\dist\lib

cd %base\mailnews\imap\src
lib -NOLOGO %ltcg -OUT:"msgimap_s.lib"  nsImapUtils.obj nsIMAPBodyShell.obj nsIMAPGenericParser.obj nsIMAPHostSessionList.obj nsIMAPNamespace.obj nsImapIncomingServer.obj nsImapMailFolder.obj nsImapProtocol.obj nsImapSearchResults.obj nsImapServerResponseParser.obj nsImapService.obj nsImapUrl.obj nsImapFlagAndUidState.obj nsImapUndoTxn.obj nsImapStringBundle.obj nsImapOfflineSync.obj  
nsinstall -m 644 msgimap_s.lib %base\dist\lib

cd %base\mailnews\addrbook\src
lib -NOLOGO %ltcg -OUT:"addrbook_s.lib"  nsAddressBook.obj nsAddrBookSession.obj nsAbRDFDataSource.obj nsDirectoryDataSource.obj nsAbCardProperty.obj nsDirPrefs.obj nsAddrDatabase.obj nsAbDirProperty.obj nsAbAutoCompleteSession.obj nsAbAddressCollecter.obj nsAddbookProtocolHandler.obj nsAbMDBDirProperty.obj nsAbMDBDirectory.obj nsAbMDBCardProperty.obj nsAbMDBCard.obj nsAbBSDirectory.obj nsAddbookUrl.obj nsAbDirFactoryService.obj nsAbMDBDirFactory.obj nsAbDirectoryQuery.obj nsAbDirectoryQueryProxy.obj nsAbDirSearchListener.obj nsAbBooleanExpression.obj nsAbDirectoryRDFResource.obj nsAbQueryStringToExpression.obj nsAbView.obj nsVCard.obj nsVCardObj.obj nsMsgVCardService.obj nsAbLDIFService.obj nsAbOutlookCard.obj nsAbOutlookDirFactory.obj nsAbOutlookDirectory.obj nsAbWinHelper.obj nsMapiAddressBook.obj nsWabAddressBook.obj nsAbLDAPDirectory.obj nsAbLDAPDirFactory.obj nsAbLDAPCard.obj nsAbLDAPDirectoryQuery.obj nsAbBoolExprToLDAPFilter.obj nsAbLDAPAutoCompFormatter.obj nsAbLDAPReplicationService.obj nsAbLDAPReplicationQuery.obj nsAbLDAPReplicationData.obj nsAbLDAPChangeLogQuery.obj nsAbLDAPChangeLogData.obj  
nsinstall -m 644 addrbook_s.lib %base\dist\lib

cd %base\mailnews\extensions\mdn\src
lib -NOLOGO %ltcg -OUT:"msgmdn_s.lib"  nsMsgMdnGenerator.obj  
nsinstall -m 644 msgmdn_s.lib %base\dist\lib

cd %base\mailnews\extensions\mailviews\src
lib -NOLOGO %ltcg -OUT:"mailview_s.lib"  nsMsgMailViewList.obj  
nsinstall -m 644 mailview_s.lib %base\dist\lib

cd %base\mailnews\extensions\bayesian-spam-filter\src
lib -NOLOGO %ltcg -OUT:"bayesflt_s.lib"  nsBayesianFilter.obj  
nsinstall -m 644 bayesflt_s.lib %base\dist\lib

cd %base\mailnews\extensions\smime\src
lib -NOLOGO %ltcg -OUT:"msgsmime_s.lib"  nsMsgComposeSecure.obj nsSMimeJSHelper.obj nsEncryptedSMIMEURIsService.obj  
nsinstall -m 644 msgsmime_s.lib %base\dist\lib
endiff

rem ==== lib finish ===

cd %base\nsprpub\pr\src
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -OUT:"nspr4.dll" -MAP -BASE:0x30000000  advapi32.lib wsock32.lib winmm.lib .\prvrsion.obj io\.\prfdcach.obj io\.\prmwait.obj io\.\prmapopt.obj io\.\priometh.obj io\.\pripv6.obj io\.\prlayer.obj io\.\prlog.obj io\.\prmmap.obj io\.\prpolevt.obj io\.\prprf.obj io\.\prscanf.obj io\.\prstdio.obj threads\.\prcmon.obj threads\.\prrwlock.obj threads\.\prtpd.obj linking\.\prlink.obj malloc\.\prmem.obj md\.\prosdep.obj memory\.\prshm.obj memory\.\prshma.obj memory\.\prseg.obj misc\.\pralarm.obj misc\.\pratom.obj misc\.\prcountr.obj misc\.\prdtoa.obj misc\.\prenv.obj misc\.\prerr.obj misc\.\prerror.obj misc\.\prerrortable.obj misc\.\prinit.obj misc\.\prinrval.obj misc\.\pripc.obj misc\.\prlog2.obj misc\.\prlong.obj misc\.\prnetdb.obj misc\.\prolock.obj misc\.\prrng.obj misc\.\prsystem.obj misc\.\prthinfo.obj misc\.\prtpool.obj misc\.\prtrace.obj misc\.\prtime.obj malloc\.\prmalloc.obj io\.\prdir.obj io\.\prfile.obj io\.\prio.obj io\.\prsocket.obj misc\.\pripcsem.obj threads\.\prcthr.obj threads\.\prdump.obj threads\.\prmon.obj threads\.\prsem.obj threads\combined\.\prucpu.obj threads\combined\.\prucv.obj threads\combined\.\prulock.obj threads\combined\.\prustack.obj threads\combined\.\pruthr.obj md\windows\.\ntmisc.obj md\windows\.\ntsec.obj md\windows\.\ntsem.obj md\windows\.\ntinrval.obj md\windows\.\ntgc.obj md\windows\.\w95thred.obj md\windows\.\w95io.obj md\windows\.\w95cv.obj md\windows\.\w95sock.obj md\windows\.\win32_errors.obj md\windows\.\w32ipcsem.obj md\windows\.\w32poll.obj md\windows\.\w32rng.obj md\windows\.\w32shm.obj md\windows\.\w95dllmain.obj  .\nspr.res
mmt nspr4.dll
nsinstall -m 444 .\nspr4.dll .\nspr4.lib %base\dist\lib
nsinstall -m 444 .\nspr4.dll %base\dist\bin

cd %base\nsprpub\lib\ds
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -OUT:"plds4.dll" -MAP -BASE:0x30000000  %base\dist\lib\nspr4.lib  .\plarena.obj .\plhash.obj .\plvrsion.obj  .\plds.res
mmt plds4.dll
nsinstall -m 444 .\plds4.dll .\plds4.lib %base\dist\lib
nsinstall -m 444 .\plds4.dll %base\dist\bin

cd %base\nsprpub\lib\libc\src
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -OUT:"plc4.dll" -MAP -BASE:0x30000000  %base\dist\lib\nspr4.lib  .\plvrsion.obj .\strlen.obj .\strcpy.obj .\strdup.obj .\strcat.obj .\strcmp.obj .\strccmp.obj .\strchr.obj .\strpbrk.obj .\strstr.obj .\strcstr.obj .\strtok.obj .\base64.obj .\plerror.obj .\plgetopt.obj  .\plc.res
mmt plc4.dll
nsinstall -m 444 .\plc4.dll .\plc4.lib %base\dist\lib
nsinstall -m 444 .\plc4.dll %base\dist\bin

cd %base\directory\c-sdk\config
cl  now.obj  -Fenow.exe -link %ltcg
mmt now.exe

cd %base\directory\c-sdk\ldap\build
cl .\dirver.obj   -Fedirver.exe -link %ltcg  
mmt dirver.exe 
nsinstall -R -m 555 dirver.exe %base\dist\bin

cd %base\directory\c-sdk\ldap\libraries\libldap
link %ltcg -OPT:REF -nologo -MAP -DLL -PDB:NONE  -SUBSYSTEM:CONSOLE   wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib rpcrt4.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib %base\dist\lib\nsldif32v50.lib %base\dist\lib\nslber32v50.lib -out:"nsldap32v50.dll" .\abandon.obj .\add.obj .\bind.obj .\cache.obj .\charray.obj .\charset.obj .\compare.obj .\compat.obj .\control.obj .\countvalues.obj .\delete.obj .\disptmpl.obj .\dsparse.obj .\error.obj .\extendop.obj .\free.obj .\freevalues.obj .\friendly.obj .\getattr.obj .\getdn.obj .\getdxbyname.obj .\getentry.obj .\getfilter.obj .\getoption.obj .\getvalues.obj .\memcache.obj .\message.obj .\modify.obj .\open.obj .\os-ip.obj .\proxyauthctrl.obj .\psearch.obj .\referral.obj .\regex.obj .\rename.obj .\request.obj .\reslist.obj .\result.obj .\saslbind.obj .\sbind.obj .\search.obj .\setoption.obj .\sort.obj .\sortctrl.obj .\srchpref.obj .\tmplout.obj .\ufn.obj .\unbind.obj .\unescape.obj .\url.obj .\utf8.obj .\vlistctrl.obj .\dllmain.obj .\mozock.obj  -DEF:d:\mozilla\directory\c-sdk\ldap\libraries\libldap\..\msdos\winsock\nsldap32.def wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib rpcrt4.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib %base\dist\lib\nsldif32v50.lib %base\dist\lib\nslber32v50.lib
mmt nsldap32v50.dll
nsinstall -R -m 444 .\nsldap32v50.lib %base\dist\lib
nsinstall -R -m 444 .\nsldap32v50.dll %base\dist\lib
nsinstall -R -m 444 .\nsldap32v50.dll %base\dist\bin

cd %base\directory\c-sdk\ldap\libraries\libprldap
link %ltcg -OPT:REF -nologo -MAP -DLL -PDB:NONE  -SUBSYSTEM:CONSOLE   wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib rpcrt4.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib %base\dist\lib\nsldap32v50.lib %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib -out:"nsldappr32v50.dll" .\ldappr-dns.obj .\ldappr-error.obj .\ldappr-io.obj .\ldappr-public.obj .\ldappr-threads.obj   -DEF:d:\mozilla\directory\c-sdk\ldap\libraries\libprldap\..\msdos\winsock\nsldappr32.def wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib rpcrt4.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib %base\dist\lib\nsldap32v50.lib %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib
mmt nsldappr32v50.dll
nsinstall -R -m 555 .\nsldappr32v50.lib %base\dist\lib
nsinstall -R -m 555 .\nsldappr32v50.dll %base\dist\lib
nsinstall -R -m 444 .\nsldappr32v50.dll %base\dist\bin

cd %base\modules\zlib\src
link -NOLOGO -DLL -OUT:mozz.dll -PDB:mozz.pdb -SUBSYSTEM:WINDOWS  adler32.obj compress.obj crc32.obj deflate.obj gzio.obj infback.obj inffast.obj inflate.obj inftrees.obj trees.obj uncompr.obj zutil.obj   .\module.res %ltcg  -DEF:d:\mozilla\modules\zlib\src\zlib.def -MAP:mozz.map -MAPINFO:LINES -opt:ref,icf kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt mozz.dll
nsinstall -m 755 mozz.dll ..\..\..\dist\gre
nsinstall -m 755 mozz.lib ..\..\..\dist\lib
nsinstall -m 755 mozz.dll ..\..\..\dist\bin

cd %base\xpcom\typelib\xpt\tools
link -nologo -out:xpt_dump.exe -pdb:xpt_dump.pdb xpt_dump.obj  %ltcg  -opt:ref,icf ..\..\..\..\dist\lib\xpt.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib
mmt xpt_dump.exe
link -nologo -out:xpt_link.exe -pdb:xpt_link.pdb xpt_link.obj  %ltcg  -opt:ref,icf ..\..\..\..\dist\lib\xpt.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib
mmt xpt_link.exe
nsinstall -m 755 xpt_dump.exe xpt_link.exe ..\..\..\..\dist\bin
nsinstall -m 755 xpt_dump.exe xpt_link.exe ..\..\..\..\dist\sdk\bin

cd %base\xpcom\typelib\xpidl
link -NOLOGO -OUT:xpidl.exe -PDB:xpidl.pdb  %ltcg  -opt:ref,icf -SUBSYSTEM:CONSOLE -NODEFAULTLIB:MSVCRTD xpidl.obj xpidl_idl.obj xpidl_util.obj xpidl_header.obj xpidl_typelib.obj xpidl_doc.obj xpidl_java.obj .\module.res ..\..\..\dist\lib\xpt.lib d:\MOZTOOLS\lib\libidl-0.6.lib d:\MOZTOOLS\lib\glib-1.2.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib
mmt xpidl.exe
nsinstall -m 755 xpidl.exe ..\..\..\dist\bin
nsinstall -m 755 xpidl.exe ..\..\..\dist\sdk\bin

cd %base\js\src
link -NOLOGO -DLL -OUT:js3250.dll -PDB:js3250.pdb -SUBSYSTEM:WINDOWS  jsapi.obj jsarena.obj jsarray.obj jsatom.obj jsbool.obj jscntxt.obj jsdate.obj jsdbgapi.obj jsdhash.obj jsdtoa.obj jsemit.obj jsexn.obj jsfun.obj jsgc.obj jshash.obj jsinterp.obj jslock.obj jslog2.obj jslong.obj jsmath.obj jsnum.obj jsobj.obj jsopcode.obj jsparse.obj jsprf.obj jsregexp.obj jsscan.obj jsscope.obj jsscript.obj jsstr.obj jsutil.obj jsxdrapi.obj jsxml.obj prmjtime.obj   js3240.res %ltcg  -opt:ref,icf -OPT:NOICF   fdlibm\fdm.lib  ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt js3250.dll
nsinstall -m 755 js3250.dll ..\..\dist\gre
nsinstall -m 755 js3250.lib ..\..\dist\lib
nsinstall -m 755 js3250.dll ..\..\dist\bin

cd %base\xpcom\build
link -NOLOGO -DLL -OUT:xpcom_core.dll -PDB:xpcom_core.pdb -SUBSYSTEM:WINDOWS  pldhash.obj nsCOMPtr.obj nsComponentManagerUtils.obj nsDebug.obj nsID.obj nsIInterfaceRequestorUtils.obj nsINIParser.obj nsMemory.obj nsTraceRefcnt.obj nsWeakReference.obj nsGREGlue.obj nsVersionComparator.obj nsTHashtable.obj nsGenericFactory.obj nsXPComInit.obj nsStringAPI.obj dlldeps.obj   .\module.res %ltcg  -opt:ref,icf  ..\..\dist\lib\xpcomds_s.lib ..\..\dist\lib\xpcomio_s.lib ..\..\dist\lib\xpcomcomponents_s.lib ..\..\dist\lib\xpcomthreads_s.lib ..\..\dist\lib\xpcomproxy_s.lib ..\..\dist\lib\xpcombase_s.lib ..\..\dist\lib\xptcall.lib ..\..\dist\lib\xptinfo.lib ..\..\dist\lib\xpt.lib ..\..\dist\lib\xptcmd.lib ..\..\dist\lib\string_s.lib    ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  shell32.lib ole32.lib uuid.lib version.lib kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib    
mmt xpcom_core.dll
nsinstall -m 755 xpcom_core.dll ..\..\dist\gre
nsinstall -m 755 xpcom_core.lib ..\..\dist\lib
nsinstall -m 755 xpcom_core.dll ..\..\dist\bin

cd %base\xpcom\stub
link -NOLOGO -DLL -OUT:xpcom.dll -PDB:xpcom.pdb -SUBSYSTEM:WINDOWS  nsXPComStub.obj   .\module.res %ltcg  -opt:ref,icf   ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt xpcom.dll
nsinstall -m 755 xpcom.dll ..\..\dist\gre
nsinstall -m 755 xpcom.lib ..\..\dist\lib
nsinstall -m 755 xpcom.dll ..\..\dist\bin
nsinstall -m 755 xpcom.lib ..\..\dist\sdk\lib

cd %base\xpcom\tools\registry
link -nologo -out:regxpcom.exe -pdb:regxpcom.pdb regxpcom.obj  %ltcg  -opt:ref,icf ..\..\..\dist\lib\xpcomglue.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib
mmt regxpcom.exe
nsinstall -m 755 regxpcom.exe ..\..\..\dist\bin
nsinstall -m 755 regxpcom.exe ..\..\..\dist\sdk\bin

cd %base\xpcom\obsolete
link -NOLOGO -DLL -OUT:xpcom_compat.dll -PDB:xpcom_compat.pdb -SUBSYSTEM:WINDOWS  nsFileSpec.obj nsFileStream.obj nsIFileStream.obj nsFileSpecImpl.obj nsSpecialSystemDirectory.obj dlldeps-obs.obj   .\module.res %ltcg  -opt:ref,icf  ..\..\dist\lib\mozreg_s.lib    ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  shell32.lib ole32.lib kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt xpcom_compat.dll
nsinstall -m 755 xpcom_compat.dll ..\..\dist\gre
nsinstall -m 755 xpcom_compat.lib ..\..\dist\lib
nsinstall -m 755 xpcom_compat.dll ..\..\dist\bin

cd %base\xpcom\obsolete\component
link -NOLOGO -DLL -OUT:xpcom_compat_c.dll -PDB:xpcom_compat_c.pdb -SUBSYSTEM:WINDOWS  nsXPCOMObsolete.obj nsRegistry.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt xpcom_compat_c.dll
nsinstall -m 755 xpcom_compat_c.dll ..\..\..\dist\gre\components
nsinstall -m 755 xpcom_compat_c.dll ..\..\..\dist\bin\components

cd %base\js\src\xpconnect\src
link -NOLOGO -DLL -OUT:xpc3250.dll -PDB:xpc3250.pdb -SUBSYSTEM:WINDOWS  nsScriptError.obj nsXPConnect.obj xpccallcontext.obj xpccomponents.obj xpccontext.obj xpcconvert.obj xpcdebug.obj xpcexception.obj xpcjsid.obj xpcjsruntime.obj xpclog.obj xpcmaps.obj xpcmodule.obj xpcruntimesvc.obj xpcstack.obj xpcstring.obj xpcthreadcontext.obj xpcthrower.obj xpcwrappedjs.obj xpcvariant.obj xpcwrappedjsclass.obj xpcwrappednative.obj xpcwrappednativeinfo.obj xpcwrappednativejsops.obj xpcwrappednativeproto.obj xpcwrappednativescope.obj XPCNativeWrapper.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\jsloader_s.lib   ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt xpc3250.dll
nsinstall -m 755 xpc3250.dll ..\..\..\..\dist\gre\components
nsinstall -m 755 xpc3250.dll ..\..\..\..\dist\bin\components

cd %base\js\src\xpconnect\shell
link -nologo -out:xpcshell.exe -pdb:xpcshell.pdb xpcshell.obj  %ltcg  -opt:ref,icf ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib
mmt xpcshell.exe
nsinstall -m 755 xpcshell.exe ..\..\..\..\dist\bin

cd %base\intl\uconv\src
link -NOLOGO -DLL -OUT:uconv.dll -PDB:uconv.pdb -SUBSYSTEM:WINDOWS  ugen.obj uscan.obj umap.obj nsUConvModule.obj nsCharsetAliasImp.obj nsConverterInputStream.obj nsConverterOutputStream.obj nsTextToSubURI.obj nsGREResProperties.obj nsCharsetConverterManager.obj nsUTF8ConverterService.obj nsScriptableUConv.obj nsUnicodeDecodeHelper.obj nsUnicodeEncodeHelper.obj nsMappingCache.obj nsISO88591ToUnicode.obj nsCP1252ToUnicode.obj nsMacRomanToUnicode.obj nsUTF8ToUnicode.obj nsUnicodeToISO88591.obj nsUnicodeToCP1252.obj nsUnicodeToMacRoman.obj nsUnicodeToUTF8.obj nsWinCharset.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\ucvlatin_s.lib ..\..\..\dist\lib\ucvibm_s.lib ..\..\..\dist\lib\ucvja_s.lib ..\..\..\dist\lib\ucvtw2_s.lib ..\..\..\dist\lib\ucvtw_s.lib ..\..\..\dist\lib\ucvko_s.lib ..\..\..\dist\lib\ucvcn_s.lib   ..\..\..\dist\lib\ucvutil_s.lib ..\..\..\dist\lib\unicharutil_s.lib  ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt uconv.dll
nsinstall -m 755 uconv.dll ..\..\..\dist\gre\components
nsinstall -m 755 uconv.dll ..\..\..\dist\bin\components

cd %base\intl\uconv\ucvmath
link -NOLOGO -DLL -OUT:ucvmath.dll -PDB:ucvmath.pdb -SUBSYSTEM:WINDOWS  nsUnicodeToMathematica1.obj nsUnicodeToMathematica2.obj nsUnicodeToMathematica3.obj nsUnicodeToMathematica4.obj nsUnicodeToMathematica5.obj nsUnicodeToMTExtra.obj nsUCvMathModule.obj nsUnicodeToTeXCMRttf.obj nsUnicodeToTeXCMMIttf.obj nsUnicodeToTeXCMSYttf.obj nsUnicodeToTeXCMEXttf.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\ucvutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt ucvmath.dll
nsinstall -m 755 ucvmath.dll ..\..\..\dist\gre\components
nsinstall -m 755 ucvmath.dll ..\..\..\dist\bin\components

cd %base\intl\build
link -NOLOGO -DLL -OUT:i18n.dll -PDB:i18n.pdb -SUBSYSTEM:WINDOWS  nsI18nModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\chardet_s.lib ..\..\dist\lib\lwbrk_s.lib ..\..\dist\lib\ucharucomp_s.lib ..\..\dist\lib\strres_s.lib ..\..\dist\lib\nslocale_s.lib ..\..\dist\lib\platlocale_s.lib   ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt i18n.dll
nsinstall -m 755 i18n.dll ..\..\dist\gre\components
nsinstall -m 755 i18n.dll ..\..\dist\bin\components

cd %base\intl\compatibility\src
link -NOLOGO -DLL -OUT:intlcmpt.dll -PDB:intlcmpt.pdb -SUBSYSTEM:WINDOWS  nsI18nCompatibility.obj nsCSIDtoCharsetName.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt intlcmpt.dll
nsinstall -m 755 intlcmpt.dll ..\..\..\dist\bin\components

cd %base\netwerk\build
link -NOLOGO -DLL -OUT:necko.dll -PDB:necko.pdb -SUBSYSTEM:WINDOWS  nsNetModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\neckobase_s.lib ..\..\dist\lib\neckodns_s.lib ..\..\dist\lib\neckosocket_s.lib ..\..\dist\lib\nkconv_s.lib ..\..\dist\lib\nkcnvts_s.lib ..\..\dist\lib\nkmime_s.lib ..\..\dist\lib\nkcache_s.lib ..\..\dist\lib\nkabout_s.lib  ..\..\dist\lib\nkfile_s.lib  ..\..\dist\lib\nkftp_s.lib  ..\..\dist\lib\nkhttp_s.lib  ..\..\dist\lib\nkres_s.lib  ..\..\dist\lib\neckocookie_s.lib     ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  ..\..\dist\lib\mozz.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib ole32.lib shell32.lib   
mmt necko.dll
nsinstall -m 755 necko.dll ..\..\dist\gre\components
nsinstall -m 755 necko.dll ..\..\dist\bin\components

cd %base\netwerk\build2
link -NOLOGO -DLL -OUT:necko2.dll -PDB:necko2.pdb -SUBSYSTEM:WINDOWS  nsNetModule2.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import   ..\..\dist\lib\nkdata_s.lib  ..\..\dist\lib\nkgopher_s.lib  ..\..\dist\lib\nkkeyword_s.lib  ..\..\dist\lib\nkviewsource_s.lib   ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt necko2.dll
nsinstall -m 755 necko2.dll ..\..\dist\gre\components
nsinstall -m 755 necko2.dll ..\..\dist\bin\components

cd %base\modules\libjar
link -NOLOGO -DLL -OUT:jar50.dll -PDB:jar50.pdb -SUBSYSTEM:WINDOWS  nsZipArchive.obj nsWildCard.obj nsJARInputStream.obj nsJAR.obj nsJARFactory.obj nsXPTZipLoader.obj nsJARProtocolHandler.obj nsJARChannel.obj nsJARURI.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import   ..\..\dist\lib\mozz.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt jar50.dll
nsinstall -m 755 jar50.dll ..\..\dist\gre\components
nsinstall -m 755 jar50.dll ..\..\dist\bin\components

cd %base\modules\libpref\src
link -NOLOGO -DLL -OUT:xppref32.dll -PDB:xppref32.pdb -SUBSYSTEM:WINDOWS  nsPref.obj nsPrefBranch.obj nsPrefService.obj nsPrefsFactory.obj prefapi.obj prefread.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\js3250.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt xppref32.dll
nsinstall -m 755 xppref32.dll ..\..\..\dist\gre\components
nsinstall -m 755 xppref32.dll ..\..\..\dist\bin\components

cd %base\caps\src
link -NOLOGO -DLL -OUT:caps.dll -PDB:caps.pdb -SUBSYSTEM:WINDOWS  nsPrincipal.obj nsSystemPrincipal.obj nsJSPrincipals.obj nsScriptSecurityManager.obj nsSecurityManagerFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\mozz.lib ..\..\dist\lib\js3250.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt caps.dll
nsinstall -m 755 caps.dll ..\..\dist\gre\components
nsinstall -m 755 caps.dll ..\..\dist\bin\components

cd %base\rdf\build
link -NOLOGO -DLL -OUT:rdf.dll -PDB:rdf.pdb -SUBSYSTEM:WINDOWS  nsRDFModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\rdfbase_s.lib ..\..\dist\lib\rdfdatasource_s.lib ..\..\dist\lib\rdfutil_s.lib     ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt rdf.dll
nsinstall -m 755 rdf.dll ..\..\dist\gre\components
nsinstall -m 755 rdf.dll ..\..\dist\bin\components

cd %base\parser\htmlparser\src
link -NOLOGO -DLL -OUT:gkparser.dll -PDB:gkparser.pdb -SUBSYSTEM:WINDOWS  nsScannerString.obj nsDTDUtils.obj nsHTMLTokenizer.obj nsElementTable.obj nsExpatDriver.obj CNavDTD.obj COtherDTD.obj nsHTMLEntities.obj nsHTMLTags.obj nsHTMLTokens.obj nsParser.obj CParserContext.obj nsParserService.obj nsParserModule.obj nsParserNode.obj nsScanner.obj nsToken.obj nsParserMsgUtils.obj nsViewSourceHTML.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\expat_s.lib     ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt gkparser.dll
nsinstall -m 755 gkparser.dll ..\..\..\dist\gre\components
nsinstall -m 755 gkparser.dll ..\..\..\dist\bin\components

cd %base\gfx\src
link -NOLOGO -DLL -OUT:gkgfx.dll -PDB:gkgfx.pdb -SUBSYSTEM:WINDOWS  nsBlender.obj nsColor.obj nsColorNames.obj nsDeviceContext.obj nsFont.obj nsFontList.obj nsRect.obj nsRegion.obj nsTransform2D.obj nsScriptableRegion.obj nsPrintOptionsImpl.obj nsPrintSettingsImpl.obj nsPrintSession.obj imgScaler.obj   .\module.res %ltcg  -opt:ref,icf ..\..\dist\lib\mozutil_s.lib ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt gkgfx.dll
nsinstall -m 755 gkgfx.dll ..\..\dist\gre
nsinstall -m 755 gkgfx.lib ..\..\dist\lib
nsinstall -m 755 gkgfx.dll ..\..\dist\bin

cd %base\gfx\src\windows
link -NOLOGO -DLL -OUT:gkgfxwin.dll -PDB:gkgfxwin.pdb -SUBSYSTEM:WINDOWS  nsDeviceContextWin.obj nsDrawingSurfaceWin.obj nsRenderingContextWin.obj nsFontMetricsWin.obj nsImageWin.obj nsRegionWin.obj nsDeviceContextSpecWin.obj nsDeviceContextSpecFactoryW.obj nsScreenWin.obj nsScreenManagerWin.obj nsGfxFactoryWin.obj nsNativeThemeWin.obj nsUnicodeRange.obj nsPrintOptionsWin.obj nsPrintSettingsWin.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\mozutil_s.lib ..\..\..\dist\lib\gfxshared_s.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib winspool.lib comdlg32.lib   
mmt gkgfxwin.dll
nsinstall -m 755 gkgfxwin.dll ..\..\..\dist\gre\components
nsinstall -m 755 gkgfxwin.dll ..\..\..\dist\bin\components

cd %base\modules\libpr0n\decoders\icon
link -NOLOGO -DLL -OUT:imgicon.dll -PDB:imgicon.pdb -SUBSYSTEM:WINDOWS  nsIconURI.obj nsIconModule.obj nsIconProtocolHandler.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\imgiconwin_s.lib  ..\..\..\..\dist\lib\gkgfx.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib shell32.lib gdi32.lib comctl32.lib   
mmt imgicon.dll
nsinstall -m 755 imgicon.dll ..\..\..\..\dist\gre\components
nsinstall -m 755 imgicon.dll ..\..\..\..\dist\bin\components

cd %base\modules\libpr0n\build
link -NOLOGO -DLL -OUT:imglib2.dll -PDB:imglib2.pdb -SUBSYSTEM:WINDOWS  nsImageModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\src\imglib2_s.lib  ..\decoders\png\imgpng_s.lib  ..\decoders\gif\imggif_s.lib  ..\decoders\jpeg\imgjpeg_s.lib  ..\decoders\bmp\imgbmp_s.lib  ..\decoders\xbm\imgxbm_s.lib    ..\..\..\dist\lib\jpeg3250.lib ..\..\..\dist\lib\png.lib ..\..\..\dist\lib\mozz.lib ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt imglib2.dll
nsinstall -m 755 imglib2.dll ..\..\..\dist\gre\components
nsinstall -m 755 imglib2.dll ..\..\..\dist\bin\components

cd %base\modules\plugin\base\src
link -NOLOGO -DLL -OUT:gkplugin.dll -PDB:gkplugin.pdb -SUBSYSTEM:WINDOWS  ns4xPlugin.obj ns4xPluginInstance.obj nsPluginHostImpl.obj nsPluginModule.obj nsPluginInstancePeer.obj nsPluginDirServiceProvider.obj nsJSNPRuntime.obj nsPluginsDirWin.obj nsPluginNativeWindowWin.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\gkgfx.lib  ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib version.lib   
mmt gkplugin.dll
nsinstall -m 755 gkplugin.dll ..\..\..\..\dist\gre\components
nsinstall -m 755 gkplugin.dll ..\..\..\..\dist\bin\components

cd %base\modules\plugin\samples\default\windows
link -NOLOGO -DLL -OUT:npnul32.dll -PDB:npnul32.pdb -SUBSYSTEM:WINDOWS  maindll.obj plugin.obj dbg.obj dialogs.obj npshell.obj npwin.obj utils.obj   npnul32.res %ltcg  -DEF:d:\mozilla\modules\plugin\samples\default\windows\npnul32.def -opt:ref,icf  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib version.lib   
mmt npnul32.dll
nsinstall npnul32.dll ..\..\..\..\..\dist\bin\plugins

cd %base\widget\src\build
link -NOLOGO -DLL -OUT:gkwidget.dll -PDB:gkwidget.pdb -SUBSYSTEM:WINDOWS  nsWinWidgetFactory.obj   widget.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\widget_windows.lib ..\..\..\dist\lib\xpwidgets_s.lib    ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib uuid.lib ole32.lib oleaut32.lib comctl32.lib comdlg32.lib shell32.lib gdi32.lib imm32.lib urlmon.lib   
mmt gkwidget.dll
nsinstall -m 755 gkwidget.dll ..\..\..\dist\bin\components

cd %base\layout\build
link -NOLOGO -DLL -OUT:gklayout.dll -PDB:gklayout.pdb -SUBSYSTEM:WINDOWS  nsLayoutModule.obj nsContentHTTPStartup.obj nsContentDLF.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\gkbase_s.lib ..\..\dist\lib\gkgeneric_s.lib ..\..\dist\lib\gkforms_s.lib ..\..\dist\lib\gkstyle_s.lib ..\..\dist\lib\gkprinting_s.lib ..\..\dist\lib\gktable_s.lib ..\..\dist\lib\gkxulbase_s.lib ..\..\dist\lib\gkconbase_s.lib ..\..\dist\lib\gkconcvs_s.lib ..\..\dist\lib\gkconevents_s.lib ..\..\dist\lib\gkconhtmlcon_s.lib ..\..\dist\lib\gkconhtmldoc_s.lib ..\..\dist\lib\gkconxmlcon_s.lib ..\..\dist\lib\gkconxmldoc_s.lib ..\..\dist\lib\gkconxbl_s.lib ..\..\dist\lib\gkconxulcon_s.lib ..\..\dist\lib\gkconxuldoc_s.lib ..\..\dist\lib\gkview_s.lib ..\..\dist\lib\jsdombase_s.lib ..\..\dist\lib\jsdomevents_s.lib ..\..\dist\lib\jsurl_s.lib  ..\..\dist\lib\gkxultree_s.lib ..\..\dist\lib\gkxulgrid_s.lib ..\..\dist\lib\gkconxultmpl_s.lib  ..\..\dist\lib\gkmathmlcon_s.lib ..\..\dist\lib\gkmathmlbase_s.lib  ..\..\dist\lib\gkcontentxtf_s.lib ..\..\dist\lib\gkxtfbase_s.lib  ..\..\dist\lib\gksvgbase_s.lib ..\..\dist\lib\gkconsvgdoc_s.lib ..\..\dist\lib\gkcontentsvg_s.lib  ..\..\dist\lib\gksvgrenderercairo_s.lib    ..\..\dist\lib\gkgfx.lib ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  ..\..\dist\lib\js3250.lib  ..\..\dist\lib\mozcairo.lib ..\..\dist\lib\mozlibpixman.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt gklayout.dll
nsinstall -m 755 gklayout.dll ..\..\dist\gre\components
nsinstall -m 755 gklayout.dll ..\..\dist\bin\components

cd %base\docshell\build
link -NOLOGO -DLL -OUT:docshell.dll -PDB:docshell.pdb -SUBSYSTEM:WINDOWS  nsDocShellModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\basedocshell_s.lib ..\..\dist\lib\uriloaderbase_s.lib ..\..\dist\lib\exthandler_s.lib ..\..\dist\lib\prefetch_s.lib ..\..\dist\lib\shistory_s.lib    ..\..\dist\lib\gkgfx.lib ..\..\dist\lib\js3250.lib ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib shell32.lib   
mmt docshell.dll
nsinstall -m 755 docshell.dll ..\..\dist\gre\components
nsinstall -m 755 docshell.dll ..\..\dist\bin\components

cd %base\embedding\components\build
link -NOLOGO -DLL -OUT:embedcomponents.dll -PDB:embedcomponents.pdb -SUBSYSTEM:WINDOWS  nsEmbeddingModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\windowwatcher_s.lib ..\..\..\dist\lib\appstartupnotifier_s.lib ..\..\..\dist\lib\find_s.lib ..\..\..\dist\lib\webbrowserpersist_s.lib ..\..\..\dist\lib\commandhandler_s.lib  ..\..\..\dist\lib\jsconsole_s.lib  ..\..\..\dist\lib\printingui_s.lib    ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib winspool.lib comdlg32.lib   
mmt embedcomponents.dll
nsinstall -m 755 embedcomponents.dll ..\..\..\dist\gre\components
nsinstall -m 755 embedcomponents.dll ..\..\..\dist\bin\components

cd %base\embedding\browser\build
link -NOLOGO -DLL -OUT:webbrwsr.dll -PDB:webbrwsr.pdb -SUBSYSTEM:WINDOWS  nsWebBrowserModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\nsWebBrowser_s.lib    ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt webbrwsr.dll
nsinstall -m 755 webbrwsr.dll ..\..\..\dist\gre\components
nsinstall -m 755 webbrwsr.dll ..\..\..\dist\bin\components

cd %base\embedding\lite
link -NOLOGO -DLL -OUT:embed_lite.dll -PDB:embed_lite.pdb -SUBSYSTEM:WINDOWS  nsEmbedGlobalHistory.obj nsEmbedLiteModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt embed_lite.dll

cd %base\editor\libeditor\build
link -NOLOGO -DLL -OUT:editor.dll -PDB:editor.pdb -SUBSYSTEM:WINDOWS  nsEditorRegistration.obj   .\module.res   -opt:ref,icf %LTCG -IMPLIB:fake-import  ..\html\htmleditor_s.lib ..\..\txtsvc\src\txtsvc_s.lib  ..\text\texteditor_s.lib ..\base\editorbase_s.lib    ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
nsinstall -m 755 editor.dll ..\..\..\dist\gre\components
nsinstall -m 755 editor.dll ..\..\..\dist\bin\components

cd %base\editor\txmgr\src
link -NOLOGO -DLL -OUT:txmgr.dll -PDB:txmgr.pdb -SUBSYSTEM:WINDOWS  nsTransactionItem.obj nsTransactionList.obj nsTransactionManager.obj nsTransactionManagerFactory.obj nsTransactionStack.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt txmgr.dll
nsinstall -m 755 txmgr.dll ..\..\..\dist\bin\components

cd %base\editor\composer\src
link -NOLOGO -DLL -OUT:composer.dll -PDB:composer.pdb -SUBSYSTEM:WINDOWS  nsComposeTxtSrvFilter.obj nsComposerController.obj nsComposerCommands.obj nsComposerDocumentCommands.obj nsComposerRegistration.obj nsEditingSession.obj nsComposerCommandsUpdater.obj nsEditorSpellCheck.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt composer.dll
nsinstall -m 755 composer.dll ..\..\..\dist\bin\components

cd %base\xpfe\appshell\src
link -NOLOGO -DLL -OUT:appshell.dll -PDB:appshell.pdb -SUBSYSTEM:WINDOWS  nsChromeTreeOwner.obj nsContentTreeOwner.obj nsXULWindow.obj nsAppShellService.obj nsAppShellWindowEnumerator.obj nsWebShellWindow.obj nsWindowMediator.obj nsAbout.obj nsAppShellFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt appshell.dll
nsinstall -m 755 appshell.dll ..\..\..\dist\gre\components
nsinstall -m 755 appshell.dll ..\..\..\dist\bin\components

cd %base\js\src\liveconnect
link -NOLOGO -DLL -OUT:jsj3250.dll -PDB:jsj3250.pdb -SUBSYSTEM:WINDOWS  jsj.obj jsj_JSObject.obj jsj_JavaArray.obj jsj_JavaClass.obj jsj_JavaMember.obj jsj_JavaObject.obj jsj_JavaPackage.obj jsj_array.obj jsj_class.obj jsj_convert.obj jsj_field.obj jsj_hash.obj jsj_method.obj jsj_utils.obj nsCLiveconnect.obj nsCLiveconnectFactory.obj   .\module.res %ltcg  -MAP:jsj3250.map -MAPINFO:LINES -opt:ref,icf  ..\..\..\dist\lib\js3250.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt jsj3250.dll
nsinstall -m 755 jsj3250.dll ..\..\..\dist\gre
nsinstall -m 755 jsj3250.lib ..\..\..\dist\lib
nsinstall -m 755 jsj3250.dll ..\..\..\dist\bin

cd %base\modules\oji\src
link -NOLOGO -DLL -OUT:oji.dll -PDB:oji.pdb -SUBSYSTEM:WINDOWS  jvmmgr.obj scd.obj nsJVMManager.obj nsJVMPluginTagInfo.obj ProxyJNI.obj nsCNullSecurityContext.obj ProxyClassLoader.obj nsCSecurityContext.obj nsCJVMManagerFactory.obj nsJVMConfigManager.obj lcglue.obj nsJVMAuthTools.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\jsj3250.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt oji.dll
nsinstall -m 755 oji.dll ..\..\..\dist\gre\components
nsinstall -m 755 oji.dll ..\..\..\dist\bin\components

cd %base\accessible\public\msaa
link -NOLOGO -DLL -OUT:AccessibleMarshal.dll -PDB:AccessibleMarshal.pdb -SUBSYSTEM:WINDOWS  AccessibleMarshal.obj ISimpleDOMNode_p.obj ISimpleDOMNode_i.obj ISimpleDOMDocument_p.obj ISimpleDOMDocument_i.obj ISimpleDOMText_p.obj ISimpleDOMText_i.obj   .\module.res %ltcg  -DEF:d:\mozilla\accessible\public\msaa\AccessibleMarshal.def -opt:ref,icf  kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib    
mmt AccessibleMarshal.dll
nsinstall -m 755 AccessibleMarshal.dll ..\..\..\dist\gre
nsinstall -m 755 AccessibleMarshal.lib ..\..\..\dist\lib
nsinstall -m 755 AccessibleMarshal.dll ..\..\..\dist\bin

cd %base\accessible\build
link -NOLOGO -DLL -OUT:accessibility.dll -PDB:accessibility.pdb -SUBSYSTEM:WINDOWS  nsAccessibilityFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\accessibility_base_s.lib ..\..\dist\lib\accessibility_html_s.lib ..\..\dist\lib\accessibility_toolkit_s.lib  ..\..\dist\lib\accessibility_xul_s.lib   ..\..\dist\lib\gkgfx.lib ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt accessibility.dll
nsinstall -m 755 accessibility.dll ..\..\dist\gre\components
nsinstall -m 755 accessibility.dll ..\..\dist\bin\components

cd %base\rdf\chrome\build
link -NOLOGO -DLL -OUT:chrome.dll -PDB:chrome.pdb -SUBSYSTEM:WINDOWS  nsChromeFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\chrome_s.lib  ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt chrome.dll
nsinstall -m 755 chrome.dll ..\..\..\dist\gre\components
nsinstall -m 755 chrome.dll ..\..\..\dist\bin\components

cd %base\rdf\chrome\tools\chromereg
link -nologo -out:regchrome.exe -pdb:regchrome.pdb regchrome.obj  %ltcg  -opt:ref,icf  ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib
mmt regchrome.exe
nsinstall -m 755 regchrome.exe ..\..\..\..\dist\bin

cd %base\profile\build
link -NOLOGO -DLL -OUT:profile.dll -PDB:profile.pdb -SUBSYSTEM:WINDOWS  nsProfileFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\dist\lib\profile_s.lib ..\..\dist\lib\profdirserviceprovider_s.lib    ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\xpcom_compat.lib ..\..\dist\lib\js3250.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt profile.dll
nsinstall -m 755 profile.dll ..\..\dist\bin\components

cd %base\profile\pref-migrator\src
link -NOLOGO -DLL -OUT:nsprefm.dll -PDB:nsprefm.pdb -SUBSYSTEM:WINDOWS  nsPrefMigration.obj nsPrefMigrationFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt nsprefm.dll
nsinstall -m 755 nsprefm.dll ..\..\..\dist\bin\components

cd %base\db\mork\build
link -NOLOGO -DLL -OUT:mork.dll -PDB:mork.pdb -SUBSYSTEM:WINDOWS  nsMorkFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\msgmork_s.lib   ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt mork.dll
nsinstall -m 755 mork.dll ..\..\..\dist\bin\components

cd %base\xpfe\components\find\src
link -NOLOGO -DLL -OUT:mozfind.dll -PDB:mozfind.pdb -SUBSYSTEM:WINDOWS  nsFindService.obj nsFindModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt mozfind.dll
nsinstall -m 755 mozfind.dll ..\..\..\..\dist\bin\components

cd %base\xpfe\components\build
link -NOLOGO -DLL -OUT:appcomps.dll -PDB:appcomps.pdb -SUBSYSTEM:WINDOWS  nsModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\directory_s.lib  ..\..\..\dist\lib\appcompintl_s.lib ..\..\..\dist\lib\windowds_s.lib ..\..\..\dist\lib\mozbrwsr_s.lib  ..\..\..\dist\lib\autocomplete_s.lib  ..\..\..\dist\lib\bookmarks_s.lib ..\..\..\dist\lib\downloadmanager_s.lib ..\..\..\dist\lib\history_s.lib ..\..\..\dist\lib\related_s.lib ..\startup\src\appstartup_s.lib  ..\..\..\dist\lib\alerts_s.lib  ..\..\..\dist\lib\urlwidgt_s.lib ..\..\..\dist\lib\winhooks_s.lib   ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib   ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib ole32.lib shell32.lib   
mmt appcomps.dll
nsinstall -m 755 appcomps.dll ..\..\..\dist\bin\components

cd %base\xpinstall\src
link -NOLOGO -DLL -OUT:xpinstal.dll -PDB:xpinstal.pdb -SUBSYSTEM:WINDOWS  CertReader.obj nsInstall.obj nsInstallTrigger.obj nsInstallVersion.obj nsInstallFolder.obj nsJSInstall.obj nsJSFile.obj nsJSInstallTriggerGlobal.obj nsJSInstallVersion.obj nsSoftwareUpdate.obj nsSoftwareUpdateRun.obj nsInstallFile.obj nsInstallExecute.obj nsInstallPatch.obj nsInstallUninstall.obj nsInstallResources.obj nsRegisterItem.obj nsTopProgressNotifier.obj nsLoggingProgressNotifier.obj ScheduledTasks.obj nsXPIProxy.obj nsXPITriggerInfo.obj nsXPInstallManager.obj nsInstallFileOpItem.obj nsJSFileSpecObj.obj nsInstallLogComment.obj nsInstallBitwise.obj nsWinReg.obj nsJSWinReg.obj nsWinRegItem.obj nsWinProfile.obj nsJSWinProfile.obj nsWinProfileItem.obj nsWinShortcut.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import   ..\..\dist\lib\js3250.lib ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  ..\..\dist\lib\unicharutil_s.lib ..\..\dist\lib\mozz.lib ..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib ole32.lib version.lib uuid.lib   
mmt xpinstal.dll
nsinstall -m 755 xpinstal.dll ..\..\dist\gre\components
nsinstall -m 755 xpinstal.dll ..\..\dist\bin\components

cd %base\xpinstall\cleanup
link -NOLOGO -OUT:xpicleanup.exe -PDB:xpicleanup.pdb -SUBSYSTEM:WINDOWS %ltcg  -opt:ref,icf InstallCleanup.obj InstallCleanupWin.obj .\module.res ..\..\dist\lib\mozregsa_s.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib
rem this one have no .manifest file 
rem mmt xpicleanup.exe
nsinstall -m 755 xpicleanup.exe ..\..\dist\gre
nsinstall -m 755 xpicleanup.exe ..\..\dist\bin

cd %base\xpinstall\stub
link -NOLOGO -DLL -OUT:xpistub.dll -PDB:xpistub.pdb -SUBSYSTEM:WINDOWS  nsStubNotifier.obj xpistub.obj   .\module.res %ltcg  -opt:ref,icf ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt xpistub.dll
nsinstall -m 755 xpistub.lib ..\..\dist\lib
nsinstall -m 755 xpistub.dll ..\..\dist\bin

cd %base\js\jsd
link -NOLOGO -DLL -OUT:jsd3250.dll -PDB:jsd3250.pdb -SUBSYSTEM:WINDOWS  jsdebug.obj jsd_atom.obj jsd_high.obj jsd_hook.obj jsd_lock.obj jsd_obj.obj jsd_scpt.obj jsd_stak.obj jsd_step.obj jsd_text.obj jsd_val.obj jsd_xpc.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib  ..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt jsd3250.dll
nsinstall -m 755 jsd3250.dll ..\..\dist\bin\components

cd %base\..\security\nss\lib\softoken
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\softokn\softokn3.dll" -DEF:%base\nss\softokn\softokn.def -MAP  %base\nss\softokn\alghmac.obj %base\nss\softokn\dbinit.obj %base\nss\softokn\dbmshim.obj %base\nss\softokn\ecdecode.obj %base\nss\softokn\fipstest.obj %base\nss\softokn\fipstokn.obj %base\nss\softokn\keydb.obj %base\nss\softokn\lowcert.obj %base\nss\softokn\lowkey.obj %base\nss\softokn\lowpbe.obj %base\nss\softokn\padbuf.obj %base\nss\softokn\pcertdb.obj %base\nss\softokn\pk11db.obj %base\nss\softokn\pkcs11.obj %base\nss\softokn\pkcs11c.obj %base\nss\softokn\pkcs11u.obj %base\nss\softokn\rawhash.obj %base\nss\softokn\rsawrapr.obj %base\nss\softokn\softkver.obj %base\nss\softokn\tlsprf.obj  %base\dist\lib\freebl.lib %base\dist\lib\secutil.lib %base\dist\lib\dbm.lib  %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib    %base\nss\softokn\softokn.res
mmt %base\nss\softokn\softokn3.dll
nsinstall -m 775 %base\nss\softokn\softokn3.dll %base\dist\lib
nsinstall -m 775 %base\nss\softokn\softokn3.lib %base\dist\lib

cd %base\..\security\nss\lib\nss
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\nss\nss3.dll" -DEF:%base\nss\nss\nss.def -EXPORT:mktemp=nss_mktemp,PRIVATE -MAP  %base\nss\nss\nssinit.obj %base\nss\nss\nssver.obj %base\nss\certhi\certhtml.obj %base\nss\certhi\certreq.obj %base\nss\certhi\crlv2.obj %base\nss\certhi\ocsp.obj %base\nss\certhi\certhigh.obj %base\nss\certhi\certvfy.obj %base\nss\certhi\xcrldist.obj %base\nss\cryptohi\sechash.obj %base\nss\cryptohi\seckey.obj %base\nss\cryptohi\secsign.obj %base\nss\cryptohi\secvfy.obj %base\nss\cryptohi\dsautil.obj %base\nss\pk11wrap\dev3hack.obj %base\nss\pk11wrap\pk11akey.obj %base\nss\pk11wrap\pk11auth.obj %base\nss\pk11wrap\pk11cert.obj %base\nss\pk11wrap\pk11cxt.obj %base\nss\pk11wrap\pk11err.obj %base\nss\pk11wrap\pk11kea.obj %base\nss\pk11wrap\pk11list.obj %base\nss\pk11wrap\pk11load.obj %base\nss\pk11wrap\pk11mech.obj %base\nss\pk11wrap\pk11nobj.obj %base\nss\pk11wrap\pk11obj.obj %base\nss\pk11wrap\pk11pars.obj %base\nss\pk11wrap\pk11pbe.obj %base\nss\pk11wrap\pk11pk12.obj %base\nss\pk11wrap\pk11pqg.obj %base\nss\pk11wrap\pk11sdr.obj %base\nss\pk11wrap\pk11skey.obj %base\nss\pk11wrap\pk11slot.obj %base\nss\pk11wrap\pk11util.obj %base\nss\certdb\alg1485.obj %base\nss\certdb\certdb.obj %base\nss\certdb\certv3.obj %base\nss\certdb\certxutl.obj %base\nss\certdb\crl.obj %base\nss\certdb\genname.obj %base\nss\certdb\stanpcertdb.obj %base\nss\certdb\polcyxtn.obj %base\nss\certdb\secname.obj %base\nss\certdb\xauthkid.obj %base\nss\certdb\xbsconst.obj %base\nss\certdb\xconst.obj %base\nss\secutil\quickder.obj %base\nss\secutil\secdig.obj %base\nss\secutil\derdec.obj %base\nss\secutil\derenc.obj %base\nss\secutil\dersubr.obj %base\nss\secutil\dertime.obj %base\nss\secutil\nssb64d.obj %base\nss\secutil\nssb64e.obj %base\nss\secutil\nssrwlk.obj %base\nss\secutil\nssilock.obj %base\nss\secutil\nsslocks.obj %base\nss\secutil\portreg.obj %base\nss\secutil\pqgutil.obj %base\nss\secutil\secalgid.obj %base\nss\secutil\secasn1d.obj %base\nss\secutil\secasn1e.obj %base\nss\secutil\secasn1u.obj %base\nss\secutil\secitem.obj %base\nss\secutil\secoid.obj %base\nss\secutil\sectime.obj %base\nss\secutil\secport.obj %base\nss\secutil\secinit.obj %base\nss\secutil\utf8.obj %base\nss\nsspki\asymmkey.obj %base\nss\nsspki\certificate.obj %base\nss\nsspki\cryptocontext.obj %base\nss\nsspki\symmkey.obj %base\nss\nsspki\trustdomain.obj %base\nss\nsspki\tdcache.obj %base\nss\nsspki\certdecode.obj %base\nss\nsspki\pkistore.obj %base\nss\nsspki\pkibase.obj %base\nss\nsspki\pki3hack.obj %base\nss\nssdev\devmod.obj %base\nss\nssdev\devslot.obj %base\nss\nssdev\devtoken.obj %base\nss\nssdev\devutil.obj %base\nss\nssdev\ckhelper.obj %base\nss\nssb\arena.obj %base\nss\nssb\error.obj %base\nss\nssb\errorval.obj %base\nss\nssb\hashops.obj %base\nss\nssb\libc.obj %base\nss\nssb\tracker.obj %base\nss\nssb\item.obj %base\nss\nssb\utf8.obj %base\nss\nssb\list.obj %base\nss\nssb\hash.obj %base\nss\nssb\whatnspr.obj  %base\dist\lib\softokn3.lib %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib    %base\nss\nss\nss.res
mmt %base\nss\nss\nss3.dll
nsinstall -m 775 %base\nss\nss\nss3.dll %base\dist\lib
nsinstall -m 775 %base\nss\nss\nss3.lib %base\dist\lib

cd %base\..\security\nss\lib\ssl
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\ssl\ssl3.dll" -DEF:%base\nss\ssl\ssl.def -MAP  %base\nss\ssl\emulate.obj %base\nss\ssl\prelib.obj %base\nss\ssl\ssl3con.obj %base\nss\ssl\ssl3gthr.obj %base\nss\ssl\sslauth.obj %base\nss\ssl\sslcon.obj %base\nss\ssl\ssldef.obj %base\nss\ssl\sslenum.obj %base\nss\ssl\sslerr.obj %base\nss\ssl\sslgathr.obj %base\nss\ssl\sslmutex.obj %base\nss\ssl\sslnonce.obj %base\nss\ssl\sslreveal.obj %base\nss\ssl\sslsecur.obj %base\nss\ssl\sslsnce.obj %base\nss\ssl\sslsock.obj %base\nss\ssl\ssltrace.obj %base\nss\ssl\sslver.obj %base\nss\ssl\authcert.obj %base\nss\ssl\cmpcert.obj %base\nss\ssl\nsskea.obj %base\nss\ssl\sslinfo.obj %base\nss\ssl\win32err.obj   %base\dist\lib\nss3.lib %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib    %base\nss\ssl\ssl.res
mmt %base\nss\ssl\ssl3.dll
nsinstall -m 775 %base\nss\ssl\ssl3.dll %base\dist\lib
nsinstall -m 775 %base\nss\ssl\ssl3.lib %base\dist\lib

cd %base\..\security\nss\lib\smime
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\smime\smime3.dll" -DEF:%base\nss\smime\smime.def -MAP  %base\nss\smime\cmsarray.obj %base\nss\smime\cmsasn1.obj %base\nss\smime\cmsattr.obj %base\nss\smime\cmscinfo.obj %base\nss\smime\cmscipher.obj %base\nss\smime\cmsdecode.obj %base\nss\smime\cmsdigdata.obj %base\nss\smime\cmsdigest.obj %base\nss\smime\cmsencdata.obj %base\nss\smime\cmsencode.obj %base\nss\smime\cmsenvdata.obj %base\nss\smime\cmsmessage.obj %base\nss\smime\cmspubkey.obj %base\nss\smime\cmsrecinfo.obj %base\nss\smime\cmsreclist.obj %base\nss\smime\cmssigdata.obj %base\nss\smime\cmssiginfo.obj %base\nss\smime\cmsutil.obj %base\nss\smime\smimemessage.obj %base\nss\smime\smimeutil.obj %base\nss\smime\smimever.obj %base\nss\pkcs12\p12local.obj %base\nss\pkcs12\p12creat.obj %base\nss\pkcs12\p12dec.obj %base\nss\pkcs12\p12plcy.obj %base\nss\pkcs12\p12tmpl.obj %base\nss\pkcs12\p12e.obj %base\nss\pkcs12\p12d.obj %base\nss\pkcs7\certread.obj %base\nss\pkcs7\p7common.obj %base\nss\pkcs7\p7create.obj %base\nss\pkcs7\p7decode.obj %base\nss\pkcs7\p7encode.obj %base\nss\pkcs7\p7local.obj %base\nss\pkcs7\secmime.obj  %base\dist\lib\nss3.lib %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib    %base\nss\smime\smime.res
mmt %base\nss\smime\smime3.dll
nsinstall -m 775 %base\nss\smime\smime3.dll %base\dist\lib
nsinstall -m 775 %base\nss\smime\smime3.lib %base\dist\lib

cd %base\..\security\nss\lib\ckfw\builtins
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\nssckbi\nssckbi.dll" -DEF:%base\nss\nssckbi\nssckbi.def -MAP  %base\nss\nssckbi\anchor.obj %base\nss\nssckbi\constants.obj %base\nss\nssckbi\bfind.obj %base\nss\nssckbi\binst.obj %base\nss\nssckbi\bobject.obj %base\nss\nssckbi\bsession.obj %base\nss\nssckbi\bslot.obj %base\nss\nssckbi\btoken.obj %base\nss\nssckbi\certdata.obj %base\nss\nssckbi\ckbiver.obj  %base\dist\lib\nssckfw.lib %base\dist\lib\nssb.lib  %base\dist\lib\plc4_s.lib %base\dist\lib\plds4_s.lib     %base\nss\nssckbi\nssckbi.res
mmt %base\nss\nssckbi\nssckbi.dll
nsinstall -m 775 %base\nss\nssckbi\nssckbi.dll %base\dist\lib

cd %base\..\security\nss\lib\fortcrypt
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\fort\stub.dll" -MAP  %base\nss\fort\maci.o 
mmt %base\nss\fort\stub.dll
copy %base\nss\fort\stub.lib %base\nss\fort\cilib.lib

cd %base\..\security\nss\lib\fortcrypt\swfort\pkcs11
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\swft\swft32.dll" -MAP  %base\nss\swft\forsock.obj %base\nss\swft\fortpk11.obj %base\nss\swft\fmutex.obj %base\nss\swft\stub.obj  %base\dist\lib\swfci.lib %base\dist\lib\softokn.lib %base\dist\lib\freebl.lib  %base\dist\lib\secutil.lib %base\dist\lib\plc4_s.lib %base\dist\lib\plds4_s.lib wsock32.lib winmm.lib     
mmt %base\nss\swft\swft32.dll
nsinstall -m 775 %base\nss\swft\swft32.dll %base\dist\lib

cd %base\..\security\nss\lib\fortcrypt
link -nologo %ltcg -DLL -SUBSYSTEM:WINDOWS -PDB:NONE -OUT:"%base\nss\fort\fort32.dll" -MAP  %base\nss\fort\forsock.obj %base\nss\fort\fortpk11.obj %base\nss\fort\fmutex.obj  %base\nss\fort\cilib.lib    
mmt %base\nss\fort\fort32.dll
nsinstall -m 775 %base\nss\fort\fort32.dll %base\dist\lib

cd %base\..\security\nss\cmd\shlibsign
cl %base\nss\shlibsign.obj -Fe%base\nss\shlibsign.exe -link %ltcg %base\dist\lib\sectool.lib %base\dist\lib\smime3.lib %base\dist\lib\ssl3.lib %base\dist\lib\nss3.lib %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib
mmt %base\nss\shlibsign.exe 
nsinstall -m 775 %base\nss\shlibsign.exe %base\dist\bin

cd %base\..\security\nss\cmd\shlibsign\mangle
cl %base\nss\mangle.obj -Fe%base\nss\mangle.exe -link %ltcg %base\dist\lib\smime.lib %base\dist\lib\ssl.lib %base\dist\lib\nss.lib %base\dist\lib\ssl.lib %base\dist\lib\sectool.lib %base\dist\lib\pkcs12.lib %base\dist\lib\pkcs7.lib %base\dist\lib\certhi.lib %base\dist\lib\cryptohi.lib %base\dist\lib\pk11wrap.lib %base\dist\lib\certdb.lib %base\dist\lib\softokn.lib %base\dist\lib\freebl.lib %base\dist\lib\swfci.lib %base\dist\lib\secutil.lib %base\dist\lib\nsspki.lib %base\dist\lib\nssdev.lib %base\dist\lib\nssb.lib %base\dist\lib\dbm.lib %base\dist\lib\plc4.lib %base\dist\lib\plds4.lib %base\dist\lib\nspr4.lib
mmt %base\nss\mangle.exe 
nsinstall -m 775 %base\nss\mangle.exe %base\dist\bin

cd %base\..\security\nss\cmd\shlibsign
 setlocal
 path=%base\dist\bin;%base\dist\lib;%path
 %base\nss\shlibsign -v -i %base\dist\lib\softokn3.dll
 endlocal

cd %base\security\manager\boot\src
link -NOLOGO -DLL -OUT:pipboot.dll -PDB:pipboot.pdb -SUBSYSTEM:WINDOWS  nsEntropyCollector.obj nsSecureBrowserUIImpl.obj nsBOOTModule.obj nsSecurityWarningDialogs.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\js3250.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt pipboot.dll
nsinstall -m 755 pipboot.dll ..\..\..\..\dist\gre\components
nsinstall -m 755 pipboot.dll ..\..\..\..\dist\bin\components

cd %base\security\manager\ssl\src
link -NOLOGO -DLL -OUT:pipnss.dll -PDB:pipnss.pdb -SUBSYSTEM:WINDOWS  md4.obj nsCipherInfo.obj nsNSSCallbacks.obj nsNSSComponent.obj nsNSSIOLayer.obj nsNSSModule.obj nsSSLSocketProvider.obj nsTLSSocketProvider.obj nsSDR.obj nsPK11TokenDB.obj nsNSSCertificate.obj nsPKCS12Blob.obj nsNSSASN1Object.obj nsKeygenHandler.obj nsCrypto.obj nsPKCS11Slot.obj nsKeygenThread.obj nsCMSSecureMessage.obj nsCMS.obj nsCertPicker.obj nsCRLInfo.obj nsNSSCertCache.obj nsNSSCertHelper.obj nsNSSCertificateDB.obj nsNSSCertTrust.obj nsNSSCertValidity.obj nsOCSPResponder.obj nsUsageArrayHelper.obj nsCRLManager.obj nsNSSShutDown.obj nsNTLMAuthModule.obj nsNSSEvent.obj nsSmartCardMonitor.obj nsSmartCardEvent.obj nsCertTree.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\crmf.lib ..\..\..\..\dist\lib\smime3.lib ..\..\..\..\dist\lib\ssl3.lib ..\..\..\..\dist\lib\nss3.lib ..\..\..\..\dist\lib\softokn3.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt pipnss.dll
nsinstall -m 755 pipnss.dll ..\..\..\..\dist\gre\components
nsinstall -m 755 pipnss.dll ..\..\..\..\dist\bin\components

cd %base\security\manager\pki\src
link -NOLOGO -DLL -OUT:pippki.dll -PDB:pippki.pdb -SUBSYSTEM:WINDOWS  nsNSSDialogs.obj nsPKIModule.obj nsPKIParamBlock.obj nsASN1Tree.obj nsNSSDialogHelper.obj nsFormSigningDialog.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt pippki.dll
nsinstall -m 755 pippki.dll ..\..\..\..\dist\gre\components
nsinstall -m 755 pippki.dll ..\..\..\..\dist\bin\components

cd %base\directory\xpcom\base\src
link -NOLOGO -DLL -OUT:mozldap.dll -PDB:mozldap.pdb -SUBSYSTEM:WINDOWS  nsLDAPProtocolModule.obj nsLDAPMessage.obj nsLDAPConnection.obj nsLDAPOperation.obj nsLDAPURL.obj nsLDAPServer.obj nsLDAPService.obj nsLDAPBERValue.obj nsLDAPControl.obj nsLDAPBERElement.obj nsLDAPSecurityGlue.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\nsldap32v50.lib ..\..\..\..\dist\lib\nsldappr32v50.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt mozldap.dll
nsinstall -m 755 mozldap.dll ..\..\..\..\dist\bin\components

cd %base\extensions\cookie
link -NOLOGO -DLL -OUT:cookie.dll -PDB:cookie.pdb -SUBSYSTEM:WINDOWS  nsModuleFactory.obj nsPermission.obj nsPermissionManager.obj nsPopupWindowManager.obj nsCookiePromptService.obj nsCookiePermission.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt cookie.dll
nsinstall -m 755 cookie.dll ..\..\dist\gre\components
nsinstall -m 755 cookie.dll ..\..\dist\bin\components

cd %base\extensions\wallet\src
link -NOLOGO -DLL -OUT:wallet.dll -PDB:wallet.pdb -SUBSYSTEM:WINDOWS  nsWalletFactory.obj nsWalletService.obj wallet.obj singsign.obj nsPassword.obj nsPasswordManager.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt wallet.dll
nsinstall -m 755 wallet.dll ..\..\..\dist\gre\components
nsinstall -m 755 wallet.dll ..\..\..\dist\bin\components

cd %base\extensions\wallet\build
link -NOLOGO -DLL -OUT:wlltvwrs.dll -PDB:wlltvwrs.pdb -SUBSYSTEM:WINDOWS  nsWalletViewerFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\signonviewer_s.lib ..\..\..\dist\lib\walletpreview_s.lib ..\..\..\dist\lib\walleteditor_s.lib   ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib shell32.lib   
mmt wlltvwrs.dll
nsinstall -m 755 wlltvwrs.dll ..\..\..\dist\bin\components

cd %base\extensions\xmlextras\build\src
link -NOLOGO -DLL -OUT:xmlextras.dll -PDB:xmlextras.pdb -SUBSYSTEM:WINDOWS  nsXMLExtrasModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\xmlextrasbase_s.lib ..\..\..\..\dist\lib\xmlextraspointers_s.lib    ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\mozz.lib ..\..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt xmlextras.dll
nsinstall -m 755 xmlextras.dll ..\..\..\..\dist\gre\components
nsinstall -m 755 xmlextras.dll ..\..\..\..\dist\bin\components

cd %base\extensions\p3p\src
link -NOLOGO -DLL -OUT:p3p.dll -PDB:p3p.pdb -SUBSYSTEM:WINDOWS  nsP3PService.obj nsP3PUtils.obj nsPolicyReference.obj nsCompactPolicy.obj nsP3PModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt p3p.dll
nsinstall -m 755 p3p.dll ..\..\..\dist\bin\components

cd %base\extensions\pref\autoconfig\src
link -NOLOGO -DLL -OUT:autoconfig.dll -PDB:autoconfig.pdb -SUBSYSTEM:WINDOWS  nsReadConfig.obj nsAutoConfig.obj nsConfigFactory.obj nsJSConfigTriggers.obj nsLDAPSyncQuery.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt autoconfig.dll
nsinstall -m 755 autoconfig.dll ..\..\..\..\dist\bin\components

cd %base\extensions\transformiix\build
link -NOLOGO -DLL -OUT:transformiix.dll -PDB:transformiix.pdb -SUBSYSTEM:WINDOWS  XSLTProcessorModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\txbase_s.lib ..\..\..\dist\lib\txxml_s.lib ..\..\..\dist\lib\txxmlparser_s.lib ..\..\..\dist\lib\txxpath_s.lib ..\..\..\dist\lib\txxslt_s.lib ..\..\..\dist\lib\txxsltfunctions_s.lib ..\..\..\dist\lib\txxsltutil_s.lib   ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt transformiix.dll
nsinstall -m 755 transformiix.dll ..\..\..\dist\bin\components

cd %base\extensions\inspector\build\src
link -NOLOGO -DLL -OUT:inspector.dll -PDB:inspector.pdb -SUBSYSTEM:WINDOWS  nsInspectorModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\inspector_s.lib    ..\..\..\..\dist\lib\gkgfx.lib ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt inspector.dll
nsinstall -m 755 inspector.dll ..\..\..\..\dist\bin\components

cd %base\extensions\universalchardet\src
link -NOLOGO -DLL -OUT:universalchardet.dll -PDB:universalchardet.pdb -SUBSYSTEM:WINDOWS  CharDistribution.obj JpCntx.obj LangBulgarianModel.obj LangCyrillicModel.obj LangGreekModel.obj LangHungarianModel.obj LangHebrewModel.obj nsHebrewProber.obj nsCharSetProber.obj nsBig5Prober.obj nsEUCJPProber.obj nsEUCKRProber.obj nsEUCTWProber.obj nsEscCharsetProber.obj nsEscSM.obj nsGB2312Prober.obj nsMBCSGroupProber.obj nsMBCSSM.obj nsSBCSGroupProber.obj nsSBCharSetProber.obj nsSJISProber.obj nsUTF8Prober.obj nsLatin1Prober.obj nsUniversalCharDetModule.obj nsUniversalDetector.obj nsUdetXPCOMWrapper.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt universalchardet.dll
nsinstall -m 755 universalchardet.dll ..\..\..\dist\bin\components

cd %base\extensions\typeaheadfind\src
link -NOLOGO -DLL -OUT:typeaheadfind.dll -PDB:typeaheadfind.pdb -SUBSYSTEM:WINDOWS  nsTypeAheadFind.obj nsTypeAheadFindRegistration.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\gkgfx.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt typeaheadfind.dll
nsinstall -m 755 typeaheadfind.dll ..\..\..\dist\gre\components
nsinstall -m 755 typeaheadfind.dll ..\..\..\dist\bin\components

cd %base\extensions\webservices\build\src
link -NOLOGO -DLL -OUT:websrvcs.dll -PDB:websrvcs.pdb -SUBSYSTEM:WINDOWS  nsWebServicesModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\websrvcssecurity_s.lib ..\..\..\..\dist\lib\websrvcsschema_s.lib ..\..\..\..\dist\lib\websrvcssoap_s.lib ..\..\..\..\dist\lib\websrvcsinterfaceinfo_s.lib ..\..\..\..\dist\lib\websrvcswsdl_s.lib ..\..\..\..\dist\lib\websrvcsproxy_s.lib    ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\mozz.lib ..\..\..\..\dist\lib\js3250.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt websrvcs.dll
nsinstall -m 755 websrvcs.dll ..\..\..\..\dist\bin\components

cd %base\extensions\spellcheck\src
link -NOLOGO -DLL -OUT:spellchk.dll -PDB:spellchk.pdb -SUBSYSTEM:WINDOWS  mozSpellCheckerFactory.obj mozSpellChecker.obj mozPersonalDictionary.obj mozEnglishWordUtils.obj mozGenericWordUtils.obj mozSpellI18NManager.obj mozInlineSpellChecker.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\unicharutil_s.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt spellchk.dll
nsinstall -m 755 spellchk.dll ..\..\..\dist\bin\components

cd %base\extensions\spellcheck\myspell\src
link -NOLOGO -DLL -OUT:myspell.dll -PDB:myspell.pdb -SUBSYSTEM:WINDOWS  affentry.obj affixmgr.obj hashmgr.obj suggestmgr.obj csutil.obj myspell.obj mozMySpell.obj mozMySpellFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\unicharutil_s.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt myspell.dll
nsinstall -m 755 myspell.dll ..\..\..\..\dist\bin\components

cd %base\extensions\auth
link -NOLOGO -DLL -OUT:auth.dll -PDB:auth.pdb -SUBSYSTEM:WINDOWS  nsAuthFactory.obj nsHttpNegotiateAuth.obj nsAuthGSSAPI.obj nsAuthSASL.obj nsAuthSSPI.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt auth.dll
nsinstall -m 755 auth.dll ..\..\dist\bin\components

cd %base\extensions\sroaming\src
link -NOLOGO -DLL -OUT:sroaming.dll -PDB:sroaming.pdb -SUBSYSTEM:WINDOWS  Core.obj Copy.obj Stream.obj Module.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt sroaming.dll
nsinstall -m 755 sroaming.dll ..\..\..\dist\bin\components

cd %base\extensions\permissions
link -NOLOGO -DLL -OUT:perms.dll -PDB:perms.pdb -SUBSYSTEM:WINDOWS  nsModuleFactory.obj nsContentBlocker.obj nsMailnewsContentBlocker.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\dist\lib\xpcom.lib ..\..\dist\lib\xpcom_core.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt perms.dll
nsinstall -m 755 perms.dll ..\..\dist\bin\components

cd %base\mailnews\base\util
link -NOLOGO -DLL -OUT:msgbsutl.dll -PDB:msgbsutl.pdb -SUBSYSTEM:WINDOWS  nsMsgGroupRecord.obj nsMsgLineBuffer.obj nsMsgDBFolder.obj nsUint8Array.obj nsUInt32Array.obj nsMsgKeySet.obj nsMsgKeyArray.obj nsLocalFolderSummarySpec.obj nsNewsSummarySpec.obj nsMsgIdentity.obj nsMsgIncomingServer.obj nsMsgUtils.obj nsMsgProtocol.obj nsMsgMailNewsUrl.obj nsMsgTxn.obj nsMsgI18N.obj nsAdapterEnumerator.obj nsImapMoveCoalescer.obj   .\module.res %ltcg  -opt:ref,icf  ..\..\..\dist\lib\rdfutil_s.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msgbsutl.dll
nsinstall -m 755 msgbsutl.lib ..\..\..\dist\lib
nsinstall -m 755 msgbsutl.dll ..\..\..\dist\bin

cd %base\mailnews\base\build
link -NOLOGO -DLL -OUT:msgbase.dll -PDB:msgbase.pdb -SUBSYSTEM:WINDOWS  nsMsgFactory.obj   mail.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\msgbase_s.lib ..\..\..\dist\lib\msgsearch_s.lib    ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\rdfutil_s.lib ..\..\..\dist\lib\js3250.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib shell32.lib   
mmt msgbase.dll
nsinstall -m 755 msgbase.dll ..\..\..\dist\bin\components

cd %base\mailnews\db\msgdb\build
link -NOLOGO -DLL -OUT:msgdb.dll -PDB:msgdb.pdb -SUBSYSTEM:WINDOWS  nsMsgDBFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\msgdb_s.lib   ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msgdb.dll
nsinstall -m 755 msgdb.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\news\build
link -NOLOGO -DLL -OUT:msgnews.dll -PDB:msgnews.pdb -SUBSYSTEM:WINDOWS  nsMsgNewsFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\msgnews_s.lib  -L..\..\..\dist\bin -L..\..\..\dist\lib ..\..\..\dist\lib\rdfutil_s.lib ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\js3250.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msgnews.dll
nsinstall -m 755 msgnews.dll ..\..\..\dist\bin\components

cd %base\mailnews\local\build
link -NOLOGO -DLL -OUT:msglocal.dll -PDB:msglocal.pdb -SUBSYSTEM:WINDOWS  nsMsgLocalFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\msglocal_s.lib    ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\rdfutil_s.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msglocal.dll
nsinstall -m 755 msglocal.dll ..\..\..\dist\bin\components

cd %base\mailnews\mime\emitters\build
link -NOLOGO -DLL -OUT:emitter.dll -PDB:emitter.pdb -SUBSYSTEM:WINDOWS  nsEmitterFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\emitterutil_s.lib    ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib ..\..\..\..\dist\lib\msgbsutl.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt emitter.dll
nsinstall -m 755 emitter.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\mime\cthandlers\vcard
link -NOLOGO -DLL -OUT:vcard.dll -PDB:vcard.pdb -SUBSYSTEM:WINDOWS  mimevcrd.obj nsVCardFactory.obj   .\module.res %ltcg  -DEF:d:\mozilla\mailnews\mime\cthandlers\vcard\vcard.def -MAP:vcard.map -MAPINFO:LINES -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\mimecthglue_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt vcard.dll
nsinstall -m 755 vcard.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\mime\build
link -NOLOGO -DLL -OUT:mime.dll -PDB:mime.pdb -SUBSYSTEM:WINDOWS  nsMimeModule.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\mime_s.lib    ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt mime.dll
nsinstall -m 755 mime.dll ..\..\..\dist\bin\components

cd %base\mailnews\compose\build
link -NOLOGO -DLL -OUT:msgcompo.dll -PDB:msgcompo.pdb -SUBSYSTEM:WINDOWS  nsMsgCompFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\msgcompose_s.lib    ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\js3250.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msgcompo.dll
nsinstall -m 755 msgcompo.dll ..\..\..\dist\bin\components

cd %base\mailnews\imap\build
link -NOLOGO -DLL -OUT:msgimap.dll -PDB:msgimap.pdb -SUBSYSTEM:WINDOWS  nsImapFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\msgimap_s.lib    ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\rdfutil_s.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msgimap.dll
nsinstall -m 755 msgimap.dll ..\..\..\dist\bin\components

cd %base\mailnews\addrbook\build
link -NOLOGO -DLL -OUT:addrbook.dll -PDB:addrbook.pdb -SUBSYSTEM:WINDOWS  nsAbFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\addrbook_s.lib    ..\..\..\dist\lib\rdfutil_s.lib ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt addrbook.dll
nsinstall -m 755 addrbook.dll ..\..\..\dist\bin\components

cd %base\mailnews\import\src
link -NOLOGO -DLL -OUT:import.dll -PDB:import.pdb -SUBSYSTEM:WINDOWS  nsImportService.obj nsImportMail.obj nsImportMailboxDescriptor.obj nsImportABDescriptor.obj nsImportAddressBooks.obj nsImportStringBundle.obj ImportTranslate.obj nsImportTranslator.obj ImportCharSet.obj ImportOutFile.obj nsImportScanFile.obj nsImportEncodeScan.obj nsImportMimeEncode.obj nsImportFieldMap.obj nsImportFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt import.dll
nsinstall -m 755 import.dll ..\..\..\dist\bin\components

cd %base\mailnews\import\text\src
link -NOLOGO -DLL -OUT:impText.dll -PDB:impText.pdb -SUBSYSTEM:WINDOWS  nsTextStringBundle.obj nsTextImport.obj nsTextAddress.obj nsTextFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt impText.dll
nsinstall -m 755 impText.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\import\comm4x\src
link -NOLOGO -DLL -OUT:impComm4xMail.dll -PDB:impComm4xMail.pdb -SUBSYSTEM:WINDOWS  nsComm4xMailImport.obj nsComm4xMail.obj nsComm4xProfile.obj nsComm4xMailFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt impComm4xMail.dll
nsinstall -m 755 impComm4xMail.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\import\eudora\src
link -NOLOGO -DLL -OUT:impEudra.dll -PDB:impEudra.pdb -SUBSYSTEM:WINDOWS  nsEudoraStringBundle.obj nsEudoraImport.obj nsEudoraMailbox.obj nsEudoraSettings.obj nsEudoraCompose.obj nsEudoraAddress.obj nsEudoraWin32.obj nsEudoraFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\xpcom_compat.lib ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt impEudra.dll
nsinstall -m 755 impEudra.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\import\oexpress
link -NOLOGO -DLL -OUT:importOE.dll -PDB:importOE.pdb -SUBSYSTEM:WINDOWS  nsOEImport.obj nsOEScanBoxes.obj nsOEMailbox.obj nsOEAddressIterator.obj WabObject.obj nsOERegUtil.obj nsOE5File.obj nsOESettings.obj nsOEStringBundle.obj nsOEFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\dist\lib\msgbsutl.lib ..\..\..\dist\lib\xpcom.lib ..\..\..\dist\lib\xpcom_core.lib ..\..\..\dist\lib\nspr4.lib ..\..\..\dist\lib\plc4.lib ..\..\..\dist\lib\plds4.lib  ..\..\..\dist\lib\unicharutil_s.lib ..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt importOE.dll
nsinstall -m 755 importOE.dll ..\..\..\dist\bin\components

cd %base\mailnews\import\outlook\src
link -NOLOGO -DLL -OUT:impOutlk.dll -PDB:impOutlk.pdb -SUBSYSTEM:WINDOWS  nsOutlookRegUtil.obj nsOutlookStringBundle.obj nsOutlookImport.obj nsOutlookSettings.obj MapiApi.obj nsOutlookMail.obj MapiMessage.obj MapiMimeTypes.obj nsOutlookCompose.obj nsOutlookFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt impOutlk.dll
nsinstall -m 755 impOutlk.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\extensions\mdn\build
link -NOLOGO -DLL -OUT:msgmdn.dll -PDB:msgmdn.pdb -SUBSYSTEM:WINDOWS  nsMsgMdnFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\msgmdn_s.lib    ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msgmdn.dll
nsinstall -m 755 msgmdn.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\extensions\mailviews\build
link -NOLOGO -DLL -OUT:mailview.dll -PDB:mailview.pdb -SUBSYSTEM:WINDOWS  nsMsgMailViewsFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\mailview_s.lib    ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt mailview.dll
nsinstall -m 755 mailview.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\extensions\bayesian-spam-filter\build
link -NOLOGO -DLL -OUT:bayesflt.dll -PDB:bayesflt.pdb -SUBSYSTEM:WINDOWS  nsBayesianFilterFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\bayesflt_s.lib    ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib ..\..\..\..\dist\lib\unicharutil_s.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt bayesflt.dll
nsinstall -m 755 bayesflt.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\extensions\smime\build
link -NOLOGO -DLL -OUT:msgsmime.dll -PDB:msgsmime.pdb -SUBSYSTEM:WINDOWS  nsMsgSMIMEFactory.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\msgsmime_s.lib    ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\js3250.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib  ..\..\..\..\dist\lib\xpcom_compat.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt msgsmime.dll
nsinstall -m 755 msgsmime.dll ..\..\..\..\dist\bin\components

cd %base\mailnews\mapi\mapiDll
link -NOLOGO -DLL -OUT:mozMapi32.dll -PDB:mozMapi32.pdb -SUBSYSTEM:WINDOWS  MapiDll.obj   .\module.res %ltcg  -DEF:d:\mozilla\mailnews\mapi\mapiDll\Mapi32.def -opt:ref,icf  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib ole32.lib   
mmt mozMapi32.dll
nsinstall -m 755 mozMapi32.lib ..\..\..\dist\lib
nsinstall -m 755 mozMapi32.dll ..\..\..\dist\bin

cd %base\mailnews\mapi\mapihook\build
link -NOLOGO -DLL -OUT:MapiProxy.dll -PDB:MapiProxy.pdb -SUBSYSTEM:WINDOWS  dlldata.obj msgMapi_p.obj msgMapi_i.obj   .\module.res %ltcg  -DEF:d:\mozilla\mailnews\mapi\mapihook\build\MapiProxy.def -opt:ref,icf  kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib rpcrt4.lib   
mmt MapiProxy.dll
nsinstall -m 755 MapiProxy.lib ..\..\..\..\dist\lib
nsinstall -m 755 MapiProxy.dll ..\..\..\..\dist\bin

cd %base\mailnews\mapi\mapihook\src
link -NOLOGO -DLL -OUT:msgMapi.dll -PDB:msgMapi.pdb -SUBSYSTEM:WINDOWS  msgMapiFactory.obj msgMapiHook.obj msgMapiImp.obj msgMapiMain.obj msgMapiSupport.obj nsMapiRegistry.obj nsMapiRegistryUtils.obj Registry.obj ..\build\msgMapi_i.obj  .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import ..\..\..\..\dist\lib\msgbsutl.lib ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\xpcom_compat.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib ole32.lib   
mmt msgMapi.dll
nsinstall -m 755 msgMapi.dll ..\..\..\..\dist\bin\components

cd %base\xpfe\components\search\src
link -NOLOGO -DLL -OUT:srchsvc.dll -PDB:srchsvc.pdb -SUBSYSTEM:WINDOWS  nsInternetSearchService.obj nsLocalSearchService.obj   .\module.res %ltcg  -opt:ref,icf -IMPLIB:fake-import  ..\..\..\..\dist\lib\unicharutil_s.lib ..\..\..\..\dist\lib\xpcom.lib ..\..\..\..\dist\lib\xpcom_core.lib ..\..\..\..\dist\lib\nspr4.lib ..\..\..\..\dist\lib\plc4.lib ..\..\..\..\dist\lib\plds4.lib   kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib   
mmt srchsvc.dll
nsinstall -m 755 srchsvc.dll ..\..\..\..\dist\bin\components

cd %base\xpfe\bootstrap
link -NOLOGO -OUT:seamonkey.exe -PDB:seamonkey.pdb -SUBSYSTEM:WINDOWS %ltcg  -opt:ref,icf -HEAP:0x40000 nsAppRunner.obj showOSAlert.obj nsNativeAppSupportWin.obj nsNativeAppSupportBase.obj .\module.res    ..\..\dist\lib\xpcomglue.lib  ..\..\dist\lib\js3250.lib ..\..\dist\lib\nspr4.lib ..\..\dist\lib\plc4.lib ..\..\dist\lib\plds4.lib    kernel32.lib user32.lib gdi32.lib winmm.lib wsock32.lib advapi32.lib comctl32.lib comdlg32.lib uuid.lib shell32.lib ole32.lib oleaut32.lib version.lib winspool.lib gdi32.lib
mmt seamonkey.exe
nsinstall -m 755 seamonkey.exe ..\..\dist\bin
endlocal
timer /3