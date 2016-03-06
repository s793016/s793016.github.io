; NSIS Modern User Interface version 1.62
; 
; NSIS 粂ē竲セ糶盞м
; 
; 硂琌 KA 龟ノ MDaemon 4.05 いゅて粂ē杆
; 吏挂: NSIS 2.0b1, Modern UI 1.62
;
; 獽綷弄夹 (* 秈顶) 耕螟菠筁
; 碭琌稱快猭ノ Modern UI 1.62 穝┮Τмォ
; 狦爹秆糶眔び穕甡醇坝叫话е糶獺絴и
;
; 虏砰磞瓃场だ BIG5 絪絏ぇㄏノ GB2312 珿
; ゲ﹚Τ睹絏临叫ǎ教狦惠璶呼眔タ絋絪絏
; 叫纗 BIG5 plain text ㄓ矪瞶и穦
; attach file よΑ狾
;
; и⊿Τㄏノヴ摸 GUI ㄣ狦ぇ玡竒Τノ
;  2.0a7  NSI 竲セ阁禫セ Modern UI 糶
; 猭穦ㄇひゑ穝弘地狾Τノ 
; magiclime 瞷ノ advsplash 本祘ΑよΑ更
; ぃノ┤и柑常糶狦临尔び陈沸Joost 璣
; ゅHTML Τ某
;
; 癘眔⊿眏璶ㄏノ粂ē⊿眏璶 Modern 
; UI ⊿眏璶舧癸杠よ遏妓暗翴
; ぃ玁肚参杆祘Αぃ璶ê柑紀杠ぐ或 NSIS
; 稶暗稶
;
; 硂ㄇ常琌∕﹚

SetCompressor lzma

!include "MUI.nsh"

Page license popup_message
Page license popup_message showLicense2
Page directory
Page components .onSelChange
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

;=======================================================
; 〗1.﹚竡跑计杆ヘ魁块郎瓜ボ
;=======================================================
; 璶硂柑糶ㄤ常酚﹚竡跑计禲碞
;
;==============================
; 1.1 セ腹絏/嘿
;
!define VER_1 2                           ;硁砰セ腹絏 1  Eudora 4.3.1.2 セ腹絏
!define VER_2 40                          ;硁砰セ腹絏 2
!define VER_3 " Alpha?"                  ;硁砰セ腹絏 3 (* 秈顶)
;!define VER_4 yyy                        ;硁砰セ腹絏 4 (* 秈顶)
;!define VER_R 3                           ;いゅてセ材碭 (* 秈顶)
!define My_Version  "${VER_1}.${VER_2}${VER_3}" ;祘Α嘿 (ㄏノ糶)
!define My_PRODUCT  "Unicode-At-on" ;祘Α嘿 (ㄏノ糶)
Name "${My_PRODUCT} ${My_Version}"    ;祘Α嘿 (ㄏノ糶)
!define PROGFNHEADER "unicodeaton_"              ;いゅて郎嘿璶场だ (场糶)
!define PROGMAINEXE  "Ico10928.ico"        ;祘Α磅︽郎嘿 (.exe)
Var FTPageLicense                      ;PageLicense 篨夹磅︽筁Ω碞穦砆稦奔
Var FTPageCompoment                    ;PageCompoment 篨夹磅︽筁Ω碞穦砆稦奔
Var Def3WBrowser                       ;╰参箇砞呼聅凝竟
Var FromNLS
Var ComPath

;==============================
; 1.2 弄и郎/块郎
;
; 弄и陪ボ珹 CHS/CHT/ENU セ狦ぃ惠璶籹
; 粂ēいゅてセ璶σ納弄и硂弄и
; 硄盽ㄓいゅて磞瓃郎τ獶硁砰 readme 
;
; 郎㏑: (场糶)
; (cpatch)   c +        ${PROGFNHEADER} + セ腹絏 _(┏絬) 材碭いゅてセ . 捌郎
; (hanzify) ha _(┏絬)  ${PROGFNHEADER} + セ腹絏 _(┏絬)  . 耎甶

!define MyFileName "${PROGFNHEADER}${VER_1}${VER_2}"
OUTFILE            "${MyFileName}.exe"

;==============================
; 1.3 箇砞杆ヘ魁 (Ю狠ぃ \)
;
; 硄盽穦瞷 "C:\Program Files\xxxx " 硂贺ヘ魁
; ㄏノ ${AppPath} 爹碝т侣杆ヘ魁
; 狦爹杆ヘ魁 (Ю狠 \) 瞷ぃ璶ㄏノ祇ネ岿粇

InstallDir "$PROGRAMFILES\${My_PRODUCT}"

;==============================
; 1.4 舦紇钩
;
; 惠璶碞镑 (﹚璶 bmp Α)材琌ㄓ玁ノ
; ㄏノ┪Чぃㄏノ

;!define SPLASH1 ".\434but\logo.bmp"
;!define SPLASH2 "BMP150chs.BMP"

;==============================
; 1.5 杆祘Α篈
;
; いゅて/钡杆/临琌干后干杆瞷 caption 场だ
; 秆埃杆穦瞷爹

;!define PATCHTYPE_ENU "(CN+TW) localized"
;!define PATCHTYPE_CHT "(CN+TW) いゅて"
;!define PATCHTYPE_CHS "(CN+TW) 中文化"

;==============================
; 1.6 ノ秆埃杆戈癟
;
; そ嘿/硁砰阀瓃穦峨 Uninstall 爹ず

!define URLABOUT  'http://cpatch.org/unicode'
!define URLHELP   'http://leoboard.cpatch.org/cgi-bin/forums.cgi?forum=21'
!define URLUPDATE 'http://search.cpatch.org/search.php?query=unicode&type=fulltext'
!define PUBLISHER '2004 cpatch.org'
; 玡穦笆ㄌ粂ē干 Copyright (c) ┪ 舦┮Τ (c) 璶钡㎝そ嘿


; й呼弧猔種: 璣ゅ磞瓃いぃ璶ㄏノ ' " じ玥穦礚猭т沧ゎじ

;=======================================================
; 〗2.ㄏノざ
;=======================================================
; 硂琿ノ硚眏滦糶 system.nsh 璣ゅ箇砞砞﹚
; 硄盽Τ跑 瓜ボ

;==============================
; 2.1 

; 杆ざ箇砞 8﹚璶э奔玥 win98 いゅぃ
; 蛮粂ēいゅてㄏノ "Tahoma" 
; ぃ惠璶疭﹚穝灿砰┪Ш蔨

;!define MUI_FONT "MS Shell Dlg"
;!define MUI_FONTSIZE "8"
;!define MUI_FONT_HEADER "MS Sans Serif"
;!define MUI_FONTSIZE_HEADER "8"
;
; : NSIS 箇砞: 某э
;
;!define MUI_FONT "Tahoma"         ;  NSIS 2.0b4 2003-05-01 ぇセぃ惠璶ノ硂㏑パ *.NSH ﹚粂ē嘿籔
;!define MUI_FONTSIZE "9"
;!define MUI_FONT_HEADER "Tahoma"
;!define MUI_FONTSIZE_HEADER "9"

;==============================
; 2.2 瓜ボ

; 杆祘Α瓜ボ: 硄盽иㄏノ祘Α瓜ボノ VC ┾ㄓ
; 秆埃杆瓜ボ: 琵 [北 | 穝糤/簿埃祘Α] 瞷タ絋瓜ボ临琌ノ瓜ボ
;               Τ玥ㄏノウ瓜ボ (癬ㄓぃ岿)
;!define MUI_ICON   "${NSISDIR}\Contrib\Icons\modern-install.ico"
;!define MUI_UNICON "${NSISDIR}\Contrib\Icons\modern-uninstall.ico"
;
; : NSIS 瓜ボ箇砞Τ翴钩 InstallShield 6 ぃ岿
; : 璹瓜ボ叫﹚タ絋嘿

;!define MUI_ICON      "${NSISDIR}\Contrib\Graphics\Icons\classic-install.ico"
;!define MUI_UNICON    "${NSISDIR}\Contrib\Graphics\Icons\nsis1-uninstall.ico"
!define MUI_ICON      "Ico10928.ico"
!define MUI_UNICON    "Ico10928.ico"
;==============================
; 2.3 ㄤ (* 秈顶)

;!define MUI_UI          "${NSISDIR}\Contrib\UIs\modern2.exe"
!define MUI_CHECKBITMAP "${NSISDIR}\Contrib\Graphics\Checks\modern.bmp"
!define MUI_FONTSTYLE_HEADER "700"
!define MUI_FONT_TITLE "Verdana"
!define MUI_FONTSIZE_TITLE "12"
!define MUI_FONTSTYLE_TITLE "700"
!define MUI_INSTALLCOLORS "/windows"
!define MUI_PROGRESSBAR "smooth"
!define MUI_SPECIALINI    "${NSISDIR}\Contrib\Modern UI\ioSpecial.ini"
!define MUI_SPECIALBITMAP "${NSISDIR}\Contrib\Graphics\Wizard\win.bmp"
!define MUI_BGCOLOR "0xFFFFFF"
;!define MUI_CUSTOMFUNCTION_GUIINIT MyGUIInit
; 秨币传瓜
!define MUI_HEADERIMAGE
; MUI_HEADERIMAGE_BITMAP bmp_file
;Bitmap image to display on the header of installers pages (recommended size: 150x57 pixels).
;Default: ${NSISDIR}\Contrib\Graphics\Header\nsis.bmp
;!define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\nsis.bmp"
!define MUI_HEADERIMAGE_BITMAP ".\434but\up.bmp"
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
;Bitmap for the Welcome page and the Finish page (recommended size: 164x314 pixels).
;!define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\win.bmp"

;=======================================================
; 〗3.粂ē╰参
;=======================================================
; 更 Modern UI\System.nsh ぇノ

;==========================
; 3.1 玡竚跑计跌惠璶τ﹚
;
; 硄盽瞷传セ竲セ跑计タ

;!define NAME "${My_PRODUCT}"

;陪ボいゅて夹肈ㄌ ENU/CHT/CHS 粂ēぃ

CAPTION "$(MyCaption) ${My_Version} (Win98/SE/ME/2K/XP/2K3)"

;==========================
; 3.3 ㄏノざ
;
; 狦ぃ璶硂ㄇ癸杠よ遏ぃ暗 define 碞ぃ穦瞷

  !define MUI_WELCOMEPAGE             ;舧
  !define MUI_LICENSEPAGE             ;甭舦   !define MUI_LICENSEPAGE_RADIOBUTTONS
  !define MUI_COMPONENTSPAGE          ;じン
  !define MUI_DIRECTORYPAGE           ;ヘ魁匡拒
  !define MUI_ABORTWARNING            ;いゎ牡
  !define MUI_UNINSTALLER             ;秆埃杆祘Α
  !define MUI_UNCONFIRMPAGE           ;ぃ暗絋粄
; !define MUI_STARTMENUPAGE           ;匡拒秨﹍

  !define MUI_FINISHPAGE              ;瞷ЧΘ磅︽祘Α㎝弄и
    !define MUI_FINISHPAGE_NOAUTOCLOSE

;    !define MUI_FINISHPAGE_RUN "$INSTDIR\${PROGMAINEXE}"
     !define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\$(FILENAME_README)"

;;  !insertmacro MUI_SYSTEM             ;ㄏノざ╰参

;==============================
; 3.4 瓣粂ē

  !insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"

;==============================
; 3.5 甭舦ゅ (* 秈顶)
;
; 硂ㄇ郎⊿Τ瞷 NSIS 箇砞ず狦も⊿Τ license 郎
; 叫钡 remark 奔

LicenseData "$(MyLicenseData)"

; 硂ㄇ狥﹁穦砆秆溃罽ㄓ玂痙硂碭︽ヴ File ぇ玡!)
; ノ BZIP2 溃罽

;!insertmacro MUI_RESERVEFILE_LANGDLL

 !macro FileSize FNAME
  push $2
  push $1
  FileOpen $1 "${FNAME}" "r"
  FileSeek $1 0 END $2
  FileClose $1
  pop $1
  exch $2
 !macroend

;=======================================================
; 〗6.杆┮Τ郎
;=======================================================

;==============================
; 6.1 杆摸

; ㄢ贺莱赣镑

InstType "$(DESC_InstTypeStandard)"
InstType "$(DESC_InstTypeMinimum)"

SetOverwrite on

;==============================
; 6.3 杆竊琿
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "-Backup"
  SectionIn 1 2 RO

; 秨﹍称
  SetOutPath "$INSTDIR\Backup"

  IfFileExists "$OutDir\$R7_950.nls" 0 +2
   return
  IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\$R7_950.nls" BakAgain

; 盢 $R7_950o.nls 跑Θ称
  IfFileExists "$SYSDIR\$R7_950o.nls" 0 DO1
   rename "$SYSDIR\$R7_950o.nls" "$OutDir\$R7_950.nls"
   StrCmp $R6 '98' DO98
    return

; 盢岿粇称簿タ絋竚
BakAgain:
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\$R7_950.nls" "$OutDir\$R7_950.nls"
   StrCmp $R6 '98' 0 BakAgainNT
   StrCmp $6 '1028' 0 BakAgainNT
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\gdi.exe" "$OutDIR\gdi.exe"
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\unicode.bin" "$OutDIR\unicode.bin"

; 狦ぃ琌蛮╰参碞р岿粇ヘ魁
   IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\C_950.nls" 0 RMOldDir
    return

BakAgainNT:
   IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\CP_950.nls" 0 +2
    return

RMOldDir:
   RMDir /r "$PROGRAMFILES\${My_PRODUCT}"
    return

;  ⊿Τ称 $R7_950.nls钡称
DO1:
   COPYFILES "$SYSDIR\$R7_950.nls" "$OutDir\$R7_950.nls"
   StrCmp $R6 '98' +2
    return

DO98:
   StrCmp $6 '1028' 0 +3
    COPYFILES "$SYSDIR\unicode.bin" "$OutDir\unicode.bin"
    COPYFILES "$SYSDIR\gdi.exe" "$OutDir\gdi.exe"

 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "$(Item1)" SecItem1
  SectionIn 1 2 RO

; 6.3.1 いゅて弄и
; 硄盽峨杆ヘ魁

  SetOutPath $INSTDIR
        File /oname="${MyFileName}.txt" "unicodeaton.txt"
        File /oname="${MyFileName}_gb.txt" "unicodeaton_gb.txt"
        file ".\434but\history.txt"
        file ".\434but\history_gb.txt"
        file "ICO10928.ICO"
        File ".\add-on\forum.url"
        File ".\add-on\testjap.url"
        File ".\add-on\testsimp.url"
        File ".\add-on\website.url"
     ExecShell open '$INSTDIR\$(FILENAME_history)'
     ExecShell open '$INSTDIR\$(FILENAME_README)'
;    ExecShell open '$INSTDIR\forum.url'
     Exec '$Def3WBrowser http://leoboard.cpatch.org/cgi-bin/forums.cgi?forum=21'

; 6.3.2 いゅて祘Α郎

; 硄盽ぃㄏノ *.* 篈τ﹚杆岿粇
; 盽盽琌 *.DLL *.EXE *.AX 单摸и常р硂摸 cht ヘ魁
  SetOutPath $INSTDIR\Backup

  File ".\Win\B2U.BIN"
  File ".\add-on\chop.exe"

  StrCmp $R6 '98' NLS_98

  StrCmp $R6 '2k3' 0 NLS_Start
   ClearErrors
   ReadINIStr $R2 "$WINDIR\inf\layout.inf" "SourceDisksFiles" "c_950.nls"
   IfErrors NLS_Start
    DeleteINIStr "$WINDIR\inf\layout.inf" "SourceDisksFiles" "c_950.nls"
    WriteINIStr "$WINDIR\inf\layout.inf" "SourceDisksFiles" ";c_950.nls" "$R2"

NLS_Start:
;  р AppLocale  bug 秆∕奔 (xp/2k3 only)
  StrCmp $R6 '2k' NLS_2k
   GetTempFileName $R0
   SetFileAttributes "$R0" NORMAL
   SetFileAttributes "$R0" READONLY
   Rename /rebootok "$R0" "$WinDIR\AppPatch\AppLoc.tmp"

NLS_2k:
   File ".\Win\C_950_U2B.BIN"

   delete "$Outdir\c_950.100"
   nsExec::Exec '"$outdir\chop.exe" -z -g100 -e1184 c_950.nls'
   delete "$Outdir\c_950.101"
   nsExec::Exec '"$outdir\chop.exe" -z -g101 -b65567 -e65570 c_950.nls'
   delete "$Outdir\c_950-.nls"
   nsExec::Exec '"$sysdir\cmd.exe" /c copy /b c_950.100+b2u.bin+c_950.101+c_950_u2b.bin c_950-.nls'

   delete /rebootok "$Outdir\c_950.10?"
   Delete /rebootok "$Outdir\C_950_U2B.BIN"

;  盢 c_950.nls 眖 windows file protect い簿奔
   Delete $SYSDIR\dllcache\c_950.nls

;  材Ω狦钡 rename 碞秨诀Ω碞ネ
  StrCmp $6 '1028' 0 NLS_OP
   Delete "$SYSDIR\C_950.nls"
   IfFileExists "$SYSDIR\C_950.nls" 0 NLS_OP

;  狦ぃ︽临ΤΩ REBOOTOK 匡兜惠璶秨诀ㄢΩネ
;  硂妓暗琌磷窾材Ωㄏノ礚猭糶 [Igore] 临Τ诀穦фЫ
;  ps: Τㄏノい獶 unicode 粂╰琌羉い user 惠璶秨ㄢΩ
;    MessageBox MB_OK|MB_ICONEXCLAMATION "$(Lock950)"
     MessageBox MB_OK|MB_ICONEXCLAMATION "牡$\n======$\nぃ C_950.nls 綝╰参玛﹚$\n$\n惠璶硈尿穝秨诀ㄢΩUnicode 干Ч璸购穦ネ"
   goto NLS_OP

NLS_98:
  File ".\Win\CP_950_H.BIN"
  File ".\Win\CP_950_U2B.BIN"
   FileOpen $FromNLS "CP_950.nls" r

   delete "$Outdir\cp_950.100"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g100 -b73 -e1250 cp_950.nls'
   delete "$Outdir\cp_950.101"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g101 -b65633 -e65634 cp_950.nls'

;琿秨﹍翴
    FileSeek $FromNLS 24

     push $FromNLS
     call readDword
     pop $2

   IntOP $2 $2 * 2
   IntOP $2 $2 + 1
   delete "$Outdir\cp_950.102"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g102 -b$2 cp_950.nls'
   delete "$Outdir\cp_950-.nls"
   nsExec::Exec '"$ComPath\command.com" /c copy /b cp_950_h.bin+cp_950.100+b2u.bin+cp_950.101+cp_950_u2b.bin+cp_950.102 cp_950-.nls'

   FileClose $FromNLS

   delete /rebootok "$Outdir\cp_950.10?"
   Delete /rebootok "$Outdir\CP_950*.BIN"

  StrCmp $6 '1028' 0 NLS_OP

;gdi-.exe
   File ".\Win\GDI.BIN"

;ME
;chop -z -e392080 gdi.exe
;chop -z -b440717 -g3 gdi.exe
;copy /b gdi.1+gdi.bin+gdi.3 gdi-.exe

;98, 98SE
;chop -z -e390448 gdi.exe
;chop -z -b439085 -g3 gdi.exe
;copy /b gdi.1+gdi.bin+gdi.3 gdi-.exe

;7e 00 7f 00 40 fe 00 00 b8 ee b9 ee
;
;j982gdi.exe  Sector 0762 Offset 0300
;k981gdi.exe  Sector 0762 Offset 0300
;k982gdi.exe  Sector 0762 Offset 0300
;p981gdi.exe  Sector 0762 Offset 0300
;p982gdi.exe  Sector 0762 Offset 0300
;c981gdi.exe  Sector 0762 Offset 0300
;c982gdi.exe  Sector 0762 Offset 0300
;c983gdi.exe  Sector 0765 Offset 0396


;GetDllVersion "$sysdIR\gdi.exe" $R0 $R1
;IntOp $R2 $R0 / 0x00010000
;IntOp $R3 $R0 & 0x0000FFFF
;IntOp $R4 $R1 / 0x00010000
;IntOp $R5 $R1 & 0x0000FFFF
;StrCpy $R0 "backup\gdi.exe: $R2.$R3.$R4.$R5"
;------
;  $R2 . $R3 . $R4 . $R5
;se - 4.10.0.2222
;me - 4.90.0.3000

   push $r0
   push $r1
   GetDllVersion "$Outdir\gdi.exe" $R0 $R1
   IntOp $R0 $R0 & 0x0000FFFF
   IntOp $R1 $R1 & 0x0000FFFF

   delete "$Outdir\GDI.100"

   SetDetailsPrint none
   StrCmp $R0 '90' 0 +2
    nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g100 -e$1 gdi.exe'
   SetDetailsPrint none
   StrCmp $R0 '90' +2
    File ".\Win\GDI.100"
   SetDetailsPrint both

   delete "$Outdir\GDI.101"

   SetDetailsPrint none
   StrCmp $R0 '90' 0 +2
    nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g101 -b$3 gdi.exe'
   SetDetailsPrint none
   StrCmp $R0 '90' +2
    File ".\Win\GDI.101"
   SetDetailsPrint both

   delete "$Outdir\GDI-.exe"
   nsExec::Exec '"$ComPath\command.com" /c copy /b gdi.100+gdi.bin+gdi.101 gdi-.exe'
   pop $r1
   pop $r0

   delete /rebootok "$Outdir\GDI.10?"
   Delete /rebootok "$Outdir\gdi.bin"

;unicode-.bin
   File ".\Win\UNI_H.BIN"
   File ".\Win\UNI_B2U1.BIN"
   File ".\Win\UNI_U2B.BIN"

   delete "$Outdir\unicode.100"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g100 -b89 -e2295 unicode.bin'
   delete "$Outdir\unicode-.bin"
   nsExec::Exec '"$ComPath\command.com" /c copy /b uni_h.bin+unicode.100+uni_b2u1.bin+b2u.bin+uni_u2b.bin unicode-.bin'

   Delete /rebootok "$Outdir\UNI_*.BIN"
   Delete /rebootok "$Outdir\UNICODE.100"
   Delete /rebootok "$Outdir\B2U.BIN"

NLS_OP:
;  ㄏノ rebootOK 兜ヘア毖杠穦Ω秨诀笆穝㏑
   Delete "$SysDIR\$R7_950-.nls"
   Rename "$Outdir\$R7_950-.nls" "$SysDIR\$R7_950-.nls"
   Rename /REBOOTOK "$SYSDIR\$R7_950-.nls" "$SYSDIR\$R7_950.nls"
   StrCmp $R6 '98' 0 RenOK
    StrCmp $6 '1028' 0 RenOK
     Delete "$SYSDIR\GDI-.EXE"
     Delete "$SYSDIR\unicode-.bin"
     Rename "$Outdir\gdi-.exe" "$SYSDIR\GDI-.EXE"
     Rename "$Outdir\unicode-.bin" "$SYSDIR\unicode-.bin"
     Rename /rebootok "$SYSDIR\gdi-.exe" "$SYSDIR\GDI.EXE"
     Rename /rebootok "$SYSDIR\unicode-.bin" "$SYSDIR\unicode.bin"

RenOK:
   Delete /rebootok "$WinDIR\TTFCACHE"
   Delete /rebootok "$Sysdir\FNTCACHE.DAT"
;  р NLS 絏 $R7_950.nls (磷 2.00 讽い .nls 玛﹚)
   WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Nls\CodePage" "950" "$R7_950.nls"

   StrCmp $R6 '98' +3
    WriteRegStr HKLM "SYSTEM\ControlSet001\Control\Nls\CodePage" "950" "c_950.nls"
    WriteRegStr HKLM "SYSTEM\ControlSet002\Control\Nls\CodePage" "950" "c_950.nls"

   Delete /rebootok "$Outdir\b2u.bin"
   Delete /rebootok "$Outdir\chop.exe"
  SetOutPath $INSTDIR
 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
; Section "UAO-EUDC" SecEUDC
 Section "$(Item2eudc)" SecItem2eudc

   File /oname=$SYSDIR\UAO-EUDC.TTE ".\ADD-ON\UAO-EUDC.TTE"

   ;ぇ玡Τ杆硑盾?
   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "SystemDefaultEUDCFont"

   ;Τ杆杠и称ぃ狦碞ぃ滦称
   IfErrors 0 set_eudc
   StrCmp $R0 "" set_eudc

   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "BackupSystemDefaultEUDCFont"
   IfErrors 0 set_eudc

   ;称
   WriteRegStr HKCU "eudc\950" "BackupSystemDefaultEUDCFont" "$R0"

set_eudc:
   WriteRegStr HKCU "eudc\950" "SystemDefaultEUDCFont" "$SYSDIR\UAO-EUDC.TTE"

 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
; Section "Sakura Input Method" SecSakuraime
 Section "$(Item2)" SecItem2
  SectionIn 1
  SetOutPath $SYSDIR

StrCpy $R1 "0"
StrCpy $R2 "0"

  StrCmp $R6 '98' Saku_98

SakuNTCheckStart:
  IntOp $R1 $R1 + 1
  ReadRegStr $R3 HKCU "keyboard layout\preload" "$R1"
  StrCmp $R3 "" SakuNTCheckEnd
   StrCpy $R3 $R3 4
  StrCmp $R3 "E06E" 0 +2
   StrCpy $R2 $R1
  goto SakuNTCheckStart

SakuNTCheckEnd:

  StrCmp $R2 "0" 0 HaveSakuNT
   WriteRegStr HKCU "keyboard layout\preload" "$R1" "E06E0404"
  StrCmp $6 "1028" HaveSakuNT
   IntOp $R1 $R1 + 1
   WriteRegStr HKCU "keyboard layout\preload" "$R1" "E06E$7"

HaveSakuNT:
   File   ".\add-on\sakura_win2k\nsaku.IME"
   File   ".\add-on\sakura_win2k\nsaku.TBL"
   File   ".\add-on\sakura_win2k\nsakuPHR.TBL"
   File   ".\add-on\sakura_win2k\nsakuPTR.TBL"
  ; 眔╰参 Native 粂ē嘿
  System::Call 'kernel32::GetLocaleInfoA(i 1024, i 4, t .r1, i ${NSIS_MAX_STRLEN}) i r0'
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E$7" "IME file"    "NSAKU.IME"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E$7" "Layout File" "KBDUS.DLL"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E$7" "Layout Text" "$1 - Unicode Sakura"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E0404" "IME file"    "NSAKU.IME"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E0404" "Layout File" "KBDUS.DLL"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E0404" "Layout Text" "$(Sakura_layouttext_0404)"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E0804" "IME file"    "NSAKU.IME"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E0804" "Layout File" "KBDUS.DLL"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06E0804" "Layout Text" "$(Sakura_layouttext_0804)"

  Return

Saku_98:
; ***************************************************************************
;; тΤ⊿Τ杆筁腻块猭狦⊿杆筁杆Чㄖ更 preload い

Saku98CheckStart:
  EnumRegKey $R0 HKCU "keyboard layout\preload" "$R1"
  IntOp $R1 $R1 + 1
  StrCmp $R0 "" Saku98CheckEnd
   ReadRegStr $R3 HKCU "keyboard layout\preload\$R0" ""
   StrCmp $R3 "E05E0404" 0 +2
    StrCpy $R2 $R1
   goto Saku98CheckStart

Saku98CheckEnd:

  StrCmp $R2 "0" 0 +2
   WriteRegStr HKCU "keyboard layout\preload\$R1" "" "E05E0404"
; ***************************************************************************
  File   ".\add-on\sakura_win98\Sakur.TBL"
  File   ".\add-on\sakura_win98\Sakura.IME"
  File   ".\add-on\sakura_win98\SakurPHR.TBL"
  File   ".\add-on\sakura_win98\SakurPTR.TBL"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E05E0404" "IME file"    "SAKURA.IME"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E05E0404" "layout file" "kbdus.kbd"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E05E0404" "layout text" "腻"

 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
; Section "Japanese Input Method" SecJapime
 Section "$(Item3)" SecItem3

  SetOutPath $SYSDIR
StrCpy $R1 "0"
StrCpy $R2 "0"

UCJapImeChkStart:
  IntOp $R1 $R1 + 1
  ReadRegStr $R3 HKCU "keyboard layout\preload" "$R1"
  StrCmp $R3 "" UCJapImeChkEnd
  StrCpy $R3 $R3 4
  StrCmp $R3 "E06F" 0 +2
   StrCpy $R2 $R1
  goto UCJapImeChkStart

UCJapImeChkEnd:

  StrCmp $R2 "0" 0 HaveUCJapIme
   WriteRegStr HKCU "keyboard layout\preload" "$R1" "E06F0404"
  StrCmp $6 "1028" HaveUCJapIme
   IntOp $R1 $R1 + 1
   WriteRegStr HKCU "keyboard layout\preload" "$R1" "E06F$7"

HaveUCJapIme:
   File   ".\add-on\jap_win2k\newj.IME"
   File   ".\add-on\jap_win2k\newj.TBL"
   File   ".\add-on\jap_win2k\newjPHR.TBL"
   File   ".\add-on\jap_win2k\newjPTR.TBL"
  System::Call 'kernel32::GetLocaleInfoA(i 1024, i 4, t .r1, i ${NSIS_MAX_STRLEN}) i r0'
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F$7" "IME file"    "NSAKU.IME"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F$7" "Layout File" "KBDUS.DLL"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F$7" "Layout Text" "$1 - Unicode Japan"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F0404" "IME file"    "newj.IME"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F0404" "Layout File" "KBDUS.DLL"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F0404" "Layout Text" "$(Japan_layouttext_0404)"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F0804" "IME file"    "newj.IME"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F0804" "Layout File" "KBDUS.DLL"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E06F0804" "Layout Text" "$(Japan_layouttext_0804)"

 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "$(Item3ime)" SecItem3ime
 SectionIn 1
StrCpy $R1 "0"
StrCpy $R2 "0"
StrCpy $R5 "0"

MSIMEChkStart:
  IntOp $R1 $R1 + 1
  ReadRegStr $R3 HKCU "keyboard layout\preload" "$R1"
  StrCmp $R3 "" MSIMEChkEnd
   StrCpy $R4 $R3 1
  StrCmp $R4 "E" 0 MSIMEChkStart
  StrCmp $R3 "E0010411" 0 MSIMEChkNext
   StrCpy $R2 $R1
   goto MSIMEChkStart

MSIMEChkNext:
  ReadRegStr $R4 HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\$R3" "Ime File"
  StrCmp $R4 "" MSIMEChkStart
   StrCmp $R6 '2k' +2
    StrCmp $R4 "imjp81.ime" MSIMEChked MSIMEChkStart
   StrCmp $R4 "imejp.ime" 0 MSIMEChkStart

MSIMEChked:
  StrCpy $R5 $R3
  StrCpy $R4 $R1
  goto MSIMEChkStart

MSIMEChkEnd:

  StrCmp $R2 "0" 0 +3
   WriteRegStr HKCU "keyboard layout\preload" "$R1" "E0010411"
   IntOP $R1 $R1 + 1

  StrCmp $7 "0411" 0 +2
   return
  StrCmp $R5 "0" +2
   return
  WriteRegStr HKCU "keyboard layout\preload" "$R1" "E051$7"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E051$7" "Layout File" "Kbdjpn.dll"

  StrCmp $R6 "2k" +4
   WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E051$7" "IME file"    "imjp81.ime"
   WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E051$7" "Layout Text" "Japanese Input System (MS-IME2002)"
   return
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E051$7" "IME file"    "imejp.ime"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E051$7" "Layout Text" "Japanese Input System (MS-IME2000)"

 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "$(Item4)" SecItem4
  SectionIn 1 2
  SetOutPath $INSTDIR
   File   ".\Add-ON\UcFileRenamer.exe"
   File   ".\Add-ON\Unicows.dll"
   File   ".\Add-ON\uc-o2n.tbl"

   StrCmp $R6 '98' +3
    StrCmp $6 '1028' 0 +2
     ExecShell open '$INSTDIR\UcFileRenamer.exe' SW_SHOWMAXIMIZED
   IfFileExists "$INSTDIR\CONVJPN.EXE" 0 +2
    delete /rebootok "$INSTDIR\CONVJPN.EXE"

 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "$(Item5)" SecItem5
  SectionIn 1 2
   File  /oname=$INSTDIR\converter.html ".\434but\converter.html"
 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "$(Item6)" SecItem6
  SectionIn 1
   File /oname=$INSTDIR\unicode_at_on.jpg ".\434but\unicode_at_on.jpg"
 WriteRegStr       HKCU "Software\Microsoft\Internet Explorer\Desktop\General" "TileWallpaper"  "0"
 WriteRegStr       HKCU "Software\Microsoft\Internet Explorer\Desktop\General" "WallpaperStyle" "2"

StrCmp $R6 '98' +5
StrCmp $R6 '2k' +4
 WriteRegDWORD     HKCU "Software\Microsoft\Internet Explorer\Desktop\General" "ComponentsPositioned" "1"
 WriteRegExpandStr HKCU "Software\Microsoft\Internet Explorer\Desktop\General" "Wallpaper" "$INSTDIR\unicode_at_on.jpg"
 Return
WriteRegStr       HKCU "Software\Microsoft\Internet Explorer\Desktop\General" "ComponentsPositioned" "1"
WriteRegStr       HKCU "Software\Microsoft\Internet Explorer\Desktop\General" "Wallpaper" "$INSTDIR\unicode_at_on.jpg"

 SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;==============================
; 6.4 秨﹍匡虫
;

Section "$(Item7)" SecItem7
  SectionIn 1
 CreateDirectory "$SMPROGRAMS\${My_PRODUCT}"
 CreateShortCut "$(SC1)" "$INSTDIR\Uninstall.exe"
 CreateShortCut "$(SC2)" "$INSTDIR\$(FILENAME_README)"
 CreateShortCut "$(SC3)" "$INSTDIR\$(FILENAME_history)"

 StrCmp $R6 '98' +3
 StrCmp $6 '1028' 0 +2
  CreateShortCut "$(SC4)" "$INSTDIR\UcFileRenamer.exe"
 CreateShortCut "$(SC5)" "$INSTDIR\website.url"
 CreateShortCut "$(SC6)" "$INSTDIR\forum.url"
 CreateShortCut "$(SC7)" "$INSTDIR\testjap.url"
 CreateShortCut "$(SC8)" "$INSTDIR\testsimp.url"
 CreateShortCut "$(SC9)" "$INSTDIR\converter.html"
SectionEnd
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;=======================================================
; 〗7.糶秆埃杆祘Α
;=======================================================
; 狦尔び螟ぃ糶秆埃杆祘Α场 remark 奔

;==============================
; 7.1 竊琿秨﹍

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Section "$(Item8)" SecItem8
  SectionIn 1 2 RO

;==============================
; 7.2 糶爹(膀娄)
;
; Τ糶硂琿﹚杆ヘ魁

  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "Install_Dir" "$INSTDIR"

;==============================
; 7.3 糶爹 (* 秈顶)
;
; 硂琿爹琌 {北 | 穝糤簿埃祘Α] 玁ノ
; 狦ぃ来场ぃㄏノ
; 把σ  http://leoboard.cpatch.org/cgi-bin/topic.cgi?forum=2&topic=24&show=0

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "DisplayIcon" "$INSTDIR\${PROGMAINEXE}"       ; ㄏノ硂篈Τ MDaemon ㄒ
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "DisplayName" "${My_PRODUCT} (BIG5 Extension) ${My_Version}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}"  \
   "DisplayVersion" "${My_Version}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "UninstallString" "$INSTDIR\uninstall.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "URLInfoAbout" "${URLABOUT}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "Contact" "witchfive@cpatch.org, but@cpatch.org, kiiali@cpatch.org"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "HelpLink" "${URLHELP}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "URLUpdateInfo" "${URLUPDATE}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "Readme" "file:///$INSTDIR/${MyFileName}.txt"

;==============================
; 7.4 ㄌ酚贺粂ē笆糶ぃ爹 (* 秈顶)
; 珹 ENU/CHT/CHS
; ;------------------------------------------

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" "Comments" "$(REGMUI1)"

;==============================
; 7.5 ㄌ酚贺粂ē笆糶ぃ爹 (* 秈顶)
; 珹 ENU/CHT/CHS
; ;------------------------------------------

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" "Publisher" "$(REGMUI2) (c) ${Publisher}"

;==============================
; 7.6 瞷糶秆埃杆祘Α

; 糶粂ē嘿爹 (ノ秆埃杆祘Α)
  WriteRegStr HKLM "Software\${My_PRODUCT}" "Installer Language" $LANGUAGE
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "CP" $R7
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "OS" $R6
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "SysLang" $6
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ; 砞﹚笆秨诀篨夹NSIS 穦高拜ㄏノ琌腀種穝秨诀
; SetRebootFlag True

;    MessageBox MB_YESNO|MB_ICONQUESTION  "$(MSG_POSTINST)" IDNO No_reboot
;reboot
; No_reboot:

  MessageBox MB_OK|MB_ICONEXCLAMATION "$(MSG_POSTINST)"

SectionEnd


;==============================
; 7.8 陪ボЧΘ夹繷

;狦ぃ稱ㄏノЧΘ硂エ栋ぇ础

;!insertmacro MUI_SECTIONS_FINISHHEADER

;=======================================================
; 〗8.磞瓃
;=======================================================

;==============================
; 8.1 磞瓃エ栋 (* 秈顶)
;
; 狦Τ磞瓃程エ栋
; 硂琿璶┮Τ section ぇ玥穦瞷跑计嘿⊿Τт
; 狦 MUI_FUNCTION_DESCRIPTION_BEGIN ╊Θㄢ琿穦跑Θ滦㊣τ旧璓岿粇

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem1}  $(DESC_SecItem1)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem2}  $(DESC_SecItem2)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem2eudc}  $(DESC_SecItem2eudc)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem3}  $(DESC_SecItem3)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem3ime}  $(DESC_SecItem3ime)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem4}  $(DESC_SecItem4)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem5}  $(DESC_SecItem5)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem6}  $(DESC_SecItem6)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem7}  $(DESC_SecItem7)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecItem8}  $(DESC_SecItem8)

!insertmacro MUI_FUNCTION_DESCRIPTION_END

;==============================
; 8.2 –竊琿磞瓃ゅ钡ㄏノ瓣粂ē (* 秈顶)
;
; 硂琌琵菲公簿笆杆兜ヘ笆瞷磞瓃
; иㄏノ ENU/CHT/CHS 粂ē狦尔陈沸ㄏノ粂ēぃㄏノ磞瓃

 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_ENGLISH}     "The installer is already running."
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_TRADCHINESE} "杆祘Αタ磅︽"
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_SIMPCHINESE} "安装程序已正在运行"
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_JAPANESE}    "僀儞僗僩乕儔偑幚峴偟偰偄傑偡丅"

 LangString MyCaption ${LANG_ENGLISH}     "Unicode-At-on (BIG5 Extension)"
 LangString MyCaption ${LANG_TRADCHINESE} "Unicode 干Ч璸礶"
 LangString MyCaption ${LANG_SIMPCHINESE} "Unicode 补完计画"
 LangString MyCaption ${LANG_JAPANESE}    "Unicode 曗姰寁夋"
 LicenseLangString MyLicenseData ${LANG_ENGLISH}     "license-enu.rtf"
 LicenseLangString MyLicenseData ${LANG_SIMPCHINESE} "license-chs.rtf"
 LicenseLangString MyLicenseData ${LANG_TRADCHINESE} "license-cht.rtf"
 LicenseLangString MyLicenseData ${LANG_JAPANESE}    "license-jap.rtf"

  LangString MSG_NT_PREINST1 ${LANG_ENGLISH}        "(1) Make sure you are login as an Administrator privilege.  $\n$\n(2) Close the programs to prevent NLS locking by system.  If popup an message cannot write, please press [Ignore]$\n$\n(3) The installer will popup a Janapese charactor rename programs, please execute it directly.   If you executed the program before, just close it.$\n$\n(4) Finish setup and reboot your compute."
  LangString MSG_NT_PREINST1 ${LANG_TRADCHINESE}    "(1) 絋粄局Τ Administrator 舦$\n$\n(2) 叫闽超ㄤ┮Τ祘Α磷 NLS 郎綝╰参玛﹚窾铬礚猭糶叫钡 [Ignore] $\n$\n(3) 杆祘Α穦铬らゅ郎穝祘Α叫钡磅︽狦竒磅︽筁钡闽超赣祘Α$\n$\n(4) 杆Ч穝秨诀碞ЧΘ"
  LangString MSG_NT_PREINST1 ${LANG_SIMPCHINESE}    "(1) 已确认您拥有 Administrator 权限$\n$\n(2) 请关闭其他所有程序，以避免 NLS 文件遭系统锁定。万一弹出「无法写入」，请直接按 [Ignore] 即可。$\n$\n(3) 安装完重新开机后，就完成了。"
; LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) 娗棟幰尃尷傪傕偭偰偄傞偙偲傪妋擣偟偰偔偩偝偄丅$\n$\n(2) 乽NLS 僼傽僀儖乿偑僔僗僥儉偵儘僢僋偝傟側偄傛偆偵丄懠偺傾僾儕働乕僔儑儞傪堦扷廔椆偟偰壓偝偄丅乽仛柍朄泹擖仛乿偲昞帵偝傟傑偟偨傜丄 [仛Ignore仛] 傪捈愙僋儕僢僋偡傞偩偗偱寢峔偱偡丅$\n$\n(3) 僀儞僗僩乕儖偑廔椆偟丄嵞婲摦偡傟偽姰惉偱偡丅"
; LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) Administrator 尃尷偑昁梫偱偡丅妋擣偟偰偔偩偝偄丅$\n$\n(2) 幚峴拞偺偡傋偰偺僂傿儞僪乕傪暵傔偰偔偩偝偄丅 NLS 僼傽僀儖偑儘僢僋偝傟傞尨場偲側傝傑偡丅乽彂偒崬傒僄儔乕乿偑婲偙傞応崌丄 [Ignore] 偱拞抐偟偰偔偩偝偄丅$\n$\n(3) 僀儞僗僩乕儖偑廔傢偭偨傜丄僔僗僥儉傪嵞婲摦偟偰偔偩偝偄丅"
  LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) Administrator 尃尷傪傕偭偰偄傞偙偲傪妋擣偟偰偔偩偝偄丅$\n$\n(2) 乽NLS 僼傽僀儖乿偑僔僗僥儉偵儘僢僋偝傟側偄傛偆偵丄懠偺傾僾儕働乕僔儑儞傪堦扷廔椆偟偰壓偝偄丅乽彂偒崬傒僄儔乕乿偲昞帵偝傟傑偟偨傜丄 [Ignore] 傪捈愙僋儕僢僋偡傞偩偗偱寢峔偱偡丅$\n$\n(3) 僀儞僗僩乕儖偑廔椆偟丄嵞婲摦偡傟偽姰惉偱偡丅"
  LangString MSG_9X_PREINST1 ${LANG_ENGLISH}        "This version will change the BIG5 mapping table, will affect Japanese charactor and EUDC font filename in you harddisk.  Please go to our forum to review detail explanation.  You need to take full responsibilities at your own risk.$\n$\nDue to Win98 OS limitation (Win2k no problem), solution need add-on steps.   $\n$\n(1) Install ChinaSea FontSet  $\n(2) change Win98 MingLiU (v2.10) to Win2k version (v3.21) for fulfilling unicode display.  $\n$\nTech details, read cpatch forum. http://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_TRADCHINESE}    "セセ穦笆郎╰参 BIG5 癸莱穦紇臫祑盒柑らゅ郎叫セ硁砰癚阶跋把赣拜肈冈灿弧癸赣拜肈璽ち砫ヴ杆$\n$\nパ Win98 OS  (2k 礚拜肈)秆∕よㄇ˙艼$\n$\n(1) 膥尿杆い瓣栋$\n(2) も笆传侣硑郎夹非 Unicode 郎$\n(3) も笆传 Win98 MingLiU.TTC (v2.10)  win2k セ (v3.21)Unicode 栋陪ボ穦Ч称簘獹翅$\n$\nм砃灿竊ǎ cpatch いゅて盡穨阶韭$\nhttp://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_SIMPCHINESE}    "由于 Win98 OS 限制 (2k 无此问题)，解决方案多一些步骤： $\n$\n手工更换 Win98 MingLiu.TTC (v2.10) 为 win2k 版本 (v3.21)，Unicode 字符集显示会更完备漂亮喔。$\n$\n技术细节，见 cpatch 中文化专业论坛。$\nhttp://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_JAPANESE}       "Win98 OS 偺惂尷 (2k 偱偼偙偺栤戣偼偁傝傑偣傫)偵傛傝丄懳張朄偺庤弴偼彮偟懡偄偱偡丗$\n$\nWin98 偺 MingLiU.TTC (v2.10) 傪 win2k 斉 (v3.21) 偺偱擖傟姺偊傞帠偱丄Unicode 暥帤僐乕僪偑傛傝偒傟偄偵昞帵偟傑偡傛丅$\n$\n媄弍偵偮偄偰偺徻嵶忣曬偼丄乽CPatch 拞崙岅壔愱栧宖帵斅乿偱妋擣偡傞帠偑弌棃傑偡丅$\nhttp://leoboard.cpatch.org"

  LangString MSG_NO_IEPKTW_checked ${LANG_ENGLISH}        "Warning!!  You don't have any Tradition-Chinese Fonts!  Please install M$$-IE Traditional Chinese Suppliment first."
  LangString MSG_NO_IEPKTW_checked ${LANG_TRADCHINESE}    "牡⊿Τヴノ羉砰いゅ叫杆 IE 羉砰いゅや穿"
  LangString MSG_NO_IEPKTW_checked ${LANG_SIMPCHINESE}    "警告！你没有任何用于「繁体中文」的字体！请先安装 IE 的「繁体中文支持」。"
  LangString MSG_NO_IEPKTW_checked ${LANG_JAPANESE}       "拲堄両乽斏閾帤拞崙岅乿偺僼僅儞僩偑僀儞僗僩乕儖偟偰偄傑偣傫両愭偵 IE 偺乽斏懱帤拞崙岅僒億乕僩乿傪僀儞僗僩乕儖偟偰偔偩偝偄丅"

  LangString MSG_NS_OS_checked ${LANG_ENGLISH}        "Installer has detected your OS as Win95/NT or Unknown.  It cannot install Unicode-at-on."
  LangString MSG_NS_OS_checked ${LANG_TRADCHINESE}    "杆祘Α盎代穨╰参琌 Win95/NT or Unknown礚猭杆 Unicode 干Ч璸礶"
  LangString MSG_NS_OS_checked ${LANG_SIMPCHINESE}    "安装程序已检测到你的操作系统是 Win95/NT or Unknown。无法安装 Unicode 补完计画。"
  LangString MSG_NS_OS_checked ${LANG_JAPANESE}       "偙偺僷僜僐儞偺僆儁儗乕僥傿儞僌僔僗僥儉偼 Win95/NT 偐晄柧偱偁傞偙偲傪専弌偝傟傑偟偨丅乽Unicode 曗姰寁夋乿傪僀儞僗僩乕儖偡傞偙偲偑弌棃傑偣傫丅"
; LangString MSG_NS_OS_checked ${LANG_JAPANESE}       "偁側偨偺OS偼 Win95/NT 偱偡丅 Unicode 曗姰寁夋偼偙偺僶乕僕儑儞偺OS傪僒億乕僩偟偰偄傑偣傫丅"

  LangString MSG_ME_SFP_checked ${LANG_ENGLISH}       "Installer has detected your OS as WinME$\n$\nPlease make sure that you have removed (System File Protection) & (System Restore), otherwise Unicode-At-On should INSTALL FAILED. $\n$\nPress [OK] to continue install, $\nPress [Cancel] to open related webpage links and exit installer."
  LangString MSG_ME_SFP_checked ${LANG_TRADCHINESE}   "杆祘Α盎代穨╰参琌 WinME$\n$\n叫絋﹚Τㄆ簿埃╰参郎玂臔 (System File Protection)&╰参临 (System Restore)玥Unicode 干Ч璸礶﹚穦杆ア毖$\n$\n [絋﹚] 膥尿杆$\n [] 秨币闽呼硈挡瞒秨杆祘Α"
  LangString MSG_ME_SFP_checked ${LANG_SIMPCHINESE}   "安装程序已检测到你的操作系统是 WinME。$\n$\n请确定你有事先移除「系统文件保护壳 (System File Protection)」&「系统恢复 (System File Protection)」，否则「Unicode 补完计画」一定会「安装失败」。$\n$\n按下 [确定] 继续安装。$\n按下 [取消] 打开相关网页链接，并退出安装程序。"
  LangString MSG_ME_SFP_checked ${LANG_JAPANESE}      "偙偺僷僜僐儞偺僆儁儗乕僥傿儞僌僔僗僥儉偼 WinME 偱偁傞偙偲傪専弌偝傟傑偟偨丅$\n$\n乽僔僗僥儉 僼傽僀儖 曐岇婡擻 (System File Protection)乿&乽僔僗僥儉 暅尦 (System Restore)乿偑奜偝傟偰偄傞偙偲傪偛妋擣偔偩偝偄丄偱側偄偲乽Unicode 曗姰寁醏乿偺僀儞僗僩乕儖偼昁偢幐攕偟傑偡丅$\n$\n[OK] 傪僋儕僢僋偟偰師傊丅$\n[僉儍儞僙儖] 傪僋儕僢僋偟偰娭楢儁乕僕偺儕儞僋傊堏摦偟丄僀儞僗僩儗乕僔儑儞偑廔椆偟傑偡丅"
; LangString MSG_ME_SFP_checked ${LANG_JAPANESE}      "偁側偨偺 OS 偼 WinME 偱偡丅$\n$\n乽System File Protection乿&乽System Restore乿偲偄偆婡擻偼嶍彍偟側偄偲丄Unicode 曗姰寁夋偼惓忢偵僀儞僗僩乕儖偡傞偺偼偱偒傑偣傫丅$\n$\n[OK] 偱僀儞僗僩乕儖嵞奐偟傑偡丅$\n [僉儍儞僙儖] 偱僀儞僗僩乕儖傪廔椆偟傑偡丅"

  LangString MSG_OLD_Mingliu_checked ${LANG_ENGLISH}     "Installer has detected your MINGLIU.TTC is old version not contained Japanese katagana. Please update MINGLIU.TTC, at leaset WinME and above version MINGLIU.TTC will have Japanese katagana.$\n$\nPress [OK] to continue install."
  LangString MSG_OLD_Mingliu_checked ${LANG_TRADCHINESE} "杆祘Α盎代灿砰琌ぃらゅ安侣セ叫﹚璶穝灿砰ぶ璶 WinME セ灿砰Τらゅ安$\n$\n絋﹚膥尿杆"
  LangString MSG_OLD_Mingliu_checked ${LANG_SIMPCHINESE} "安装程序已检测到你的「MingLiu.TTC」是不含「日文假名」的旧版本，请你一定要更新「MingLiu.TTC」，至少要 WinME 以上版本的「MingLiu.TTC」才有「日文假名」。$\n$\n按下「确定」继续安装。"
  LangString MSG_OLD_Mingliu_checked ${LANG_JAPANESE}    "偁側偨偺乽嵶柧閾乮Mingliu丟拞崙岅僼僅儞僩乯乿偼乽壖柤乿偑側偄僶乕僕儑儞偱偡丅昁偢乽嵶柧閾乿傪傾僢僾僨乕僩偟偰偔偩偝偄丅$\n$\n乽OK乿偱僀儞僗僩乕儖嵞奐偟傑偡丅"

  LangString MSG_OLD_Kaiu_checked ${LANG_ENGLISH}        "Installer has detected your KAIU.TTF is old version not contained Japanese katagana. Please update KAIU.TTF, at leaset WinME and above version KAIU.TTF will have Japanese katagana.$\n$\nPress [OK] to continue install."
  LangString MSG_OLD_Kaiu_checked ${LANG_TRADCHINESE}    "杆祘Α盎代夹发砰琌ぃらゅ安侣セ叫﹚璶穝夹发砰ぶ璶 WinME セ夹发砰Τらゅ安$\n$\n絋﹚膥尿杆"
  LangString MSG_OLD_Kaiu_checked ${LANG_SIMPCHINESE}    "安装程序已检测到你的「Kaiu.TTF」是不含「日文假名」的旧版本，请你一定要更新「Kaiu.TTF」，至少要 WinME 以上版本的「Kaiu.TTF」才有「日文假名」。$\n$\n按下「确定」继续安装。"
  LangString MSG_OLD_Kaiu_checked ${LANG_JAPANESE}       "偁側偨偺乽昗灢閾乮Kaiu丟拞崙岅僼僅儞僩乯乿偼乽壖柤乿偑側偄僶乕僕儑儞偱偡丅昁偢乽昗灢閾乿傪傾僢僾僨乕僩偟偰偔偩偝偄丅$\n$\n乽OK乿偱僀儞僗僩乕儖嵞奐偟傑偡丅"

  LangString MSG_Admin_checked ${LANG_ENGLISH}      "You are has no System Administrator privilege. You can not continue install."
  LangString MSG_Admin_checked ${LANG_TRADCHINESE}  "ぃㄣΤ╰参恨瞶舦礚猭膥尿杆"
  LangString MSG_Admin_checked ${LANG_SIMPCHINESE}  "你不具有「系统管理员」权限，无法继续安装。"
  LangString MSG_Admin_checked ${LANG_JAPANESE}     "偁側偨偼乽Administrator乿尃尷偑帩偭偰偄傑偣傫偐傜丄僀儞僗僩乕儖偱偒傑偣傫丅"

  LangString REGMUI1 ${LANG_ENGLISH}     "Chinese (P.R.C.) and Chinese (Taiwan) ${My_PRODUCT} localized version by Kii Ali. Unicode At-on (Big5 Extension) with a method my mapping unicode/ansi, extend old BIG5 system compatibilities, and increase the number 2 bytes charactor for display and printing.  Solving problem on Disply and Printing in: Japanese charactor, Simplified Charactor, and China-Sea Charactor."
  LangString REGMUI1 ${LANG_TRADCHINESE} "いゅ (い瓣嘲) 籔 いゅ (籓芖) ${My_PRODUCT} セてセパ Kii Ali 籹 Unicode 干Ч璸礶 (Big5 Extension)  unicode/ansi 癸莱よΑ (τ獶硑よΑ) 耎侣 BIG5 贺╰参甧籔糤陪ボ籔 2 じじ秆∕籔陪ボ拜肈: らゅ安キ安虏砰いゅのい瓣栋"
  LangString REGMUI1 ${LANG_SIMPCHINESE} "中文 (中国大陆) 与 中文 (台湾) ${My_PRODUCT} 本地化版本，由 Kii Ali 制作。 Unicode 补完计画 (Big5 Extension) 以 unicode/ansi 映射的方式 (而非造字方式) ，扩充旧的 BIG5 在各种系统的兼容度，与增加可显示与打印的 2 位元字符。并解决以下的打印与显示问题: 日文片假名平假名、简体中文、以及中国海字符集。"
  LangString REGMUI1 ${LANG_JAPANESE}    "${My_PRODUCT} 擔杮岅僶乕僕儑儞丅 Unicode 曗姰寁夋 (Big5 Extension) 偼丄儐僯僐乕僪偲BIG5僐乕僪偺儅僢僺儞僌傪挷惍偡傞曽朄傪巊偭偰偍傝丄捠忢偺奜帤曽幃偲偼堘偆峫偊偱偁傝傑偡丅 Unicode 曗姰寁夋傪僀儞僗僩乕儖偡傞偲丄擔杮岅偺OS偱傕丄BIG5僐乕僪偺壖柤傪尒傞偙偲偑偱偒傞傛偆偵側傝傑偡丅"

  LangString REGMUI2 ${LANG_ENGLISH}     "Copyright"
  LangString REGMUI2 ${LANG_TRADCHINESE} "舦┮Τ"
  LangString REGMUI2 ${LANG_SIMPCHINESE} "版权所有"
  LangString REGMUI2 ${LANG_JAPANESE}    "挊嶌尃桳傝"

; LangString MSG_POSTINST ${LANG_ENGLISH}        "You need to REBOOT to make effect of installation.  Press [Yes] to restart immediately, [No] to restart later manually."
; LangString MSG_POSTINST ${LANG_TRADCHINESE}    "惠璶穝币笆獽ㄏ杆ネ [Yes] ミ穝币笆[No] 祔︽穝币笆"
; LangString MSG_POSTINST ${LANG_SIMPCHINESE}    "你需要重新启动，以便使安装生效。按下 [Yes] 立即重新启动。[No] 稍后再自行重新启动。"
; LangString MSG_POSTINST ${LANG_JAPANESE}       "Unicode 曗姰寁夋傪岠偐偣傞偵偼丄嵞婲摦偟側偗傟偽側傝傑偣傫丅 [Yes] 傪僋儕僢僋偟偰嵞婲摦偟傑偡丅 [No] 傪僋儕僢僋偟偰傕丄屻偱嵞婲摦偟偰偔偩偝偄丅"
  LangString MSG_POSTINST ${LANG_ENGLISH}        "You need to REBOOT to make effect of installation.$\n$\nRestart later manually, please."
  LangString MSG_POSTINST ${LANG_TRADCHINESE}    "惠璶穝币笆獽ㄏ杆ネ$\n$\n叫︽穝币笆"
  LangString MSG_POSTINST ${LANG_SIMPCHINESE}    "你需要重新启动，以便使安装生效。$\n$\n请自行重新启动。"
  LangString MSG_POSTINST ${LANG_JAPANESE}       "Unicode 曗姰寁夋傪岠偐偣傞偵偼丄嵞婲摦偟側偗傟偽側傝傑偣傫丅$\n$\n屻偱嵞婲摦偟偰偔偩偝偄丅"
  LangString un.MSG_POSTINST ${LANG_ENGLISH}     "You need to REBOOT to make effect of uninstallation.  Press [Yes] to restart immediately, [No] to restart later manually."
  LangString un.MSG_POSTINST ${LANG_TRADCHINESE} "惠璶穝币笆獽ㄏ秆埃杆ネ [Yes] ミ穝币笆[No] 祔︽穝币笆"
  LangString un.MSG_POSTINST ${LANG_SIMPCHINESE} "你需要重新启动，以便使解除安装生效。按下 [Yes] 立即重新启动。[No] 稍后再自行重新启动。"
  LangString un.MSG_POSTINST ${LANG_JAPANESE}    "傾儞僀儞僗僩乕儖傪岠偐偣傞偵偼丄嵞婲摦偟側偗傟偽側傝傑偣傫丅 [Yes] 傪僋儕僢僋偟偰嵞婲摦偟傑偡丅 [No] 傪僋儕僢僋偟偰傕丄屻偱嵞婲摦偟偰偔偩偝偄丅"

  LangString FILENAME_README  ${LANG_ENGLISH}     "${MyFileName}.txt"
  LangString FILENAME_README  ${LANG_TRADCHINESE} "${MyFileName}.txt"
  LangString FILENAME_README  ${LANG_SIMPCHINESE} "${MyFileName}_gb.txt"
  LangString FILENAME_README  ${LANG_JAPANESE}    "${MyFileName}.txt"
  LangString FILENAME_history ${LANG_ENGLISH}     "history.txt"
  LangString FILENAME_history ${LANG_TRADCHINESE} "history.txt"
  LangString FILENAME_history ${LANG_SIMPCHINESE} "history_gb.txt"
  LangString FILENAME_history ${LANG_JAPANESE}    "history.txt"

  LangString Sakura_layouttext_0404 ${LANG_ENGLISH}     "Chinese (Traditional) - Unicode Sakura"
  LangString Sakura_layouttext_0404 ${LANG_TRADCHINESE} "いゅ (羉砰) - Unicode 腻"
  LangString Sakura_layouttext_0404 ${LANG_SIMPCHINESE} "中文 (繁体) - Unicode 樱花"
  LangString Sakura_layouttext_0404 ${LANG_JAPANESE}    "斏閾帤拞崙岅 - Unicode 嶗壴"
  LangString Sakura_layouttext_0804 ${LANG_ENGLISH}     "Chinese (Simplified) - Unicode Sakura"
  LangString Sakura_layouttext_0804 ${LANG_TRADCHINESE} "いゅ (虏蔨) - Unicode 腻"
  LangString Sakura_layouttext_0804 ${LANG_SIMPCHINESE} "中文 (简体) - Unicode 樱花"
  LangString Sakura_layouttext_0804 ${LANG_JAPANESE}    "娙懱帤拞崙岅 - Unicode 嶗壴"

  LangString Japan_layouttext_0404 ${LANG_ENGLISH}     "Chinese (Traditional) - Unicode Japan"
  LangString Japan_layouttext_0404 ${LANG_TRADCHINESE} "いゅ (羉砰) - Unicode らゅ"
  LangString Japan_layouttext_0404 ${LANG_SIMPCHINESE} "中文 (繁体) - Unicode 日文"
  LangString Japan_layouttext_0404 ${LANG_JAPANESE}    "斏閾帤拞崙岅 - Unicode 擔杮岅壖柤"
  LangString Japan_layouttext_0804 ${LANG_ENGLISH}     "Chinese (Simplified) - Unicode Japan"
  LangString Japan_layouttext_0804 ${LANG_TRADCHINESE} "いゅ (虏蔨) - Unicode らゅ"
  LangString Japan_layouttext_0804 ${LANG_SIMPCHINESE} "中文 (简体) - Unicode 日文"
  LangString Japan_layouttext_0804 ${LANG_JAPANESE}    "娙懱帤拞崙岅 - Unicode 擔杮岅壖柤"

; LangString Lock950 ${LANG_ENGLISH}     "Warning:$\n======$\nYour C_950.nls was locked by OS with unknown reason.$\n$\nYou need to reboot twice to make Unicode-at-on take effect."
; LangString Lock950 ${LANG_TRADCHINESE} "牡$\n======$\nぃ C_950.nls 綝╰参玛﹚$\n$\n惠璶硈尿穝秨诀ㄢΩUnicode 干Ч璸购穦ネ"
; LangString Lock950 ${LANG_SIMPCHINESE} "警告：$\n======$\n因为不明原因，你的 C_950.nls 已遭系统锁定！$\n$\n你需要连续重新开机两次，Unicode 补完计划才会生效。"
; LangString Lock950 ${LANG_JAPANESE}    "拲堄丗$\n======$\n晄柧偺尨場偱丆 C_950.nls 偼僔僗僥儉偵儘僢僋偝傟傑偟偨両$\n$\nUnicode 曗姰寁夋傪岠偐偣傞偵偼丄 OS 傪乽2夞乿嵞婲摦偟側偗傟偽側傝傑偣傫丅"

; LangString Lock950un ${LANG_ENGLISH}     "Warning:$\n======$\nYour C_950.nls was locked by OS with unknown reason.$\n$\nYou need to reboot twice to make Unicode-at-on uninstallation."
; LangString Lock950un ${LANG_TRADCHINESE} "牡$\n======$\nぃ C_950.nls 綝╰参玛﹚$\n$\n惠璶硈尿穝秨诀ㄢΩЧΘ簿埃"
; LangString Lock950un ${LANG_SIMPCHINESE} "警告：$\n======$\n因为不明原因，你的 C_950.nls 已遭系统锁定！$\n$\n你需要连续重新开机两次，才能完成移除。"
; LangString Lock950un ${LANG_JAPANESE}    "拲堄丗$\n======$\n晄柧偺尨場偱丆 C_950.nls 偼僔僗僥儉偵儘僢僋偝傟傑偟偨両$\n$\n傾儞僀儞僗僩乕儖傪岠偐偣傞偵偼丄 OS 傪乽2夞乿嵞婲摦偟側偗傟偽側傝傑偣傫丅"

  LangString GetAnotherOne ${LANG_ENGLISH}     "Waringing:$\n======$\n    Because the other OS (98/me ┪ 2k/xp/2k3) on this computer has already installed Unicode-at-on, the directory cannot be removed.$\n$\nPS: When uninstall unicode-at-on on the other OS, the directory will be removed."
  LangString GetAnotherOne ${LANG_TRADCHINESE} "牡$\n======$\n    筿福╰参 (98/me ┪ 2k/xp/2k3) Τ杆 unicode 干Ч璸购┮ヘ魁礚猭簿埃$\n$\nPS: 讽╰参 unicode 干Ч璸购簿埃ヘ魁穦ㄖ簿埃"
  LangString GetAnotherOne ${LANG_SIMPCHINESE} "警告：$\n======$\n    因为你此台计算机的另一系统 (98/me 或 2k/xp/2k3) 也有装 unicode 补完计划，所以此目录无法移除。$\n$\nPS: 当你另一系统上的 unicode 补完计划移除时，此目录才会一并移除。"
  LangString GetAnotherOne ${LANG_JAPANESE}    "拲堄丗$\n======$\n    偙偺僐儞僺儏乕僞偺傎偐偺OS (98/me 偐 2k/xp/2k3) 傕 Unicode 曗姰寁夋傪僀儞僗僩乕儖偟偰偄傑偡偺偱丄僼僅儖僟偼嶍彍偝傟偰偄傑偣傫丅$\n$\nPS: 偦偺OS偺 Unicode 曗姰寁夋傕僀儞僗僩乕儖偝傟傞嵺偵丆僼僅儖僟偼嶍彍偟傑偡丅"

  LangString DESC_InstTypeMinimum ${LANG_ENGLISH}     "Minimum Installation"
  LangString DESC_InstTypeStandard ${LANG_ENGLISH}    "Standard Installation"

  LangString Item1 ${LANG_ENGLISH}     "Unicode At-on main component"
  LangString Item2 ${LANG_ENGLISH}     "Sakura IME"
  LangString Item2eudc ${LANG_ENGLISH} "EUDC"
  LangString Item3 ${LANG_ENGLISH}     "Unicode Japanese IME"
  LangString Item3ime ${LANG_ENGLISH}  "MS Japanese IME"
  LangString Item4 ${LANG_ENGLISH}     "Japanese kana filename converter"
  LangString Item5 ${LANG_ENGLISH}     "Unicode Ref code expression tool"
  LangString Item6 ${LANG_ENGLISH}     "Desktop wallpaper"
  LangString Item7 ${LANG_ENGLISH}     "Add shourtcut to StartMenu"
  LangString Item8 ${LANG_ENGLISH}     "Create Uninstaller"

  LangString DESC_SecItem1 ${LANG_ENGLISH}     "BIG5 charactor Extension!!  No more missing charactor, empty display, ramma"
  LangString DESC_SecItem2 ${LANG_ENGLISH}     "for you to input Japanese Kana"
  LangString DESC_SecItem2eudc ${LANG_ENGLISH} "for supplying the charactors not in MINGLIU$\n$\nNote:$\n1)If you have already installed China-SEA , please cancel this operation.$\n2)Win2k/xp/2k3 cannot install this item."
  LangString DESC_SecItem3 ${LANG_ENGLISH}     "Same as sakura, but less duplicated code, suitable for familiar Japanese text"
  LangString DESC_SecItem3ime ${LANG_ENGLISH}  "Microsoft Japanese IME."
  LangString DESC_SecItem4 ${LANG_ENGLISH}     "Convert old EUDC filename to new Unicode filename"
  LangString DESC_SecItem5 ${LANG_ENGLISH}     "Compatibilities for paste Unicode expresion code"
  LangString DESC_SecItem6 ${LANG_ENGLISH}     "Recommand to Install this wallpaper, need enable Active Desktop"
  LangString DESC_SecItem7 ${LANG_ENGLISH}  "Add shourtcut to StartMenu"
  LangString DESC_SecItem8 ${LANG_ENGLISH}     "Create Uninstaller"

  LangString SC1   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Uninstall Unicode at-on.lnk"
  LangString SC2   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Readme.lnk"
  LangString SC3   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\history.lnk"
  LangString SC4   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Japanese Kana filename Converter.lnk"
  LangString SC5   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Unicode at-on Homepage.lnk"
  LangString SC6   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Unicode at-on Forum.lnk"
  LangString SC7   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Test page - Japanese Kana.lnk"
  LangString SC8   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Test page - Simplified Chinese.lnk"
  LangString SC9   ${LANG_ENGLISH}     "$SMPROGRAMS\${My_PRODUCT}\Unicode ref expression tool.lnk"

  LangString DESC_InstTypeMinimum ${LANG_TRADCHINESE} "程杆"
  LangString DESC_InstTypeStandard ${LANG_TRADCHINESE} "夹非杆"

  LangString Item1 ${LANG_TRADCHINESE} "Unicode 干Ч璸礶み"
  LangString Item2 ${LANG_TRADCHINESE} "腻块猭"
  LangString Item2eudc ${LANG_TRADCHINESE} "干硑郎"
  LangString Item3 ${LANG_TRADCHINESE} "Unicode らゅ块猭"
  LangString Item3ime ${LANG_TRADCHINESE} "MS らゅ IME 块猭"
  LangString Item4 ${LANG_TRADCHINESE} "らゅ安郎锣传祘Α"
  LangString Item5 ${LANG_TRADCHINESE} "HTMLゅン甧锣传竟"
  LangString Item6 ${LANG_TRADCHINESE} "ガ陪ボ"
  LangString Item7 ${LANG_TRADCHINESE} "秨﹍倍畖"
  LangString Item8 ${LANG_TRADCHINESE} "ミ秆埃杆祘Α"

  LangString DESC_SecItem1 ${LANG_TRADCHINESE} "BIG5 耎眎栋ぃΤ礚猭陪ボフ睹絏"
  LangString DESC_SecItem2 ${LANG_TRADCHINESE} "よ獽块らゅ安"
  LangString DESC_SecItem2eudc ${LANG_TRADCHINESE} "干ㄇ灿砰⊿Τ$\n$\n“猔種$\n狦Τ杆い瓣栋兜叫杆"
  LangString DESC_SecItem3 ${LANG_TRADCHINESE} "籔腻妓絏耕ぶ続癸らゅ耕剪眡"
  LangString DESC_SecItem3ime ${LANG_TRADCHINESE} "MS らゅ IME"
  LangString DESC_SecItem4 ${LANG_TRADCHINESE} "р侣らゅ安郎锣传穝 Unicode 郎"
  LangString DESC_SecItem5 ${LANG_TRADCHINESE} "盢 BIG5 HTML ゅンい┮ㄏノ锣传Θ–常眔Α"
  LangString DESC_SecItem6 ${LANG_TRADCHINESE} "杆иみ礶翅惠璶币ノ Active Desktop"
  LangString DESC_SecItem7 ${LANG_TRADCHINESE} "倍畖秨﹍"
  LangString DESC_SecItem8 ${LANG_TRADCHINESE} "ミ秆埃杆祘Α"

  LangString SC1   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\秆埃杆 Unicode 干Ч璸礶.lnk"
  LangString SC2   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\弄и郎.lnk"
  LangString SC3   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\セ菌.lnk"
  LangString SC4   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\らゅ安郎锣传祘Α.lnk"
  LangString SC5   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 干Ч璸礶.lnk"
  LangString SC6   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 干Ч璸礶阶韭.lnk"
  LangString SC7   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\代刚 - らゅ安.lnk"
  LangString SC8   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\代刚 - 虏砰いゅ.lnk"
  LangString SC9   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\HTMLゅン甧锣传竟.lnk"

  LangString DESC_InstTypeMinimum ${LANG_SIMPCHINESE} "最小安装"
  LangString DESC_InstTypeStandard ${LANG_SIMPCHINESE} "标准安装"

  LangString Item1 ${LANG_SIMPCHINESE} "Unicode 补完计画核心"
  LangString Item2 ${LANG_SIMPCHINESE} "樱花输入法"
  LangString Item2eudc ${LANG_SIMPCHINESE} "补充造字档"
  LangString Item3 ${LANG_SIMPCHINESE} "Unicode 日文输入法"
  LangString Item3ime ${LANG_SIMPCHINESE} "MS 日文 IME 输入法"
  LangString Item4 ${LANG_SIMPCHINESE} "日文假名文件名转换程序"
  LangString Item5 ${LANG_SIMPCHINESE} "HTML文件外字兼容转换器"
  LangString Item6 ${LANG_SIMPCHINESE} "墙纸显示"
  LangString Item7 ${LANG_SIMPCHINESE} "开始菜单快捷方式"
  LangString Item8 ${LANG_SIMPCHINESE} "创建解除安装程序"

  LangString DESC_SecItem1 ${LANG_SIMPCHINESE} "BIG5 的扩张字符集。不再有缺字、无法显示、空白、乱码"
  LangString DESC_SecItem2 ${LANG_SIMPCHINESE} "方便你输入日文假名。"
  LangString DESC_SecItem2eudc ${LANG_SIMPCHINESE} "补充一些「Mingliu.TTC」没有的字。"
  LangString DESC_SecItem3 ${LANG_SIMPCHINESE} "与樱花同样，但重码字较少，适合对日文较熟悉的人士。"
  LangString DESC_SecItem3ime ${LANG_SIMPCHINESE} "MS 日文 IME。"
  LangString DESC_SecItem4 ${LANG_SIMPCHINESE} "把旧的日文假名文件名，转换为新的 Unicode 文件名。"
  LangString DESC_SecItem5 ${LANG_SIMPCHINESE} "将你的 BIG5 HTML 文件中所使用到的外字，转换成每个人都看的到的形式。"
  LangString DESC_SecItem6 ${LANG_SIMPCHINESE} "安装看看，我们花了很多心思画喔，需要启用 Active Desktop"
  LangString DESC_SecItem7 ${LANG_SIMPCHINESE} "添加快捷方式到开始菜单"
  LangString DESC_SecItem8 ${LANG_SIMPCHINESE} "创建解除安装程序"

  LangString SC1   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\解除安装 Unicode 补完计画.lnk"
  LangString SC2   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\自述文件.lnk"
  LangString SC3   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\版本历史.lnk"
  LangString SC4   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\日文假名文件名转换程序.lnk"
  LangString SC5   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 补完计画主页.lnk"
  LangString SC6   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 补完计画论坛.lnk"
  LangString SC7   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\测试页 - 日文假名.lnk"
  LangString SC8   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\测试页 - 简体中文.lnk"
  LangString SC9   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\HTML文件外字兼容转换器.lnk"

  LangString DESC_InstTypeMinimum ${LANG_JAPANESE} "僔儞僾儖僀儞僗僩乕儖"
  LangString DESC_InstTypeStandard ${LANG_JAPANESE} "昗弨僀儞僗僩乕儖"

  LangString Item1 ${LANG_JAPANESE} "Unicode 曗姰寁夋僇乕僱儖"
  LangString Item2 ${LANG_JAPANESE} "Unicode 嶗壴IME"
  LangString Item2eudc ${LANG_JAPANESE} "奜帤僼傽僀儖"
  LangString Item3 ${LANG_JAPANESE} "Unicode 擔杮岅IME"
  LangString Item3ime ${LANG_JAPANESE} "MS 擔杮岅 IME"
  LangString Item4 ${LANG_JAPANESE} "擔杮岅壖柤僼傽僀儖柤曄姺僾儘僌儔儉"
  LangString Item5 ${LANG_JAPANESE} "HTML僪僉儏儊儞僩MS950屳姺僾儘僌儔儉"
  LangString Item6 ${LANG_JAPANESE} "暻巻昞帵"
  LangString Item7 ${LANG_JAPANESE} "僗僞乕僩儊僯儏乕僔儑僢僩僇僢僩"
  LangString Item8 ${LANG_JAPANESE} "傾儞僀儞僗僩乕儔"

  LangString DESC_SecItem1 ${LANG_JAPANESE} "BIG5偺奼挘暥帤廤丅偙傟偐傜BIG5偺壖柤偑尒偊傑偡両"
  LangString DESC_SecItem2 ${LANG_JAPANESE} "傂傜偑側傪擖椡偡傞偲偒偵曋棙偱偡丅"
  LangString DESC_SecItem2eudc ${LANG_JAPANESE} "乽嵶柧閾乿偵偼側偄帤傪曗懌偟傑偡丅"
  LangString DESC_SecItem3 ${LANG_JAPANESE} "乽嶗壴乿偲摨偠偱偡偑丄乽廳狴帤乿偑彮側偔丄擔杮岅偵側傟偰偄傞曽偵揔偟偰偄傑偡丅"
  LangString DESC_SecItem3ime ${LANG_JAPANESE} "MS 擔杮岅 IME"
  LangString DESC_SecItem4 ${LANG_JAPANESE} "屆偄傂傜偑側偱嶌惉偟偨僼傽僀儖柤傪丄怴偟偄 Unicode 僼傽僀儖柤傊曄姺偟傑偡丅"
  LangString DESC_SecItem5 ${LANG_JAPANESE} "BIG5儂乕儉儁乕僕偱彂偒崬傓偲偒丄扤偱傕尒偊傞壖柤偵揮姺偱偒傞僾儘僌儔儉丅"
  LangString DESC_SecItem6 ${LANG_JAPANESE} "Windows偺暻巻偱偡乮徫乯丅 Active Desktop 偑昁梫偱偡丅"
  LangString DESC_SecItem7 ${LANG_JAPANESE} "僗僞乕僩儊僯儏乕偵僔儑僢僩僇僢僩傪嶌傝傑偡丅"
  LangString DESC_SecItem8 ${LANG_JAPANESE} "傾儞僀儞僗僩乕儔"

  LangString SC1   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 曗姰寁夋 傪嶍彍偡傞.lnk"
  LangString SC2   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\READ ME乮拞崙岅乯.lnk"
  LangString SC3   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\僶乕僕儑儞棜楌乮拞崙岅乯.lnk"
  LangString SC4   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\擔杮岅壖柤僼傽僀儖柤曄姺僾儘僌儔儉.lnk"
  LangString SC5   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 曗姰寁夋 儂乕儉儁乕僕.lnk"
  LangString SC6   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 曗姰寁夋 僼僅乕儔儉乮拞崙岅乯.lnk"
  LangString SC7   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\僥僗僩儁乕僕 - 壖柤.lnk"
  LangString SC8   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\僥僗僩儁乕僕 - 娙懱帤拞崙岅.lnk"
  LangString SC9   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\HTML僪僉儏儊儞僩MS950屳姺僾儘僌儔儉.lnk"
;=======================================================
; 〗9.秆埃杆祘Α痷タ笆
;=======================================================
; 硂场だ㎝玡ミ CreateUninst 種ぃ妓翅
; 玡: р uninstaller 祘Α暗ㄓ
; : ﹚硂祘Α璶埃êㄇ郎/ヘ魁/爹兜

;==============================
; 9.1 竊琿秨﹍

Section "Uninstall"

; 璶簿埃奔秆埃杆祘Α

  ; 簿埃秨﹍е患币笆单倍畖
   Rename "$INSTDIR\Backup\$R7_950.nls" "$SYSDIR\$R7_950-.NLS"
   StrCmp $R6 '98' UnNLS98
    StrCmp $6 '1028' UnNLS98
     Delete "$SYSDIR\C_950.NLS"
     IfFileExists "$SYSDIR\C_950.NLS" +2
;      Rename "$SYSDIR\C_950-.nls" "$SYSDIR\C_950.nls"
;     goto UnRenOK
      MessageBox MB_OK|MB_ICONEXCLAMATION "牡$\n======$\nぃ C_950.nls 綝╰参玛﹚$\n$\n惠璶硈尿穝秨诀ㄢΩЧΘ簿埃"

UnNLS98:
  Rename /REBOOTOK "$SYSDIR\$R7_950-.nls" "$SYSDIR\$R7_950.nls"
  StrCmp '98' 0 UnRenOK
   Delete /rebootok "$SYSDIR\UAO-EUDC.TTE"
   StrCmp $6 '1028' 0 +5
    Rename "$INSTDIR\Backup\unicode.bin" "$SYSDIR\unicode-.bin"
    Rename "$INSTDIR\Backup\gdi.exe" "$SYSDIR\GDI-.EXE"
    Rename /rebootok "$SYSDIR\unicode-.bin" "$SYSDIR\unicode.bin"
    Rename /rebootok "$SYSDIR\gdi-.exe" "$SYSDIR\GDI.EXE"

   ;硑称ぃ?
   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "BackupSystemDefaultEUDCFont"

   ;硑称杠糶﹍
   ;ぃ杠琌琌恶и硑郎琌杠睲奔诀絏
   IfErrors 0 restore_eudc
    ReadRegStr $R0 HKCU "eudc\950" "SystemDefaultEUDCFont"
    StrCmp $R0 "$SYSDIR\UAO-EUDC.TTE" 0 UnRenOK
     DeleteRegValue HKCU "eudc\950" "SystemDefaultEUDCFont"
     DeleteRegKey /ifempty HKU ".DEFAULT\eudc\950"
     DeleteRegKey /ifempty HKU ".DEFAULT\eudc"
     goto UnRenOK

restore_eudc:
  WriteRegStr HKCU "eudc\950" "SystemDefaultEUDCFont" "$R0"
  DeleteRegValue HKCU "eudc\950" "BackupSystemDefaultEUDCFont"

UnRenOK:
  Delete /REBOOTOK "$WinDIR\ttfcache"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Nls\CodePage" "950" "$R7_950.nls"
  StrCmp $R6 '98' +3
   WriteRegStr HKLM "SYSTEM\ControlSet001\Control\Nls\CodePage" "950" "c_950.nls"
   WriteRegStr HKLM "SYSTEM\ControlSet002\Control\Nls\CodePage" "950" "c_950.nls"

  ; 埃 2.00 セ痙
  IfFileExists "$SYSDIR\$R7_950cs.nls" 0 +2
   Delete /rebootok "$SYSDIR\$R7_950cs.nls"

  StrCmp $R6 '98' +2
  ; 浪琩琌蛮╰参璝琌玥ぃ簿埃 $instdir ヘ魁
   IfFileExists "$INSTDIR\Backup\CP_950.nls" nodel200 del_instdir

  ; 浪琩琌蛮╰参璝琌玥ぃ簿埃 $instdir ヘ魁
   IfFileExists "$INSTDIR\Backup\C_950.nls" 0 del_instdir

nodel200:
  MessageBox MB_OK|MB_ICONINFORMATION  "$(GetAnotherOne)"
  goto del_instdir_ok

del_instdir:
  ; 簿埃ㄏノ筁ヘ魁
  RMDir /r "$INSTDIR"

del_instdir_ok:
  ; 簿埃秨﹍е患币笆单倍畖
  RMDir /r "$SMPROGRAMS\${My_PRODUCT}"

  ; 埃 windows 爹ぇい杆隔畖
  DeleteRegKey HKLM SOFTWARE\${My_PRODUCT}

  ; 埃 windows 爹秆埃杆
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}"

  ; 埃菲公龄
;DeleteRegKey HKLM "SOFTWARE\Classes\CLSID\{b5eedee0-c06e-11cf-8c56-444553540000}\InProcServer32"
;DeleteRegKey HKLM "SOFTWARE\Classes\CLSID\{b5eedee0-c06e-11cf-8c56-444553540000}"

  ; 埃 uninstaller ㄏノ粂ē嘿 (* 秈顶)
  DeleteRegValue HKLM "Software\${My_PRODUCT}" "Installer Language"

  ;陪ボЧΘ夹繷 (* 秈顶)
;  !insertmacro MUI_UNFINISHHEADER

  StrCmp $R6 '2k3' 0 No2k3
   ;临癸 Windows File Protect э
   ClearErrors
   ReadINIStr $R2 $WINDIR\inf\layout.inf "SourceDisksFiles" ";c_950.nls"
   IfErrors No2k3
    DeleteINIStr $WINDIR\inf\layout.inf "SourceDisksFiles" ";c_950.nls"
    WriteINIStr $WINDIR\inf\layout.inf "SourceDisksFiles" "c_950.nls" "$R2"

No2k3:
; SetRebootFlag True

  MessageBox MB_YESNO|MB_ICONEXCLAMATION  "$(un.MSG_POSTINST)" IDNO +2
   reboot

SectionEnd

;===============================================================================
;=======================================================
; 〗4.杆祘Α杆秨﹍玡竚笆 (* 秈顶)
;=======================================================
; 狦ぃ惠璶场 remark

Function .onInit
; 盎代 OS & ╰参粂ē
; $6  肚 粂ē (dec)
; $7  肚 粂ē (hex)
; $R6 肚 OS
; $R7 肚 OS  nls 絏98=CPNT=C
;浪琩 os ヘ玡粂ē璝獶 0x0404 (芖) or 0x0c04 (翠)玥 quit
System::Call 'kernel32::GetSystemDefaultLangID() i .r6'
IntOp $6 $6 & 0xFFFF

; IntFmt  Format string Α
; %c = %@Char[] = ascii 计△じ
; %u = %@Ascii[] = じ△ascii 计
; %x = 秈 △ せ秈 糶
; %X = 秈 △ せ秈 糶
; %0计X = 秈 △ せ秈 糶计计ぃì杠玡よ干 0
IntFmt $7 "%04X" $6

; TW=1028, HK=3076, 緿=5124, GB=2052, 穝℡=4100, JP=1041 => EN=1033=All Others
StrCmp $6 "1028" TW
StrCmp $6 "1041" TW
StrCmp $6 "2052" GB
StrCmp $6 "4100" GB
StrCmp $6 "3076" HK
StrCmp $6 "5124" HK
;MessageBox MB_OK|MB_ICONINFORMATION "Warning!!  Your System_Language is not based on Chinese-Big5, I can't install on it!!!"
;Quit

StrCpy $6 "1033"
goto TW

HK:
StrCpy $6 "1028"
StrCpy $r1 'HK'
goto TW

GB:
StrCpy $6 "2052"

TW:

; 抖獽砞﹚粂ē
StrCpy $LANGUAGE $6

StrCmp $r1 'HK' 0 +3
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "牡杆祘Α祇瞷ㄏノ琌翠〓緿粂╰ Windows$\n$\n叫猔種$\n$\nUnicode 干Ч璸礶籔翠緿跋┮硄ノ翠現┎糤干硑栋 (HKSCS)ぃ甧璝Τㄏノ翠惠―膥尿杆セ硁砰盢旧璓砛钵盽瞷禜祇ネ$\n$\n叫拜璶膥尿盾" IDYES +2
 Quit

; 倒﹚篨夹
StrCpy $FTPageLicense "0"       ;PageLicense 篨夹磅︽筁Ω碞穦砆稦奔
StrCpy $FTPageCompoment "0"     ;PageCompoment 篨夹磅︽筁Ω碞穦砆稦奔
StrCpy $R7 'CP'

; 眔╰参箇砞聅凝竟
ReadRegStr $Def3WBrowser HKCR "http\shell\open\command" ""
StrLen $r1 $Def3WBrowser
IntOP $r1 $r1 - 10
StrCpy $r2 $Def3WBrowser 10 $r1
StrCmp $r2 ' -url "%1"' 0 +2
 StrCpy $Def3WBrowser $Def3WBrowser $r1

;==============================
; 4.2 匡拒  (* 秈顶)
;
; 紇臫杆祘Α粂ē匡拒 dialog ぃ璶ㄏノいゅ嘿
; Push Verdana
; Push 9

;==============================
; 4.4 杆玡竚笆 (э爹) (* 秈顶)
;
; 跌惠璶敖敖暗ㄇ笆

;==============================
; 4.5 碝т侣杆ヘ魁 (* 秈顶)
;
; 狦 "Install_Dir" 弄Ю狠Τ \ 才腹碞р \ 奔

  ReadRegStr $0 HKLM "Software\${My_PRODUCT}" "Install_Dir"
  StrLen $1 $0
  StrCmp $1 '0' Final_onInit
   IntOP $1 $1 - 1
   StrCpy $2 $0 1 $1
   StrCmp $2 '\' +2
    IntOP $1 $1 + 1
   StrCpy $INSTDIR $0 $1

Final_onInit:
; э BIG5_Extension 2.10 2.00 痙摧緇
   DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BIG5_Extension"

;InitPluginsDir
File /oname=$PLUGINSDIR\license1028.txt "1028license.txt"
File /oname=$PLUGINSDIR\license1033.txt "1033license.txt"
File /oname=$PLUGINSDIR\license1041.txt "1041license.txt"
File /oname=$PLUGINSDIR\license2052.txt "2052license.txt"
FunctionEnd
;===============================================================================
;;==============================
;; 4.3 粂ē (* 秈顶)
;;
;; 峨 ENU/CHT/CHS 粂ē璶 18 粂ē峨ぃは癸阀糤 20 kb オ
;; 狦ぃ琌粂ēいゅて杆场 remark 奔
;; LangDLL::LangDialog "MUI_LANGDLL_WINDOWTITLE" "MUI_LANGDLL_INFO" 匡拒粂ē计ヘ 粂ē1 粂ē絏1 粂ē2 粂ē絏2 粂ē3 粂ē絏3 粂ē4 粂ē絏4
;LangString IL ${LANG_ENGLISH}     "Installer Language"
;LangString IL ${LANG_TRADCHINESE} "杆粂ē"
;LangString IL ${LANG_SIMPCHINESE} "安装语言"
;LangString IL ${LANG_JAPANESE}    "Installer Language"
;LangString CL ${LANG_ENGLISH}     "Please select a language."
;LangString CL ${LANG_TRADCHINESE} "叫匡拒眤璶杆粂ē"
;LangString CL ${LANG_SIMPCHINESE} "请选择你要的安装语言"
;LangString CL ${LANG_JAPANESE}    "Please select a language."
;LangString ENG ${LANG_ENGLISH}     "璣粂EN"
;LangString ENG ${LANG_TRADCHINESE} "璣粂"
;LangString ENG ${LANG_SIMPCHINESE} "英文"
;LangString ENG ${LANG_JAPANESE}    "璣粂JP"
;LangString ROC ${LANG_ENGLISH}     "羉砰いゅEN"
;LangString ROC ${LANG_TRADCHINESE} "羉砰いゅ"
;LangString ROC ${LANG_SIMPCHINESE} "繁体中文"
;LangString ROC ${LANG_JAPANESE}    "斏閾帤拞崙岅"
;LangString PRC ${LANG_ENGLISH}     "虏砰いゅEN"
;LangString PRC ${LANG_TRADCHINESE} "虏砰いゅ"
;LangString PRC ${LANG_SIMPCHINESE} "简体中文"
;LangString PRC ${LANG_JAPANESE}    "娙懱帤拞崙岅"
;LangString JAP ${LANG_ENGLISH}     "ら粂EN"
;LangString JAP ${LANG_TRADCHINESE} "ら粂"
;LangString JAP ${LANG_SIMPCHINESE} "日文"
;LangString JAP ${LANG_JAPANESE}    "擔杮岅"
;
; だㄢよ猭
;
; よ猭ㄏノ MUI よ猭
; !define MUI_LANGDLL_WINDOWTITLE "$(IL)"
; ;The window title of the language selection dialog.
;
; !define MUI_LANGDLL_INFO "$(CL)"
; ;The text to display on the language selection dialog.
;
; !undef MUI_LANGDLL_PUSHLIST
; !define MUI_LANGDLL_PUSHLIST '"English $(ENG)" 1033 "Chinese (Traditional) $(ROC)" 1028 "Chinese (Simplified) $(PRC)" 2052 "Japanese $(JAP)" 1041'
;
; !insertmacro MUI_LANGDLL_DISPLAY
; よ猭挡
;
; よ猭ぃㄏノ MUI よ猭
; LangDLL::LangDialog "$(IL)" "$(CL)" 4 "English $(ENG)" 1033 "Chinese (Traditional) $(ROC)" 1028 "Chinese (Simplified) $(PRC)" 2052 "Japanese $(JAP)" 1041
; Pop $LANGUAGE
; StrCmp $LANGUAGE "cancel" 0 LangSelOK
;    Abort
;;LangSelOK:
; よ猭挡
;===============================================================================
Function popup_message
StrCmp $FTPageLicense "0" +2
 return
StrCpy $FTPageLicense "1"

;; 窽ゎ秈
System::Call 'kernel32::CreateMutexA(i 0, i 0, t "KiiAliButHoWitchFive") i .r1 ?e'
Pop $R0
StrCmp $R0 '0' +3
 MessageBox MB_OK|MB_ICONSTOP "$(MSG_RunOnesAtTheSameTime_checked)"
 Quit
;==============================
; 4.1 陪ボ舦紇钩
;
; 侣ㄏノ magiclime 暗睭睭ぃ筁硂⊿эΘ
; advsplash 本よΑ秆溃罽羬ヘ魁陪ボ splash 礛奔
; 猔種: nsis 2.0a0 Τ magicsplash 郎ぃ筁 2.0b1 ﹡礛ぃǎ

    File /oname=$TEMP\splash1.bmp ".\434but\logo.bmp"
;   File /oname=splash1.bmp ${SPLASH1}
;   File /oname=splash2.bmp ${SPLASH2}

  advsplash::show 1200 600 400 -1 $TEMP\splash1
; advsplash::show 1200 600 400 -1 $TEMP\splash2

  Pop $0 ; $0 has '1' if the user closed the splash screen early,
         ; '0' if everything closed normal, and '-1' if some error occured.

   Delete $TEMP\spltmp.exe
   Delete $TEMP\splash1.bmp
;  Delete $TEMP\splash2.bmp

;⊿杆ie 羉砰いゅや穿趁ルぃ倒杆
StrCmp $6 "1028" +4
 IfFileExists "$Fonts\Mingliu.ttc" +3
  MessageBox MB_OK|MB_ICONSTOP "$(MSG_NO_IEPKTW_checked)"
  Quit

; 浪琩穨╰参セ礛р Win98_checked 郎Ю狠牡跌怠
  ClearErrors
  ReadRegStr $R0 HKLM \
   "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion

  IfErrors Win9x_checked

;WinNewT_checked:

   StrCpy $R1 $R0 1

   StrCmp $R1 '5' Win2x3_checked

;WinNT_checked:
;  Strcpy $R6 'NS'
   Goto NoneSupportOS

Win2x3_checked:

   StrCpy $R1 $R0 3

   StrCmp $R1 '5.0' Win2k_checked
   StrCmp $R1 '5.1' WinXP_checked
   StrCmp $R1 '5.2' WinS2k3_checked

WinUnKnown_checked:
;  Strcpy $R6 'NS'
   Goto NoneSupportOS

Win2k_checked:
     Strcpy $R6 '2k'
     Goto Detect_END_2kxp

WinXP_checked:
     Strcpy $R6 'xp'
     Goto Detect_END_2kxp

WinS2k3_checked:
     Strcpy $R6 '2k3'
     Goto Detect_END_2kxp

Win9x_checked:
   ReadRegStr $R0 HKLM \
   "SOFTWARE\Microsoft\Windows\CurrentVersion" VersionNumber

   StrCpy $R1 $R0 1
   StrCmp $R1 '4' 0 WinUnKnown_checked

   StrCpy $R1 $R0 3
   StrCmp $R1 '4.0' Win95_checked
    StrCmp $6 '1028' 0 +2
     MessageBox MB_OK|MB_ICONEXCLAMATION "猔種$\n$\nWindows 98/SE/ME セ Alpha release$\n$\n叫綷弄┮Τゅン璽砫玡矗杆"
   StrCmp $R1 '4.9' WinME_checked
;  StrCpy $R1 $R0 7 2
;  StrCmp $R1 '10.2222' Win98SE_checked

;Win98_checked:
   Strcpy $R6 '98'
   goto Detect_END

;Win98SE_checked:
;   Strcpy $R6 'SE'
;   Goto Detect_END

WinME_checked:
;   Strcpy $R6 'ME'
    Exec '$Def3WBrowser http://leoboard.cpatch.org/cgi-bin/topic.cgi?forum=21&topic=72&start=9&show=0'
    MessageBox MB_OKCANCEL|MB_ICONINFORMATION  "$(MSG_ME_SFP_checked)" IDCANCEL BreakMEInstall
;   MessageBox MB_OK|MB_ICONINFORMATION  "$(MSG_ME_SFP_checked)"
    Strcpy $R6 '98'
    Goto Detect_END

BreakMEInstall:
    Exec '$Def3WBrowser http://leoboard.cpatch.org/cgi-bin/topic.cgi?forum=21&topic=72&start=9&show=0'
    Quit

Win95_checked:
;  Strcpy $R6 'NS'

NoneSupportOS:
;StrCmp $R6 'NS' 0 SupportOS
MessageBox MB_OK|MB_ICONSTOP  "$(MSG_NS_OS_checked)"
Quit

Detect_END_2kxp:
  StrCpy $R7 'C'

Detect_END:
  IfFileExists "$SysDir\$r7_951.nls" 0 +3
   MessageBox MB_YESNO|MB_ICONEXCLAMATION "牡杆祘Α祇瞷竒杆翠現┎糤干硑栋 (HKSCS)$\n$\nUnicode 干Ч璸礶籔 HKSCS ぃ甧膥尿杆Unicode 干Ч璸礶盢旧璓 HKSCS ア$\n$\n絋﹚璶膥尿盾" IDYES +2
   Quit

;代Ω⊿杆ie 羉砰いゅや穿趁ルぃ倒杆
StrCmp $6 "1028" +4
 IfFileExists "$SysDir\$R7_950.NLS" +3
  MessageBox MB_OK|MB_ICONSTOP "$(MSG_NO_IEPKTW_checked)"
  Quit

;璶ノ command.com狦⊿Τ command.com ぃ倒杆
StrCpy $ComPath '$windir'
IfFileExists "$ComPath\command.com" +5
 StrCpy $ComPath 'C:'
 IfFileExists "$ComPath\command.com" +3
 MessageBox MB_OK|MB_ICONSTOP "Can not find Command.com, Stop Install.$\n$\nтぃ Command.com杆いゎ"
 quit


StrCmp $R6 '98' ChkMingliu98
  ; 抖獽代琌ぃ琌 Administrator
  UserInfo::GetAccountType
  Pop $R0
  StrCmp $R0 "Admin" CheckingOK
   MessageBox MB_OK|MB_ICONSTOP  "$(MSG_Admin_checked)"
   Quit

ChkMingliu98:
;抖獽代惠ぃ惠璶穝灿砰&夹发砰
  !insertmacro FileSize "$fonts\MINGLIU.TTC"
  pop $2
  IntCmp "8637684" $2 ChkKaiu98 ChkKaiu98
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(MSG_OLD_Mingliu_checked)"
   Exec '$Def3WBrowser http://cpatch.org/witchfive/pastepic/newttf/newttf.html'

ChkKaiu98:
  IfFileExists "$Fonts\KAIU.TTF" 0 CheckingOK
   !insertmacro FileSize "$fonts\KAIU.TTF"
   pop $2
   IntCmp "5163952" $2 CheckingOK CheckingOK
    MessageBox MB_OK|MB_ICONEXCLAMATION "$(MSG_OLD_Kaiu_checked)"
    Exec '$Def3WBrowser http://cpatch.org/witchfive/pastepic/newttf/newttf.html'

CheckingOK:

;SetShellVarContext all
;4.9.7.3 SetShellVarContext
;
;current|all
;
;Sets the context of $SMPROGRAMS and other shell folders. If set to 'current'
;(the default), the current user's shell folders are used. If set to 'all', the
;'all users' shell folder is used. The all users folder may not be supported on
;all OSes. If the all users folder is not found, the current user folder will
;be used. Please take into consideration that a "normal user" has no rights
;to write in the all users area. Only admins have full access rights to the all
;users area. You can check this by using the UserInfo Plugin. See
;Contrib\UserInfo\UserInfo.nsi for an example.

;SetShellVarContext sets an installer flag (at runtime) which tells the
;installer wheather to get the current user's folder, or all users' folder.
;It affects the values of $SMPROGRAMS, $SMSTARTUP, $DESKTOP, $STARTMENU and
;$QUICKLAUNCH.

;==============================
; 4.6 杆玡矗ボ癟

   StrCmp $R6 '98' +3
    MessageBox MB_OK|MB_ICONINFORMATION  "$(MSG_NT_PREINST1)"
    return
   MessageBox MB_OK|MB_ICONINFORMATION  "$(MSG_9X_PREINST1)"
;  StrCmp $6 '1028' 0 +2
;   ExecShell open "http://cpatch.org/witchfive/pastepic/lfnbakren/lfnbakren.html"

FunctionEnd
;===============================================================================
Function .onSelChange
; 98 闽超unicode らゅ块&MS らゅ IME&э郎祘Α
; NT 闽超硑郎
;; 獶 big5 ㄏノ闽超┮Τ块猭&э郎祘Α
; 獶 big5 ㄏノ闽超┮Τ獶 unicode 块猭&э郎祘Α
; 闽超猭砞﹚赣 section ゼ匡& Read Only 篈
;         礛р赣 section留旅
;SecItem2eudc - 硑郎
;SecItem2 - 腻块猭
;SecItem3 - Unicode らゅ块猭
;SecItem3ime - MS らゅ IME 块猭
;SecItem4 - э郎祘Α

!macro DisSection Sec
  SectionGetFlags ${Sec} $R0
  IntOP $R0 $R0 & 0xFFFFFFFE
  IntOP $R0 $R0 | 0x10
  SectionSetFlags ${Sec} $R0
  SectionSetText ${Sec} ""
!macroend

StrCmp $R6 '98' DisableSection98
  StrCmp $FTPageCompoment "0" 0 NotFirstCall
   StrCpy $FTPageCompoment "1"

; 琌р腻つ奔Ωτ
   SectionGetFlags ${SecItem2} $R0
   IntOP $R0 $R0 & 0xFFFFFFFE
   SectionSetFlags ${SecItem2} $R0

NotFirstCall:
  !insertmacro DisSection "${SecItem2eudc}"


StrCmp $6 '1028' CheckOldRenameTable
 !insertmacro DisSection "${SecItem4}"
return

; 狦琌羉い nt kernel os眏杆э祘Α
CheckOldRenameTable:
;; 狦 uc-o2n.tbl 眏つ匡UcFileRenamer
;  IfFileExists "$InstDir\uc-o2n.tbl" +2
;   return
  SectionGetFlags ${SecItem4} $R0
  IntOP $R0 $R0 | 0x11
  SectionSetFlags ${SecItem4} $R0
  return

DisableSection98:
  !insertmacro DisSection "${SecItem3}"
  !insertmacro DisSection "${SecItem3ime}"
  !insertmacro DisSection "${SecItem4}"
  StrCmp $6 '1028' 0 +2
   return
  !insertmacro DisSection "${SecItem2}"
FunctionEnd

;===============================================================================
;=======================================================
; 〗5.杆祘Α杆ЧΘ竚笆 (* 秈顶)
;=======================================================
; 狦ぃ惠璶场 remark

;==============================
; 5.1 ㄧΑ﹚竡秨﹍
;Function .onInstSuccess

;==============================
; 5.2 杆ЧΘ磅︽ ExecShell
;
; 跌惠璶τ﹚иノ Eudora 杆τ
; ;------------------------------------------
; !macro MUI_INSTSUCCESS1 LANGID TEXT
;
;   StrCmp $LANGUAGE ${LANGID} "" +3
;   MessageBox MB_YESNO|MB_ICONQUESTION  "${TEXT}" IDNO Nomapi
;     ExecShell open '$INSTDIR\SWMAPI.EXE'
; !macroend
; ;------------------------------------------;

; 琌 ENU/CHT/CHS 粂ē笆
;
; !insertmacro MUI_INSTSUCCESS1 1033 "Do you want to install  ${NAME} as a default mailer?  It will execute MAPI installer."
; !insertmacro MUI_INSTSUCCESS1 1028 "稱璶杆 ${NAME} 暗箇砞獺ン祘Α盾盢磅︽场 MAPI 杆祘Α"
; !insertmacro MUI_INSTSUCCESS1 2052 "你想要安装 ${NAME} 做为默认邮件程序吗？将运行外部 MAPI 安装程序。"
; Nomapi:

;==============================
; 5.3 杆璶―ㄏノ弄 README 郎
 

;  ;------------------------------------------
;  !macro MUI_INSTSUCCESS2 LANGID TEXT README
 
;    StrCmp $LANGUAGE ${LANGID} "" +3
;;    MessageBox MB_YESNO|MB_ICONQUESTION  "${TEXT}" IDNO NoReadme
;;    ExecShell open notepad '$INSTDIR\${README}'
;;    ExecShell open '$INSTDIR\${README}'
;  !macroend
;; ;------------------------------------------
 
;; 琌 ENU/CHT/CHS 粂ē笆
 
;; !insertmacro MUI_INSTSUCCESS2 1033 "Setup has been completed successfully .  Press [Yes] to continue README file." "${README_ENU}"
;; !insertmacro MUI_INSTSUCCESS2 1028 "杆ΘЧΘ [Yes] 膥尿弄 README 郎" "${README_CHT}"
;; !insertmacro MUI_INSTSUCCESS2 2052 "安装已成功地完成。按下 [Yes] 继续读取 README 文件。" "${README_CHS}"
;; NoReadme:
;==============================
; 5.4 ㄧΑ﹚竡挡

;FunctionEnd
;;--------------
;; This function will dump the log of the installer (installer details) to a
;; file of your choice.
Function .onInstFailed
call .onInstSuccess
FunctionEnd

Function .onInstSuccess
!define LVM_GETITEMCOUNT 0x1004
!define LVM_GETITEMTEXT 0x102D

  FindWindow $0 "#32770" "" $HWNDPARENT
  GetDlgItem $0 $0 1016
  StrCmp $0 0 exit
  FileOpen $5 "$INSTDIR\INSTALL.LOG" "w"
  StrCmp $5 "" exit
    SendMessage $0 ${LVM_GETITEMCOUNT} 0 0 $6
    System::Alloc ${NSIS_MAX_STRLEN}
    Pop $3
    StrCpy $2 0
    System::Call "*(i, i, i, i, i, i, i, i, i) i (0, 0, 0, 0, 0, r3, ${NSIS_MAX_STRLEN}) .r1"
    loop:
      StrCmp $2 $6 done
      System::Call "User32::SendMessageA(i, i, i, i) i ($0, ${LVM_GETITEMTEXT}, $2, r1)"
      System::Call "*$3(&t${NSIS_MAX_STRLEN} .r4)"
      FileWrite $5 "$4$\r$\n"
      IntOp $2 $2 + 1
      Goto loop
    done:
      FileClose $5
      System::Free $1
      System::Free $3
  exit:

FunctionEnd
;===============================================================================
;==============================
; 9.2 秆埃杆祘Α﹍てㄧΑ笆 (* 秈顶)

Function un.onInit

  ;眖爹眔粂ē嘿
  ReadRegStr $LANGUAGE HKLM "Software\${My_PRODUCT}" "Installer Language"
  ReadRegStr $INSTDIR HKLM "Software\${My_PRODUCT}" "Install_Dir"
  ReadRegStr $R7 HKLM "SOFTWARE\${My_PRODUCT}" "CP"
  ReadRegStr $R6 HKLM "SOFTWARE\${My_PRODUCT}" "OS"
  ReadRegStr $6 HKLM "SOFTWARE\${My_PRODUCT}" "SysLang"

FunctionEnd
;=======================================================
Function showLicense2
  FindWindow $0 "#32770" "" $HWNDPARENT
  GetDlgItem $0 $0 1000
  SendMessage $0 ${WM_SETTEXT} 0 "STR:"
;  SendMessage $0 0x00C2 0 "STR:$(MyLicenseData2)"
  FileOpen $1 "$PLUGINSDIR\license$language.txt" "r"
loopl2:
  FileRead $1 $2
  SendMessage $0 0x00C2 0 "STR:$2"
  IfErrors 0 loopl2
FileClose $1
  SendMessage $0 0x00B1 0 0
  SendMessage $0 0x00B7 0 0
FunctionEnd
;=======================================================
Function ReadDWord
 exch $3
 push $2
 push $1
 StrCpy $2 $3
 StrCpy $3 '0'
 FileReadByte $2 $1
 IntFmt $1 '%02X' $1
 StrCpy $3 '$1'
 FileReadByte $2 $1
 IntFmt $1 '%02X' $1
 StrCpy $3 '$1$3'
 FileReadByte $2 $1
 IntFmt $1 '%02X' $1
 StrCpy $3 '$1$3'
 FileReadByte $2 $1
 IntFmt $1 '%02X' $1
 StrCpy $3 '$1$3'
 IntOP $3 0x$3 * 1
 FileSeek $2 -4 Cur
 pop $1
 pop $2
 exch $3
FunctionEnd
; 〗eof 郎挡Ю
