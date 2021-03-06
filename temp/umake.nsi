; NSIS Modern User Interface version 1.62
; 
; NSIS 多語言腳本寫作密技
; 
; 這是 KA 實地用於 MDaemon 4.05 中文化的多語言安裝，
; 環境: NSIS 2.0b1, Modern UI 1.62
;
; 為便於閱讀，標明 (* 進階) 者，較為困難，可先略過。
; 幾乎是想辦法用上 Modern UI 1.62 新版的所有技巧了。
; 如果註解寫得太多，損害你的智商，請趕快寫信罵我。
;
; 簡體描述部分，因為在 BIG5 編碼之下使用 GB2312 ，故
; 必定有亂碼，還請見諒。如果需要在網頁取得正確編碼，
; 請儲存為 BIG5 plain text ，再來處理。我會另外以
; attach file 的方式附在板上。
;
; 我沒有使用任何類似 GUI 的工具。如果你之前已經有用
; 於 2.0a7 的 NSI 腳本，跨越版本時在 Modern UI 的寫
; 法，會花一些工夫。比如新世紀精華板有人用的 
; magiclime ，現在只能用 advsplash 以外掛程式方式載入。
; 不用怕，我在裡面都寫了。如果還嫌太麻煩，Joost 的英
; 文版HTML 入門，只有一頁，建議先看。
;
; 記得，沒人強迫你要使用多語言，沒人強迫你要 Modern 
; UI ，沒人強迫你要歡迎對話方塊。你一樣可以做出一點也
; 不花俏的，很傳統的安裝程式。不要在那裡廢話什麼 NSIS
; 愈做愈肥大。
;
; 這些都是自己決定的。

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
; ■1.定義變數、安裝目錄、輸出檔案、圖示
;=======================================================
; 只要在這裡寫好，其他的都按照定義的變數下去跑，就省力多了。
;
;==============================
; 1.1 版本號碼/名稱
;
!define VER_1 2                           ;軟體版本號碼 1 ，如 Eudora 4.3.1.2 四位版本號碼
!define VER_2 40                          ;軟體版本號碼 2
!define VER_3 " Alpha?"                  ;軟體版本號碼 3 (* 進階)
;!define VER_4 yyy                        ;軟體版本號碼 4 (* 進階)
;!define VER_R 3                           ;中文化同版本第幾更版 (* 進階)
!define My_Version  "${VER_1}.${VER_2}${VER_3}" ;程式名稱 (可使用大小寫)
!define My_PRODUCT  "Unicode-At-on" ;程式名稱 (可使用大小寫)
Name "${My_PRODUCT} ${My_Version}"    ;程式名稱 (可使用大小寫)
!define PROGFNHEADER "unicodeaton_"              ;中文化檔案名稱的主要部分 (全部小寫)
!define PROGMAINEXE  "Ico10928.ico"        ;主程式執行檔案名稱 (含.exe)
Var FTPageLicense                      ;PageLicense 的旗標，執行過一次後就會被幹掉了
Var FTPageCompoment                    ;PageCompoment 的旗標，執行過一次後就會被幹掉了
Var Def3WBrowser                       ;系統預設網頁瀏覽器
Var FromNLS
Var ComPath

;==============================
; 1.2 讀我檔案/輸出檔案
;
; 讀我顯示，包括 CHS/CHT/ENU 三個版本。如果你不需要製作
; 多語言中文化版本，只要考慮一個「讀我」即可。這個讀我，
; 通常拿來放「此中文化的描述檔案」，而非一般軟體的 readme 。
;
; 檔案命名: (全部小寫)。
; (cpatch)   c +        ${PROGFNHEADER} + 版本號碼 _(底線) 第幾中文化版本 . 副檔名
; (hanzify) ha _(底線)  ${PROGFNHEADER} + 版本號碼 _(底線) 作者名 . 擴展名

!define MyFileName "${PROGFNHEADER}${VER_1}${VER_2}"
OUTFILE            "${MyFileName}.exe"

;==============================
; 1.3 預設安裝目錄 (尾端不加 \)
;
; 通常會出現在 "C:\Program Files\xxxx " 這種目錄。
; 也可以使用 ${AppPath} 在註冊表尋找舊版安裝目錄。
; 如果註冊表的安裝目錄 (尾端 \) 出現，不要使用，以免發生錯誤。

InstallDir "$PROGRAMFILES\${My_PRODUCT}"

;==============================
; 1.4 版權影像
;
; 只需要一個就夠 (一定要 bmp 格式)，第二個是拿來花俏用的。
; 可以只使用一個，或完全不使用。

;!define SPLASH1 ".\434but\logo.bmp"
;!define SPLASH2 "BMP150chs.BMP"

;==============================
; 1.5 安裝程式型態
;
; 中文化/直接安裝版/還是補綴補丁？安裝時出現在 caption 部分。
; 解除安裝時，也會出現在註冊表。

;!define PATCHTYPE_ENU "(CN+TW) localized"
;!define PATCHTYPE_CHT "(CN+TW) 中文化"
;!define PATCHTYPE_CHS "(CN+TW) 笢恅趙"

;==============================
; 1.6 用於解除安裝的資訊
;
; 包含公司全稱/軟體功能概述。會塞在 Uninstall 註冊表內。

!define URLABOUT  'http://cpatch.org/unicode'
!define URLHELP   'http://leoboard.cpatch.org/cgi-bin/forums.cgi?forum=21'
!define URLUPDATE 'http://search.cpatch.org/search.php?query=unicode&type=fulltext'
!define PUBLISHER '2004 cpatch.org'
; 前面會自動依語言補上 Copyright (c) 或 版權所有 (c) ，因此後面只要接上年代和公司名稱。


; 可抄網頁上的說明。注意: 英文描述中不要使用 ' " 字元，否則會無法找到終止字元。

;=======================================================
; ■2.使用者介面
;=======================================================
; 這一段的用途，在於強制覆寫 system.nsh 的英文預設設定值，
; 通常只有變更 「字型」「圖示」

;==============================
; 2.1 字型

; 安裝介面的字型預設大小 8，一定要改掉，否則在 win98 中文不好看。
; 如下。雙語言中文化，使用 "Tahoma" 即可。
; 不需要特別指定「新細明體」或「宋体」。

;!define MUI_FONT "MS Shell Dlg"
;!define MUI_FONTSIZE "8"
;!define MUI_FONT_HEADER "MS Sans Serif"
;!define MUI_FONTSIZE_HEADER "8"
;
; 上列: NSIS 字型「預設值」，下列: 字型「建議修改值」。
;
;!define MUI_FONT "Tahoma"         ; 在 NSIS 2.0b4 2003-05-01 之後的版本，不需要再用這個命令。已由 *.NSH 指定個別語言的字型名稱與大小。
;!define MUI_FONTSIZE "9"
;!define MUI_FONT_HEADER "Tahoma"
;!define MUI_FONTSIZE_HEADER "9"

;==============================
; 2.2 圖示

; 安裝程式圖示: 通常我使用主程式的圖示，另外用 VC 抽取出來。
; 解除安裝圖示: 為了讓 [控制台 | 新增/移除程式] 出現正確圖示，還是用同一個圖示。
;               有時候則使用它附的圖示 (因為看起來不錯)。
;!define MUI_ICON   "${NSISDIR}\Contrib\Icons\modern-install.ico"
;!define MUI_UNICON "${NSISDIR}\Contrib\Icons\modern-uninstall.ico"
;
; 上列: NSIS 圖示「預設值」，風格有點像 InstallShield 6 ，也不錯。
; 下列: 自訂圖示，請指定正確名稱

;!define MUI_ICON      "${NSISDIR}\Contrib\Graphics\Icons\classic-install.ico"
;!define MUI_UNICON    "${NSISDIR}\Contrib\Graphics\Icons\nsis1-uninstall.ico"
!define MUI_ICON      "Ico10928.ico"
!define MUI_UNICON    "Ico10928.ico"
;==============================
; 2.3 其他 (* 進階)

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
; 開啟更換圖片
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
; ■3.多語言系統
;=======================================================
; 載入 Modern UI\System.nsh 之用。

;==========================
; 3.1 前置相同變數，視需要而定。
;
; 通常出現在更換版本時，原腳本的變數校正。

;!define NAME "${My_PRODUCT}"

;顯示中文化標題，依 ENU/CHT/CHS 語言的不同。

CAPTION "$(MyCaption) ${My_Version} (Win98/SE/ME/2K/XP/2K3)"

;==========================
; 3.3 使用者介面
;
; 如果不要這些對話方塊，不做 define ，就不會出現。

  !define MUI_WELCOMEPAGE             ;歡迎頁面
  !define MUI_LICENSEPAGE             ;授權頁面   !define MUI_LICENSEPAGE_RADIOBUTTONS
  !define MUI_COMPONENTSPAGE          ;元件頁面
  !define MUI_DIRECTORYPAGE           ;目錄選擇
  !define MUI_ABORTWARNING            ;中止警告
  !define MUI_UNINSTALLER             ;解除安裝程式
  !define MUI_UNCONFIRMPAGE           ;不做確認頁面
; !define MUI_STARTMENUPAGE           ;選擇開始功能表

  !define MUI_FINISHPAGE              ;出現完成頁面，執行程式和讀我。
    !define MUI_FINISHPAGE_NOAUTOCLOSE

;    !define MUI_FINISHPAGE_RUN "$INSTDIR\${PROGMAINEXE}"
     !define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\$(FILENAME_README)"

;;  !insertmacro MUI_SYSTEM             ;使用者介面系統

;==============================
; 3.4 各國語言

  !insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"

;==============================
; 3.5 授權文字 (* 進階)
;
; 這些檔案沒有出現在 NSIS 預設包內。如果你手上沒有 license 檔案，
; 請直接 remark 掉。

LicenseData "$(MyLicenseData)"

; 這些東西會先被解壓縮出來。保留這幾行在任何 File 指令之前!)
; 只能用於 BZIP2 壓縮

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
; ■6.安裝的所有檔案
;=======================================================

;==============================
; 6.1 安裝類型

; 兩種應該很夠了。

InstType "$(DESC_InstTypeStandard)"
InstType "$(DESC_InstTypeMinimum)"

SetOverwrite on

;==============================
; 6.3 安裝的各個節段
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "-Backup"
  SectionIn 1 2 RO

; 開始備份
  SetOutPath "$INSTDIR\Backup"

  IfFileExists "$OutDir\$R7_950.nls" 0 +2
   return
  IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\$R7_950.nls" BakAgain

; 將 $R7_950o.nls 變成備份
  IfFileExists "$SYSDIR\$R7_950o.nls" 0 DO1
   rename "$SYSDIR\$R7_950o.nls" "$OutDir\$R7_950.nls"
   StrCmp $R6 '98' DO98
    return

; 將錯誤的備份移到正確的位置
BakAgain:
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\$R7_950.nls" "$OutDir\$R7_950.nls"
   StrCmp $R6 '98' 0 BakAgainNT
   StrCmp $6 '1028' 0 BakAgainNT
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\gdi.exe" "$OutDIR\gdi.exe"
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\unicode.bin" "$OutDIR\unicode.bin"

; 如果不是雙系統，就可以把此錯誤目錄刪了
   IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\C_950.nls" 0 RMOldDir
    return

BakAgainNT:
   IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\CP_950.nls" 0 +2
    return

RMOldDir:
   RMDir /r "$PROGRAMFILES\${My_PRODUCT}"
    return

;  沒有備份的 $R7_950.nls，直接備份。
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

; 6.3.1 中文化的讀我
; 通常塞在安裝的主目錄。

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

; 6.3.2 中文化的程式檔案

; 通常不使用 *.* 型態，而個別指定，以免包裝錯誤。
; 常常是 *.DLL *.EXE *.AX 等類型。我都把這類放在 cht 為首的工作目錄。
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
;  把 AppLocale 的 bug 解決掉 (xp/2k3 only)
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

;  將 c_950.nls 從 windows file protect 功能列表中移掉
   Delete $SYSDIR\dllcache\c_950.nls

;  第一次如果可以直接 rename ，就開機一次就生效。
  StrCmp $6 '1028' 0 NLS_OP
   Delete "$SYSDIR\C_950.nls"
   IfFileExists "$SYSDIR\C_950.nls" 0 NLS_OP

;  如果不行，還有一次 REBOOTOK 選項，但需要開機兩次才能生效。
;  這樣做是避免萬一第一次使用者無法寫入，按下 [Igore] 時，還有機會扳回局面。
;  ps: 只有使用中非 unicode 語系是繁中的 user 才需要重開兩次。
;    MessageBox MB_OK|MB_ICONEXCLAMATION "$(Lock950)"
     MessageBox MB_OK|MB_ICONEXCLAMATION "警告：$\n======$\n因為不明原因，你的 C_950.nls 已遭系統鎖定！$\n$\n你需要連續重新開機兩次，Unicode 補完計劃才會生效。"
   goto NLS_OP

NLS_98:
  File ".\Win\CP_950_H.BIN"
  File ".\Win\CP_950_U2B.BIN"
   FileOpen $FromNLS "CP_950.nls" r

   delete "$Outdir\cp_950.100"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g100 -b73 -e1250 cp_950.nls'
   delete "$Outdir\cp_950.101"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g101 -b65633 -e65634 cp_950.nls'

;取後半段開始點
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
;  使用 rebootOK 的項目，失敗的話會在下一次開機時自動重新命名。
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
;  把 NLS 字碼頁指回 $R7_950.nls (避免 2.00 當中的 .nls 鎖定)
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

   ;之前有安裝造字嗎?
   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "SystemDefaultEUDCFont"

   ;有裝的話，看看我們的備份在不在，如果在就不再重覆備份
   IfErrors 0 set_eudc
   StrCmp $R0 "" set_eudc

   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "BackupSystemDefaultEUDCFont"
   IfErrors 0 set_eudc

   ;備份
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
  ; 取得系統 Native 語言名稱
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
;; 找看看有沒有裝過「櫻花輸入法」，如果沒裝過，裝完後一併載入 preload 中

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
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E05E0404" "layout text" "櫻花"

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
; 6.4 加入到「開始選單」
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
; ■7.寫入解除安裝程式
;=======================================================
; 如果你嫌太難，可以不寫解除安裝程式，全部 remark 掉。

;==============================
; 7.1 節段開始

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Section "$(Item8)" SecItem8
  SectionIn 1 2 RO

;==============================
; 7.2 寫入到「註冊表」(基礎)
;
; 一般只有寫下面這一段，指定安裝目錄。

  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "Install_Dir" "$INSTDIR"

;==============================
; 7.3 寫入到「註冊表」 (* 進階)
;
; 下面這段註冊表值，只是在 {控制台 | 新增移除程式] 花俏用的。
; 如果看不懂，可以全部不使用。
; 參考  http://leoboard.cpatch.org/cgi-bin/topic.cgi?forum=2&topic=24&show=0

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "DisplayIcon" "$INSTDIR\${PROGMAINEXE}"       ; 一般使用這個型態。只有 MDaemon 例外。
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
; 7.4 依照各種語言，自動寫入不同的註冊表值 (* 進階)
; 包括 ENU/CHT/CHS
; ;------------------------------------------

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" "Comments" "$(REGMUI1)"

;==============================
; 7.5 依照各種語言，自動寫入不同的註冊表值 (* 進階)
; 包括 ENU/CHT/CHS
; ;------------------------------------------

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" "Publisher" "$(REGMUI2) (c) ${Publisher}"

;==============================
; 7.6 現在寫入「解除安裝程式」

; 寫入語言名稱到註冊表 (用於解除安裝程式)
  WriteRegStr HKLM "Software\${My_PRODUCT}" "Installer Language" $LANGUAGE
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "CP" $R7
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "OS" $R6
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "SysLang" $6
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ; 設定自動開機的旗標，NSIS 會詢問使用者是否願意重新開機。
; SetRebootFlag True

;    MessageBox MB_YESNO|MB_ICONQUESTION  "$(MSG_POSTINST)" IDNO No_reboot
;reboot
; No_reboot:

  MessageBox MB_OK|MB_ICONEXCLAMATION "$(MSG_POSTINST)"

SectionEnd


;==============================
; 7.8 顯示「完成」標頭

;如果不想使用「完成」頁面，在這個巨集之後插入。

;!insertmacro MUI_SECTIONS_FINISHHEADER

;=======================================================
; ■8.描述功能
;=======================================================

;==============================
; 8.1 描述功能的巨集 (* 進階)
;
; 如果有描述，最好一個一個加入巨集。
; 這一段要在所有的 section 之後，否則會出現「變數名稱沒有找到」。
; 如果 MUI_FUNCTION_DESCRIPTION_BEGIN 拆成兩段，會變成重覆呼叫，而導致錯誤。

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
; 8.2 每個節段的描述文字，直接使用各國語言 (* 進階)
;
; 這是讓滑鼠移動到安裝項目上時，自動出現的描述功能。
; 我使用 ENU/CHT/CHS 三個語言。如果嫌麻煩，可以只使用一個語言，甚至不使用描述。

 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_ENGLISH}     "The installer is already running."
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_TRADCHINESE} "安裝程式已正在執行"
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_SIMPCHINESE} "假蚾最唗眒淏婓堍俴"
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_JAPANESE}    "�C���X�g�[�������s�����������B"

 LangString MyCaption ${LANG_ENGLISH}     "Unicode-At-on (BIG5 Extension)"
 LangString MyCaption ${LANG_TRADCHINESE} "Unicode 補完計畫"
 LangString MyCaption ${LANG_SIMPCHINESE} "Unicode 硃俇數賒"
 LangString MyCaption ${LANG_JAPANESE}    "Unicode �����v��"
 LicenseLangString MyLicenseData ${LANG_ENGLISH}     "license-enu.rtf"
 LicenseLangString MyLicenseData ${LANG_SIMPCHINESE} "license-chs.rtf"
 LicenseLangString MyLicenseData ${LANG_TRADCHINESE} "license-cht.rtf"
 LicenseLangString MyLicenseData ${LANG_JAPANESE}    "license-jap.rtf"

  LangString MSG_NT_PREINST1 ${LANG_ENGLISH}        "(1) Make sure you are login as an Administrator privilege.  $\n$\n(2) Close the programs to prevent NLS locking by system.  If popup an message cannot write, please press [Ignore]$\n$\n(3) The installer will popup a Janapese charactor rename programs, please execute it directly.   If you executed the program before, just close it.$\n$\n(4) Finish setup and reboot your compute."
  LangString MSG_NT_PREINST1 ${LANG_TRADCHINESE}    "(1) 已確認你擁有 Administrator 權限$\n$\n(2) 請關閉其他所有程式，以避免 NLS 檔案遭系統鎖定。萬一跳出「無法寫入」，請直接按 [Ignore] 即可。$\n$\n(3) 安裝程式會跳出日文檔名更新程式，請直接執行。如果已經執行過，直接關閉該程式即可。$\n$\n(4) 安裝完重新開機後，就完成了。"
  LangString MSG_NT_PREINST1 ${LANG_SIMPCHINESE}    "(1) 眒�溜狦�茧衄 Administrator �使�$\n$\n(2) ③壽敕む坻垀衄最唗ㄛ眕旌轎 NLS 恅璃婈炵苀坶隅﹝勀珨粟堤☆拸楊迡�諢馳甭鄵掃荌� [Ignore] 撈褫﹝$\n$\n(3) 假蚾俇笭陔羲儂綴ㄛ憩俇傖賸﹝"
; LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) �����������������������������m�F�������������B$\n$\n(2) �uNLS �t�@�C���v���V�X�e�������b�N���������������A�����A�v���P�[�V���������U�I�������������B�u�����@�������v���\���������������A [��Ignore��] �������N���b�N�������������\�����B$\n$\n(3) �C���X�g�[�����I�����A���N�����������������B"
; LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) Administrator �������K�v�����B�m�F�������������B$\n$\n(2) ���s�������������E�B���h�[�����������������B NLS �t�@�C�������b�N���������������������B�u���������G���[�v���N���������A [Ignore] �����f�������������B$\n$\n(3) �C���X�g�[�����I���������A�V�X�e�������N���������������B"
  LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) Administrator �����������������������m�F�������������B$\n$\n(2) �uNLS �t�@�C���v���V�X�e�������b�N���������������A�����A�v���P�[�V���������U�I�������������B�u���������G���[�v���\���������������A [Ignore] �������N���b�N�������������\�����B$\n$\n(3) �C���X�g�[�����I�����A���N�����������������B"
  LangString MSG_9X_PREINST1 ${LANG_ENGLISH}        "This version will change the BIG5 mapping table, will affect Japanese charactor and EUDC font filename in you harddisk.  Please go to our forum to review detail explanation.  You need to take full responsibilities at your own risk.$\n$\nDue to Win98 OS limitation (Win2k no problem), solution need add-on steps.   $\n$\n(1) Install ChinaSea FontSet  $\n(2) change Win98 MingLiU (v2.10) to Win2k version (v3.21) for fulfilling unicode display.  $\n$\nTech details, read cpatch forum. http://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_TRADCHINESE}    "本版本會更動檔案系統的 BIG5 對應表，可能會影響你硬碟裡的日文、外字檔名。請到本軟體討論區參看該問題詳細說明，並在你對該問題負一切責任下安裝。$\n$\n由於 Win98 OS 限制 (2k 無此問題)，解決方案多一些步驟：$\n$\n(1) 繼續安裝中國海字集$\n(2) 手動更換「舊造字檔名」為「標準 Unicode 檔名」$\n(3) 手動更換 Win98 MingLiU.TTC (v2.10) 為 win2k 版本 (v3.21)，Unicode 字集顯示會更完備漂亮喔。$\n$\n技術細節，見 cpatch 中文化專業論壇。$\nhttp://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_SIMPCHINESE}    "蚕衾 Win98 OS 癹秶 (2k 拸森恀枙)ㄛ賤樵源偶嗣珨虳祭紬ㄩ $\n$\n忒馱載遙 Win98 MingLiu.TTC (v2.10) 峈 win2k 唳掛 (v3.21)ㄛUnicode 趼睫摩珆尨頗載俇掘か謠鉊﹝$\n$\n撮扲牉誹ㄛ獗 cpatch 笢恅趙蚳珛蹦抭﹝$\nhttp://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_JAPANESE}       "Win98 OS ������ (2k ������������������������)�������A�����@���������������������F$\n$\nWin98 �� MingLiU.TTC (v2.10) �� win2k �� (v3.21) �������������������AUnicode �����R�[�h���������������\�����������B$\n$\n�Z�p���������������������A�uCPatch �������������f�����v���m�F���������o�������B$\nhttp://leoboard.cpatch.org"

  LangString MSG_NO_IEPKTW_checked ${LANG_ENGLISH}        "Warning!!  You don't have any Tradition-Chinese Fonts!  Please install M$$-IE Traditional Chinese Suppliment first."
  LangString MSG_NO_IEPKTW_checked ${LANG_TRADCHINESE}    "警告！你沒有任何用於「繁體中文」的字型！請先安裝 IE 的「繁體中文支援」。"
  LangString MSG_NO_IEPKTW_checked ${LANG_SIMPCHINESE}    "劑豢ㄐ斕羶衄�庥扃譚琚虞捺樛倛纂僱儷筇憯﹊輴�假蚾 IE 腔☆楛极笢恅盓厥★﹝"
  LangString MSG_NO_IEPKTW_checked ${LANG_JAPANESE}       "�����I�u�扙����������v���t�H���g���C���X�g�[���������������I���� IE ���u�������������T�|�[�g�v���C���X�g�[���������������B"

  LangString MSG_NS_OS_checked ${LANG_ENGLISH}        "Installer has detected your OS as Win95/NT or Unknown.  It cannot install Unicode-at-on."
  LangString MSG_NS_OS_checked ${LANG_TRADCHINESE}    "安裝程式己偵測到你的作業系統是 Win95/NT or Unknown。無法安裝 Unicode 補完計畫。"
  LangString MSG_NS_OS_checked ${LANG_SIMPCHINESE}    "假蚾最唗眒潰聆善斕腔紱釬炵苀岆 Win95/NT or Unknown﹝拸楊假蚾 Unicode 硃俇數賒﹝"
  LangString MSG_NS_OS_checked ${LANG_JAPANESE}       "�����p�\�R�����I�y���[�e�B���O�V�X�e���� Win95/NT ���s�����������������o�����������B�uUnicode �����v���v���C���X�g�[�������������o���������B"
; LangString MSG_NS_OS_checked ${LANG_JAPANESE}       "�������妱S�� Win95/NT �����B Unicode �����v���������o�[�W�����妱S���T�|�[�g�������������B"

  LangString MSG_ME_SFP_checked ${LANG_ENGLISH}       "Installer has detected your OS as WinME。$\n$\nPlease make sure that you have removed (System File Protection) & (System Restore), otherwise Unicode-At-On should INSTALL FAILED. 。$\n$\nPress [OK] to continue install, $\nPress [Cancel] to open related webpage links and exit installer."
  LangString MSG_ME_SFP_checked ${LANG_TRADCHINESE}   "安裝程式己偵測到你的作業系統是 WinME。$\n$\n請確定你有事先移除「系統檔案保護 (System File Protection)」&「系統還原 (System Restore)」，否則「Unicode 補完計畫」一定會「安裝失敗」。$\n$\n按下 [確定] 繼續安裝。$\n按下 [取消] 開啟相關網頁連結，並離開安裝程式。"
  LangString MSG_ME_SFP_checked ${LANG_SIMPCHINESE}   "假蚾最唗眒潰聆善斕腔紱釬炵苀岆 WinME﹝$\n$\n③�毓乖蒑倇蟠�痄壺☆炵苀恅璃悵誘褲 (System File Protection)★&☆炵苀閥葩 (System File Protection)★ㄛ瘁寀☆Unicode 硃俇數賒★珨隅頗☆假蚾囮啖★﹝$\n$\n偌狟 [�毓沘 樟哿假蚾﹝$\n偌狟 [�＋�] 湖羲眈壽厙珜蟈諉ㄛ甜豖堤假蚾最唗﹝"
  LangString MSG_ME_SFP_checked ${LANG_JAPANESE}      "�����p�\�R�����I�y���[�e�B���O�V�X�e���� WinME ���������������o�����������B$\n$\n�u�V�X�e�� �t�@�C�� �����@�\ (System File Protection)�v&�u�V�X�e�� ���� (System Restore)�v���O�������������������m�F���������A���������uUnicode �����v墇�v���C���X�g�[�����K�����s�������B$\n$\n[OK] ���N���b�N���������B$\n[�L�����Z��] ���N���b�N�������A�y�[�W�������N���������A�C���X�g���[�V�������I���������B"
; LangString MSG_ME_SFP_checked ${LANG_JAPANESE}      "�������� OS �� WinME �����B$\n$\n�uSystem File Protection�v&�uSystem Restore�v�������@�\���������������AUnicode �����v�����������C���X�g�[���������������������B$\n$\n[OK] ���C���X�g�[�����J�������B$\n [�L�����Z��] ���C���X�g�[�����I���������B"

  LangString MSG_OLD_Mingliu_checked ${LANG_ENGLISH}     "Installer has detected your MINGLIU.TTC is old version not contained Japanese katagana. Please update MINGLIU.TTC, at leaset WinME and above version MINGLIU.TTC will have Japanese katagana.$\n$\nPress [OK] to continue install."
  LangString MSG_OLD_Mingliu_checked ${LANG_TRADCHINESE} "安裝程式己偵測到你的「細明體」是不含「日文假名」的舊版本，請你一定要更新「細明體」，至少要 WinME 以上版本的「細明體」才有「日文假名」。$\n$\n按下「確定」繼續安裝。"
  LangString MSG_OLD_Mingliu_checked ${LANG_SIMPCHINESE} "假蚾最唗眒潰聆善斕腔☆MingLiu.TTC★岆祥漪☆�梉躁棆�★腔導唳掛ㄛ③斕珨隅猁載陔☆MingLiu.TTC★ㄛ祫屾猁 WinME 眕奻唳掛腔☆MingLiu.TTC★符衄☆�梉躁棆�★﹝$\n$\n偌狟☆�毓芋匱昐灠終陛�"
  LangString MSG_OLD_Mingliu_checked ${LANG_JAPANESE}    "���������u���暸��iMingliu�G�������t�H���g�j�v���u�����v�������o�[�W���������B�K���u���暸��v���A�b�v�f�[�g�������������B$\n$\n�uOK�v���C���X�g�[�����J�������B"

  LangString MSG_OLD_Kaiu_checked ${LANG_ENGLISH}        "Installer has detected your KAIU.TTF is old version not contained Japanese katagana. Please update KAIU.TTF, at leaset WinME and above version KAIU.TTF will have Japanese katagana.$\n$\nPress [OK] to continue install."
  LangString MSG_OLD_Kaiu_checked ${LANG_TRADCHINESE}    "安裝程式己偵測到你的「標楷體」是不含「日文假名」的舊版本，請你一定要更新「標楷體」，至少要 WinME 以上版本的「標楷體」才有「日文假名」。$\n$\n按下「確定」繼續安裝。"
  LangString MSG_OLD_Kaiu_checked ${LANG_SIMPCHINESE}    "假蚾最唗眒潰聆善斕腔☆Kaiu.TTF★岆祥漪☆�梉躁棆�★腔導唳掛ㄛ③斕珨隅猁載陔☆Kaiu.TTF★ㄛ祫屾猁 WinME 眕奻唳掛腔☆Kaiu.TTF★符衄☆�梉躁棆�★﹝$\n$\n偌狟☆�毓芋匱昐灠終陛�"
  LangString MSG_OLD_Kaiu_checked ${LANG_JAPANESE}       "���������u�W�脤��iKaiu�G�������t�H���g�j�v���u�����v�������o�[�W���������B�K���u�W�脤��v���A�b�v�f�[�g�������������B$\n$\n�uOK�v���C���X�g�[�����J�������B"

  LangString MSG_Admin_checked ${LANG_ENGLISH}      "You are has no System Administrator privilege. You can not continue install."
  LangString MSG_Admin_checked ${LANG_TRADCHINESE}  "你不具有「系統管理員」權限，無法繼續安裝。"
  LangString MSG_Admin_checked ${LANG_SIMPCHINESE}  "斕祥撿衄☆炵苀奪燴埜★�使煚疥瑀釆昐灠終陛�"
  LangString MSG_Admin_checked ${LANG_JAPANESE}     "���������uAdministrator�v�������������������������A�C���X�g�[�������������B"

  LangString REGMUI1 ${LANG_ENGLISH}     "Chinese (P.R.C.) and Chinese (Taiwan) ${My_PRODUCT} localized version by Kii Ali. Unicode At-on (Big5 Extension) with a method my mapping unicode/ansi, extend old BIG5 system compatibilities, and increase the number 2 bytes charactor for display and printing.  Solving problem on Disply and Printing in: Japanese charactor, Simplified Charactor, and China-Sea Charactor."
  LangString REGMUI1 ${LANG_TRADCHINESE} "中文 (中國大陸) 與 中文 (臺灣) ${My_PRODUCT} 本地化版本，由 Kii Ali 製作。 Unicode 補完計畫 (Big5 Extension) 以 unicode/ansi 對應的方式 (而非造字方式) ，擴充舊的 BIG5 在各種系統的相容度，與增加可顯示與列印的 2 位元字元。並解決以下的列印與顯示問題: 日文片假名平假名、簡體中文、以及中國海字集。"
  LangString REGMUI1 ${LANG_SIMPCHINESE} "笢恅 (笢弊湮翻) 迵 笢恅 (怢俜) ${My_PRODUCT} 掛華趙唳掛ㄛ蚕 Kii Ali 秶釬﹝ Unicode 硃俇數賒 (Big5 Extension) 眕 unicode/ansi 茬扞腔源宒 (奧準婖趼源宒) ㄛ孺喃導腔 BIG5 婓跪笱炵苀腔潭�搋�ㄛ迵崝樓褫珆尨迵湖荂腔 2 弇啋趼睫﹝甜賤樵眕狟腔湖荂迵珆尨恀枙: �梉飄狩棆�す樑靡﹜潠极笢恅﹜眕摯笢弊漆趼睫摩﹝"
  LangString REGMUI1 ${LANG_JAPANESE}    "${My_PRODUCT} ���{���o�[�W�����B Unicode �����v�� (Big5 Extension) ���A���j�R�[�h�贛IG5�R�[�h���}�b�s���O�������������@���g���������A�������O���������������l�������������B Unicode �����v�����C���X�g�[���������A���{���妱S�����ABIG5�R�[�h���������������������������������������B"

  LangString REGMUI2 ${LANG_ENGLISH}     "Copyright"
  LangString REGMUI2 ${LANG_TRADCHINESE} "版權所有"
  LangString REGMUI2 ${LANG_SIMPCHINESE} "唳�佯齾�"
  LangString REGMUI2 ${LANG_JAPANESE}    "�������L��"

; LangString MSG_POSTINST ${LANG_ENGLISH}        "You need to REBOOT to make effect of installation.  Press [Yes] to restart immediately, [No] to restart later manually."
; LangString MSG_POSTINST ${LANG_TRADCHINESE}    "你需要重新啟動，以便使安裝生效。按下 [Yes] 立即重新啟動。[No] 稍後再自行重新啟動。"
; LangString MSG_POSTINST ${LANG_SIMPCHINESE}    "斕剒猁笭陔ゐ雄ㄛ眕晞妏假蚾汜虴﹝偌狟 [Yes] 蕾撈笭陔ゐ雄﹝[No] 尕綴婬赻俴笭陔ゐ雄﹝"
; LangString MSG_POSTINST ${LANG_JAPANESE}       "Unicode �����v�����������������A���N�����������������������B [Yes] ���N���b�N�������N���������B [No] ���N���b�N�������A�������N���������������B"
  LangString MSG_POSTINST ${LANG_ENGLISH}        "You need to REBOOT to make effect of installation.$\n$\nRestart later manually, please."
  LangString MSG_POSTINST ${LANG_TRADCHINESE}    "你需要重新啟動，以便使安裝生效。$\n$\n請自行重新啟動。"
  LangString MSG_POSTINST ${LANG_SIMPCHINESE}    "斕剒猁笭陔ゐ雄ㄛ眕晞妏假蚾汜虴﹝$\n$\n③赻俴笭陔ゐ雄﹝"
  LangString MSG_POSTINST ${LANG_JAPANESE}       "Unicode �����v�����������������A���N�����������������������B$\n$\n�������N���������������B"
  LangString un.MSG_POSTINST ${LANG_ENGLISH}     "You need to REBOOT to make effect of uninstallation.  Press [Yes] to restart immediately, [No] to restart later manually."
  LangString un.MSG_POSTINST ${LANG_TRADCHINESE} "你需要重新啟動，以便使解除安裝生效。按下 [Yes] 立即重新啟動。[No] 稍後再自行重新啟動。"
  LangString un.MSG_POSTINST ${LANG_SIMPCHINESE} "斕剒猁笭陔ゐ雄ㄛ眕晞妏賤壺假蚾汜虴﹝偌狟 [Yes] 蕾撈笭陔ゐ雄﹝[No] 尕綴婬赻俴笭陔ゐ雄﹝"
  LangString un.MSG_POSTINST ${LANG_JAPANESE}    "�A���C���X�g�[�����������������A���N�����������������������B [Yes] ���N���b�N�������N���������B [No] ���N���b�N�������A�������N���������������B"

  LangString FILENAME_README  ${LANG_ENGLISH}     "${MyFileName}.txt"
  LangString FILENAME_README  ${LANG_TRADCHINESE} "${MyFileName}.txt"
  LangString FILENAME_README  ${LANG_SIMPCHINESE} "${MyFileName}_gb.txt"
  LangString FILENAME_README  ${LANG_JAPANESE}    "${MyFileName}.txt"
  LangString FILENAME_history ${LANG_ENGLISH}     "history.txt"
  LangString FILENAME_history ${LANG_TRADCHINESE} "history.txt"
  LangString FILENAME_history ${LANG_SIMPCHINESE} "history_gb.txt"
  LangString FILENAME_history ${LANG_JAPANESE}    "history.txt"

  LangString Sakura_layouttext_0404 ${LANG_ENGLISH}     "Chinese (Traditional) - Unicode Sakura"
  LangString Sakura_layouttext_0404 ${LANG_TRADCHINESE} "中文 (繁體) - Unicode 櫻花"
  LangString Sakura_layouttext_0404 ${LANG_SIMPCHINESE} "笢恅 (楛极) - Unicode 茛豪"
  LangString Sakura_layouttext_0404 ${LANG_JAPANESE}    "�扙��������� - Unicode ����"
  LangString Sakura_layouttext_0804 ${LANG_ENGLISH}     "Chinese (Simplified) - Unicode Sakura"
  LangString Sakura_layouttext_0804 ${LANG_TRADCHINESE} "中文 (簡体) - Unicode 櫻花"
  LangString Sakura_layouttext_0804 ${LANG_SIMPCHINESE} "笢恅 (潠极) - Unicode 茛豪"
  LangString Sakura_layouttext_0804 ${LANG_JAPANESE}    "������������ - Unicode ����"

  LangString Japan_layouttext_0404 ${LANG_ENGLISH}     "Chinese (Traditional) - Unicode Japan"
  LangString Japan_layouttext_0404 ${LANG_TRADCHINESE} "中文 (繁體) - Unicode 日文"
  LangString Japan_layouttext_0404 ${LANG_SIMPCHINESE} "笢恅 (楛极) - Unicode �梉�"
  LangString Japan_layouttext_0404 ${LANG_JAPANESE}    "�扙��������� - Unicode ���{������"
  LangString Japan_layouttext_0804 ${LANG_ENGLISH}     "Chinese (Simplified) - Unicode Japan"
  LangString Japan_layouttext_0804 ${LANG_TRADCHINESE} "中文 (簡体) - Unicode 日文"
  LangString Japan_layouttext_0804 ${LANG_SIMPCHINESE} "笢恅 (潠极) - Unicode �梉�"
  LangString Japan_layouttext_0804 ${LANG_JAPANESE}    "������������ - Unicode ���{������"

; LangString Lock950 ${LANG_ENGLISH}     "Warning:$\n======$\nYour C_950.nls was locked by OS with unknown reason.$\n$\nYou need to reboot twice to make Unicode-at-on take effect."
; LangString Lock950 ${LANG_TRADCHINESE} "警告：$\n======$\n因為不明原因，你的 C_950.nls 已遭系統鎖定！$\n$\n你需要連續重新開機兩次，Unicode 補完計劃才會生效。"
; LangString Lock950 ${LANG_SIMPCHINESE} "劑豢ㄩ$\n======$\n秪峈祥隴埻秪ㄛ斕腔 C_950.nls 眒婈炵苀坶隅ㄐ$\n$\n斕剒猁蟀哿笭陔羲儂謗棒ㄛUnicode 硃俇數赫符頗汜虴﹝"
; LangString Lock950 ${LANG_JAPANESE}    "�����F$\n======$\n�s�����������C C_950.nls ���V�X�e�������b�N�����������I$\n$\nUnicode �����v�����������������A OS ���u2���v���N�����������������������B"

; LangString Lock950un ${LANG_ENGLISH}     "Warning:$\n======$\nYour C_950.nls was locked by OS with unknown reason.$\n$\nYou need to reboot twice to make Unicode-at-on uninstallation."
; LangString Lock950un ${LANG_TRADCHINESE} "警告：$\n======$\n因為不明原因，你的 C_950.nls 已遭系統鎖定！$\n$\n你需要連續重新開機兩次，才能完成移除。"
; LangString Lock950un ${LANG_SIMPCHINESE} "劑豢ㄩ$\n======$\n秪峈祥隴埻秪ㄛ斕腔 C_950.nls 眒婈炵苀坶隅ㄐ$\n$\n斕剒猁蟀哿笭陔羲儂謗棒ㄛ符夔俇傖痄壺﹝"
; LangString Lock950un ${LANG_JAPANESE}    "�����F$\n======$\n�s�����������C C_950.nls ���V�X�e�������b�N�����������I$\n$\n�A���C���X�g�[�����������������A OS ���u2���v���N�����������������������B"

  LangString GetAnotherOne ${LANG_ENGLISH}     "Waringing:$\n======$\n    Because the other OS (98/me 或 2k/xp/2k3) on this computer has already installed Unicode-at-on, the directory cannot be removed.$\n$\nPS: When uninstall unicode-at-on on the other OS, the directory will be removed."
  LangString GetAnotherOne ${LANG_TRADCHINESE} "警告：$\n======$\n    因為你此台電腦的另一系統 (98/me 或 2k/xp/2k3) 也有裝 unicode 補完計劃，所以此目錄無法移除。$\n$\nPS: 當你另一系統上的 unicode 補完計劃移除時，此目錄才會一併移除。"
  LangString GetAnotherOne ${LANG_SIMPCHINESE} "劑豢ㄩ$\n======$\n    秪峈斕森怢數呾儂腔鍚珨炵苀 (98/me 麼 2k/xp/2k3) 珩衄蚾 unicode 硃俇數赫ㄛ垀眕森醴翹拸楊痄壺﹝$\n$\nPS: 絞斕鍚珨炵苀奻腔 unicode 硃俇數赫痄壺奀ㄛ森醴翹符頗珨甜痄壺﹝"
  LangString GetAnotherOne ${LANG_JAPANESE}    "�����F$\n======$\n    �����R���s���[�^�������妱S (98/me �� 2k/xp/2k3) �� Unicode �����v�����C���X�g�[�����������������A�t�H���_���������������������B$\n$\nPS: ���妱S�� Unicode �����v�����C���X�g�[�������������C�t�H���_�������������B"

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

  LangString DESC_InstTypeMinimum ${LANG_TRADCHINESE} "最小安裝"
  LangString DESC_InstTypeStandard ${LANG_TRADCHINESE} "標準安裝"

  LangString Item1 ${LANG_TRADCHINESE} "Unicode 補完計畫核心"
  LangString Item2 ${LANG_TRADCHINESE} "櫻花輸入法"
  LangString Item2eudc ${LANG_TRADCHINESE} "補充造字檔"
  LangString Item3 ${LANG_TRADCHINESE} "Unicode 日文輸入法"
  LangString Item3ime ${LANG_TRADCHINESE} "MS 日文 IME 輸入法"
  LangString Item4 ${LANG_TRADCHINESE} "日文假名檔名轉換程式"
  LangString Item5 ${LANG_TRADCHINESE} "HTML文件外字相容轉換器"
  LangString Item6 ${LANG_TRADCHINESE} "桌布顯示"
  LangString Item7 ${LANG_TRADCHINESE} "開始功能表捷徑"
  LangString Item8 ${LANG_TRADCHINESE} "建立解除安裝程式"

  LangString DESC_SecItem1 ${LANG_TRADCHINESE} "BIG5 的擴張字集。不再有缺字、無法顯示、空白、亂碼"
  LangString DESC_SecItem2 ${LANG_TRADCHINESE} "方便你輸入日文假名。"
  LangString DESC_SecItem2eudc ${LANG_TRADCHINESE} "補充一些「細明體」沒有的字。$\n$\n※注意：$\n如果你有裝「中國海字集」，此項請取消安裝。"
  LangString DESC_SecItem3 ${LANG_TRADCHINESE} "與櫻花同樣，但重碼字較少，適合對日文較熟悉的人士。"
  LangString DESC_SecItem3ime ${LANG_TRADCHINESE} "MS 日文 IME。"
  LangString DESC_SecItem4 ${LANG_TRADCHINESE} "把舊的日文假名檔名，轉換為新的 Unicode 檔名。"
  LangString DESC_SecItem5 ${LANG_TRADCHINESE} "將你的 BIG5 HTML 文件中所使用到的外字，轉換成每個人都看得到的形式。"
  LangString DESC_SecItem6 ${LANG_TRADCHINESE} "安裝看看，我們花了很多心思畫喔，需要啟用 Active Desktop"
  LangString DESC_SecItem7 ${LANG_TRADCHINESE} "加入捷徑到開始功能表"
  LangString DESC_SecItem8 ${LANG_TRADCHINESE} "建立解除安裝程式"

  LangString SC1   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\解除安裝 Unicode 補完計畫.lnk"
  LangString SC2   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\讀我檔案.lnk"
  LangString SC3   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\版本歷史.lnk"
  LangString SC4   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\日文假名檔名轉換程式.lnk"
  LangString SC5   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 補完計畫首頁.lnk"
  LangString SC6   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 補完計畫論壇.lnk"
  LangString SC7   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\測試頁 - 日文假名.lnk"
  LangString SC8   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\測試頁 - 簡體中文.lnk"
  LangString SC9   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\HTML文件外字相容轉換器.lnk"

  LangString DESC_InstTypeMinimum ${LANG_SIMPCHINESE} "郔苤假蚾"
  LangString DESC_InstTypeStandard ${LANG_SIMPCHINESE} "梓袧假蚾"

  LangString Item1 ${LANG_SIMPCHINESE} "Unicode 硃俇數賒瞄陑"
  LangString Item2 ${LANG_SIMPCHINESE} "茛豪怀�賰�"
  LangString Item2eudc ${LANG_SIMPCHINESE} "硃喃婖趼紫"
  LangString Item3 ${LANG_SIMPCHINESE} "Unicode �梉騫靿賰�"
  LangString Item3ime ${LANG_SIMPCHINESE} "MS �梉� IME 怀�賰�"
  LangString Item4 ${LANG_SIMPCHINESE} "�梉躁棆�恅璃靡蛌遙最唗"
  LangString Item5 ${LANG_SIMPCHINESE} "HTML恅璃俋趼潭�楈盂酴�"
  LangString Item6 ${LANG_SIMPCHINESE} "Х祧珆尨"
  LangString Item7 ${LANG_SIMPCHINESE} "羲宎粕等辦豎源宒"
  LangString Item8 ${LANG_SIMPCHINESE} "斐膘賤壺假蚾最唗"

  LangString DESC_SecItem1 ${LANG_SIMPCHINESE} "BIG5 腔孺桲趼睫摩﹝祥婬衄�斜痋卅瑀使埰鴃Ⅶ桹蛂Ⅹ畟�"
  LangString DESC_SecItem2 ${LANG_SIMPCHINESE} "源晞斕怀�躽梉躁棆�﹝"
  LangString DESC_SecItem2eudc ${LANG_SIMPCHINESE} "硃喃珨虳☆Mingliu.TTC★羶衄腔趼﹝"
  LangString DESC_SecItem3 ${LANG_SIMPCHINESE} "迵茛豪肮欴ㄛ筍笭鎢趼誕屾ㄛ巠磁勤�梉躅珅嬥今饑侕縑�"
  LangString DESC_SecItem3ime ${LANG_SIMPCHINESE} "MS �梉� IME﹝"
  LangString DESC_SecItem4 ${LANG_SIMPCHINESE} "參導腔�梉躁棆�恅璃靡ㄛ蛌遙峈陔腔 Unicode 恅璃靡﹝"
  LangString DESC_SecItem5 ${LANG_SIMPCHINESE} "蔚斕腔 BIG5 HTML 恅璃笢垀妏蚚善腔俋趼ㄛ蛌遙傖藩跺�侀撚斯警蔥鹹恀翩�"
  LangString DESC_SecItem6 ${LANG_SIMPCHINESE} "假蚾艘艘ㄛ扂蠅豪賸竭嗣陑佷賒鉊ㄛ剒猁ゐ蚚 Active Desktop"
  LangString DESC_SecItem7 ${LANG_SIMPCHINESE} "氝樓辦豎源宒善羲宎粕等"
  LangString DESC_SecItem8 ${LANG_SIMPCHINESE} "斐膘賤壺假蚾最唗"

  LangString SC1   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\賤壺假蚾 Unicode 硃俇數賒.lnk"
  LangString SC2   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\赻扴恅璃.lnk"
  LangString SC3   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\唳掛盪妢.lnk"
  LangString SC4   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\�梉躁棆�恅璃靡蛌遙最唗.lnk"
  LangString SC5   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 硃俇數賒翋珜.lnk"
  LangString SC6   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode 硃俇數賒蹦抭.lnk"
  LangString SC7   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\聆彸珜 - �梉躁棆�.lnk"
  LangString SC8   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\聆彸珜 - 潠极笢恅.lnk"
  LangString SC9   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\HTML恅璃俋趼潭�楈盂酴�.lnk"

  LangString DESC_InstTypeMinimum ${LANG_JAPANESE} "�V���v���C���X�g�[��"
  LangString DESC_InstTypeStandard ${LANG_JAPANESE} "�W���C���X�g�[��"

  LangString Item1 ${LANG_JAPANESE} "Unicode �����v���J�[�l��"
  LangString Item2 ${LANG_JAPANESE} "Unicode ���髟ME"
  LangString Item2eudc ${LANG_JAPANESE} "�O���t�@�C��"
  LangString Item3 ${LANG_JAPANESE} "Unicode ���{�熿ME"
  LangString Item3ime ${LANG_JAPANESE} "MS ���{�� IME"
  LangString Item4 ${LANG_JAPANESE} "���{�������t�@�C���������v���O����"
  LangString Item5 ${LANG_JAPANESE} "HTML�h�L�������gMS950�����v���O����"
  LangString Item6 ${LANG_JAPANESE} "�����\��"
  LangString Item7 ${LANG_JAPANESE} "�X�^�[�g���j���[�V���b�g�J�b�g"
  LangString Item8 ${LANG_JAPANESE} "�A���C���X�g�[��"

  LangString DESC_SecItem1 ${LANG_JAPANESE} "BIG5���g�������W�B�������膢IG5�����������������I"
  LangString DESC_SecItem2 ${LANG_JAPANESE} "���������������������������������B"
  LangString DESC_SecItem2eudc ${LANG_JAPANESE} "�u���暸��v�����������������������B"
  LangString DESC_SecItem3 ${LANG_JAPANESE} "�u�����v�������������A�u�d朅���v���������A���{�������������������K�����������B"
  LangString DESC_SecItem3ime ${LANG_JAPANESE} "MS ���{�� IME"
  LangString DESC_SecItem4 ${LANG_JAPANESE} "�����������������������t�@�C�������A�V���� Unicode �t�@�C�����������������B"
  LangString DESC_SecItem5 ${LANG_JAPANESE} "BIG5�z�[���y�[�W���������������A�N�����������������]���������v���O�����B"
  LangString DESC_SecItem6 ${LANG_JAPANESE} "Windows�����������i���j�B Active Desktop ���K�v�����B"
  LangString DESC_SecItem7 ${LANG_JAPANESE} "�X�^�[�g���j���[���V���b�g�J�b�g�����������B"
  LangString DESC_SecItem8 ${LANG_JAPANESE} "�A���C���X�g�[��"

  LangString SC1   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �����v�� ����������.lnk"
  LangString SC2   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\READ ME�i�������j.lnk"
  LangString SC3   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\�o�[�W���������i�������j.lnk"
  LangString SC4   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\���{�������t�@�C���������v���O����.lnk"
  LangString SC5   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �����v�� �z�[���y�[�W.lnk"
  LangString SC6   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �����v�� �t�H�[�����i�������j.lnk"
  LangString SC7   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\�e�X�g�y�[�W - ����.lnk"
  LangString SC8   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\�e�X�g�y�[�W - ������������.lnk"
  LangString SC9   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\HTML�h�L�������gMS950�����v���O����.lnk"
;=======================================================
; ■9.解除安裝程式，真正的動作
;=======================================================
; 這個部分，和前面的建立 CreateUninst ，意味不一樣喔。
; 前者: 把 uninstaller 程式做出來。
; 後者: 指定這個程式，要刪除那些檔案/目錄/註冊表項。

;==============================
; 9.1 節段開始

Section "Uninstall"

; 要移除掉解除安裝程式

  ; 移除開始功能表、桌面、快遞啟動等捷徑。
   Rename "$INSTDIR\Backup\$R7_950.nls" "$SYSDIR\$R7_950-.NLS"
   StrCmp $R6 '98' UnNLS98
    StrCmp $6 '1028' UnNLS98
     Delete "$SYSDIR\C_950.NLS"
     IfFileExists "$SYSDIR\C_950.NLS" +2
;      Rename "$SYSDIR\C_950-.nls" "$SYSDIR\C_950.nls"
;     goto UnRenOK
      MessageBox MB_OK|MB_ICONEXCLAMATION "警告：$\n======$\n因為不明原因，你的 C_950.nls 已遭系統鎖定！$\n$\n你需要連續重新開機兩次，才能完成移除。"

UnNLS98:
  Rename /REBOOTOK "$SYSDIR\$R7_950-.nls" "$SYSDIR\$R7_950.nls"
  StrCmp '98' 0 UnRenOK
   Delete /rebootok "$SYSDIR\UAO-EUDC.TTE"
   StrCmp $6 '1028' 0 +5
    Rename "$INSTDIR\Backup\unicode.bin" "$SYSDIR\unicode-.bin"
    Rename "$INSTDIR\Backup\gdi.exe" "$SYSDIR\GDI-.EXE"
    Rename /rebootok "$SYSDIR\unicode-.bin" "$SYSDIR\unicode.bin"
    Rename /rebootok "$SYSDIR\gdi-.exe" "$SYSDIR\GDI.EXE"

   ;造字備份在不在?
   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "BackupSystemDefaultEUDCFont"

   ;造字備份在的話，寫回原始值；
   ;不在的話，看看是否是填入我們的造字檔，是的話，清掉此機碼。
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

  ; 刪除 2.00 版本留下者。
  IfFileExists "$SYSDIR\$R7_950cs.nls" 0 +2
   Delete /rebootok "$SYSDIR\$R7_950cs.nls"

  StrCmp $R6 '98' +2
  ; 檢查看看是否為雙系統，若是，則不移除 $instdir 目錄
   IfFileExists "$INSTDIR\Backup\CP_950.nls" nodel200 del_instdir

  ; 檢查看看是否為雙系統，若是，則不移除 $instdir 目錄
   IfFileExists "$INSTDIR\Backup\C_950.nls" 0 del_instdir

nodel200:
  MessageBox MB_OK|MB_ICONINFORMATION  "$(GetAnotherOne)"
  goto del_instdir_ok

del_instdir:
  ; 移除使用過的目錄。
  RMDir /r "$INSTDIR"

del_instdir_ok:
  ; 移除開始功能表、桌面、快遞啟動等捷徑。
  RMDir /r "$SMPROGRAMS\${My_PRODUCT}"

  ; 刪除 windows 註冊表之中的安裝路徑
  DeleteRegKey HKLM SOFTWARE\${My_PRODUCT}

  ; 刪除 windows 註冊表的解除安裝
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}"

  ; 刪除滑鼠右鍵
;DeleteRegKey HKLM "SOFTWARE\Classes\CLSID\{b5eedee0-c06e-11cf-8c56-444553540000}\InProcServer32"
;DeleteRegKey HKLM "SOFTWARE\Classes\CLSID\{b5eedee0-c06e-11cf-8c56-444553540000}"

  ; 刪除 uninstaller 使用的語言名稱 (* 進階)
  DeleteRegValue HKLM "Software\${My_PRODUCT}" "Installer Language"

  ;顯示「完成」標頭 (* 進階)
;  !insertmacro MUI_UNFINISHHEADER

  StrCmp $R6 '2k3' 0 No2k3
   ;還原對 Windows File Protect 列表的修改
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
; ■4.安裝程式，安裝開始的前置動作 (* 進階)
;=======================================================
; 如果不需要，你可以全部 remark。

Function .onInit
; 偵測 OS & 系統語言
; $6  傳回 語言 (dec)。
; $7  傳回 語言 (hex)。
; $R6 傳回 OS。
; $R7 傳回 OS 的 nls 代碼。98=CP、NT=C。
;檢查 os 目前語言，若非 0x0404 (台灣) or 0x0c04 (香港)，則 quit
System::Call 'kernel32::GetSystemDefaultLangID() i .r6'
IntOp $6 $6 & 0xFFFF

; IntFmt 的 Format string 格式
; %c = %@Char[] = 「ascii 數字」→「字元」
; %u = %@Ascii[] = 「字元」→「ascii 數字」
; %x = 十進位 → 十六進位 小寫
; %X = 十進位 → 十六進位 大寫
; %0數字X = 十進位 → 十六進位 大寫，共「數字」位數，不足的話在前方補 0。
IntFmt $7 "%04X" $6

; TW=1028, HK=3076, 澳門=5124, GB=2052, 新加坡=4100, JP=1041 => EN=1033=All Others
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

; 順便設定「語言」
StrCpy $LANGUAGE $6

StrCmp $r1 'HK' 0 +3
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "警告！安裝程式發現你使用的是『香港／澳門語系』的 Windows。$\n$\n請注意！$\n$\n「Unicode 補完計畫」與『港澳地區』所通用的「香港政府增補造字集 (HKSCS)」並不相容，若你有使用「香港字」的需求，繼續安裝本軟體，將可能導致許多異常現象發生。$\n$\n請問要繼續嗎？" IDYES +2
 Quit

; 給定旗標初值
StrCpy $FTPageLicense "0"       ;PageLicense 的旗標，執行過一次後就會被幹掉了
StrCpy $FTPageCompoment "0"     ;PageCompoment 的旗標，執行過一次後就會被幹掉了
StrCpy $R7 'CP'

; 取得系統的「預設瀏覽器」
ReadRegStr $Def3WBrowser HKCR "http\shell\open\command" ""
StrLen $r1 $Def3WBrowser
IntOP $r1 $r1 - 10
StrCpy $r2 $Def3WBrowser 10 $r1
StrCmp $r2 ' -url "%1"' 0 +2
 StrCpy $Def3WBrowser $Def3WBrowser $r1

;==============================
; 4.2 字型選擇  (* 進階)
;
; 只影響安裝程式的語言選擇 dialog ，因此不要使用中文字型名稱。
; Push Verdana
; Push 9

;==============================
; 4.4 安裝前置動作 (修改註冊表) (* 進階)
;
; 視你需要，可以偷偷做一些動作。

;==============================
; 4.5 尋找舊版已安裝的目錄。 (* 進階)
;
; 如果 "Install_Dir" 讀出的尾端有 \ 符號，就把 \ 去掉。

  ReadRegStr $0 HKLM "Software\${My_PRODUCT}" "Install_Dir"
  StrLen $1 $0
  StrCmp $1 '0' Final_onInit
   IntOP $1 $1 - 1
   StrCpy $2 $0 1 $1
   StrCmp $2 '\' +2
    IntOP $1 $1 + 1
   StrCpy $INSTDIR $0 $1

Final_onInit:
; 修改 BIG5_Extension 2.10 2.00 留下的殘餘。
   DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BIG5_Extension"

;InitPluginsDir
File /oname=$PLUGINSDIR\license1028.txt "1028license.txt"
File /oname=$PLUGINSDIR\license1033.txt "1033license.txt"
File /oname=$PLUGINSDIR\license1041.txt "1041license.txt"
File /oname=$PLUGINSDIR\license2052.txt "2052license.txt"
FunctionEnd
;===============================================================================
;;==============================
;; 4.3 語言 (* 進階)
;;
;; 塞了 ENU/CHT/CHS 三個語言。你要 18 個語言全塞，也不反對。大小大概增加 20 kb 左右。
;; 如果不是多語言中文化安裝，你可以全部 remark 掉。
;; LangDLL::LangDialog "MUI_LANGDLL_WINDOWTITLE" "MUI_LANGDLL_INFO" 可選擇語言數目 語言1 語言代碼1 語言2 語言代碼2 語言3 語言代碼3 語言4 語言代碼4
;LangString IL ${LANG_ENGLISH}     "Installer Language"
;LangString IL ${LANG_TRADCHINESE} "安裝語言"
;LangString IL ${LANG_SIMPCHINESE} "假蚾逄晟"
;LangString IL ${LANG_JAPANESE}    "Installer Language"
;LangString CL ${LANG_ENGLISH}     "Please select a language."
;LangString CL ${LANG_TRADCHINESE} "請選擇您要的安裝語言"
;LangString CL ${LANG_SIMPCHINESE} "③恁寁斕猁腔假蚾逄晟"
;LangString CL ${LANG_JAPANESE}    "Please select a language."
;LangString ENG ${LANG_ENGLISH}     "英語EN"
;LangString ENG ${LANG_TRADCHINESE} "英語"
;LangString ENG ${LANG_SIMPCHINESE} "荎恅"
;LangString ENG ${LANG_JAPANESE}    "英語JP"
;LangString ROC ${LANG_ENGLISH}     "繁體中文EN"
;LangString ROC ${LANG_TRADCHINESE} "繁體中文"
;LangString ROC ${LANG_SIMPCHINESE} "楛极笢恅"
;LangString ROC ${LANG_JAPANESE}    "�扙���������"
;LangString PRC ${LANG_ENGLISH}     "簡體中文EN"
;LangString PRC ${LANG_TRADCHINESE} "簡體中文"
;LangString PRC ${LANG_SIMPCHINESE} "潠极笢恅"
;LangString PRC ${LANG_JAPANESE}    "������������"
;LangString JAP ${LANG_ENGLISH}     "日語EN"
;LangString JAP ${LANG_TRADCHINESE} "日語"
;LangString JAP ${LANG_SIMPCHINESE} "�梉�"
;LangString JAP ${LANG_JAPANESE}    "���{��"
;
; 以下分為兩個方法：
;
; 方法一，使用 MUI 的方法：
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
; 方法一結束。
;
; 方法二，不使用 MUI 的方法：
; LangDLL::LangDialog "$(IL)" "$(CL)" 4 "English $(ENG)" 1033 "Chinese (Traditional) $(ROC)" 1028 "Chinese (Simplified) $(PRC)" 2052 "Japanese $(JAP)" 1041
; Pop $LANGUAGE
; StrCmp $LANGUAGE "cancel" 0 LangSelOK
;    Abort
;;LangSelOK:
; 方法二結束。
;===============================================================================
Function popup_message
StrCmp $FTPageLicense "0" +2
 return
StrCpy $FTPageLicense "1"

;; 禁止「重進入」
System::Call 'kernel32::CreateMutexA(i 0, i 0, t "KiiAliButHoWitchFive") i .r1 ?e'
Pop $R0
StrCmp $R0 '0' +3
 MessageBox MB_OK|MB_ICONSTOP "$(MSG_RunOnesAtTheSameTime_checked)"
 Quit
;==============================
; 4.1 顯示版權影像
;
; 舊版可使用 magiclime 做淡入淡出。不過這一版沒了，改成
; advsplash ，外掛方式。解壓縮到臨時目錄，顯示 splash ，然後刪掉。
; 注意: nsis 2.0a0 有 magicsplash 檔案。不過 2.0b1 居然又不見了。

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

;沒裝「ie 繁體中文支援」的傢伙，不給裝。
StrCmp $6 "1028" +4
 IfFileExists "$Fonts\Mingliu.ttc" +3
  MessageBox MB_OK|MB_ICONSTOP "$(MSG_NO_IEPKTW_checked)"
  Quit

; 檢查作業系統版本，然後把 Win98_checked 放在檔案尾端，加警告視窗。
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
     MessageBox MB_OK|MB_ICONEXCLAMATION "注意：$\n$\nWindows 98/SE/ME 版本為 Alpha release$\n$\n請在閱讀所有文件、自己負責的前提下安裝。"
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
   MessageBox MB_YESNO|MB_ICONEXCLAMATION "警告！安裝程式發現你已經安裝了「香港政府增補造字集 (HKSCS)」。$\n$\n「Unicode 補完計畫」與 HKSCS 並不相容，繼續安裝「Unicode 補完計畫」將導致 HKSCS 失效。$\n$\n確定要繼續嗎？" IDYES +2
   Quit

;再測一次，沒裝「ie 繁體中文支援」的傢伙，不給裝。
StrCmp $6 "1028" +4
 IfFileExists "$SysDir\$R7_950.NLS" +3
  MessageBox MB_OK|MB_ICONSTOP "$(MSG_NO_IEPKTW_checked)"
  Quit

;因此版要用 command.com，如果沒有 command.com 的人，不給裝。
StrCpy $ComPath '$windir'
IfFileExists "$ComPath\command.com" +5
 StrCpy $ComPath 'C:'
 IfFileExists "$ComPath\command.com" +3
 MessageBox MB_OK|MB_ICONSTOP "Can not find Command.com, Stop Install.$\n$\n找不到 Command.com，安裝中止。"
 quit


StrCmp $R6 '98' ChkMingliu98
  ; 順便測一下你是不是 Administrator。
  UserInfo::GetAccountType
  Pop $R0
  StrCmp $R0 "Admin" CheckingOK
   MessageBox MB_OK|MB_ICONSTOP  "$(MSG_Admin_checked)"
   Quit

ChkMingliu98:
;順便測一下看你需不需要更新「細明體」&「標楷體」
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
; 4.6 安裝前提示訊息

   StrCmp $R6 '98' +3
    MessageBox MB_OK|MB_ICONINFORMATION  "$(MSG_NT_PREINST1)"
    return
   MessageBox MB_OK|MB_ICONINFORMATION  "$(MSG_9X_PREINST1)"
;  StrCmp $6 '1028' 0 +2
;   ExecShell open "http://cpatch.org/witchfive/pastepic/lfnbakren/lfnbakren.html"

FunctionEnd
;===============================================================================
Function .onSelChange
; 98 關閉「unicode 日文輸入」&「MS 日文 IME」&「改檔名程式」。
; NT 關閉「造字檔」。
;; 非 big5 使用者：關閉所有「輸入法」&「改檔名程式」。
; 非 big5 使用者：關閉所有「非 unicode 輸入法」&「改檔名程式」。
; 關閉法：先設定該 section 為「未選取」& Read Only 狀態，
;         然後再把該 section「隱藏」。
;SecItem2eudc - 造字檔
;SecItem2 - 櫻花輸入法
;SecItem3 - Unicode 日文輸入法
;SecItem3ime - MS 日文 IME 輸入法
;SecItem4 - 改檔名程式

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

; 只是把「櫻花」的「勾」拿掉一次而已
   SectionGetFlags ${SecItem2} $R0
   IntOP $R0 $R0 & 0xFFFFFFFE
   SectionSetFlags ${SecItem2} $R0

NotFirstCall:
  !insertmacro DisSection "${SecItem2eudc}"


StrCmp $6 '1028' CheckOldRenameTable
 !insertmacro DisSection "${SecItem4}"
return

; 如果是「繁中 nt kernel os」，強制安裝改名程式。
CheckOldRenameTable:
;; 如果 uc-o2n.tbl 已存在，強制勾選「UcFileRenamer」
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
; ■5.安裝程式，安裝完成後置動作 (* 進階)
;=======================================================
; 如果不需要，你可以全部 remark。

;==============================
; 5.1 函式定義開始
;Function .onInstSuccess

;==============================
; 5.2 安裝完成後，執行 ExecShell
;
; 視個人需要而定，我只用在 Eudora 安裝而已。
; ;------------------------------------------
; !macro MUI_INSTSUCCESS1 LANGID TEXT
;
;   StrCmp $LANGUAGE ${LANGID} "" +3
;   MessageBox MB_YESNO|MB_ICONQUESTION  "${TEXT}" IDNO Nomapi
;     ExecShell open '$INSTDIR\SWMAPI.EXE'
; !macroend
; ;------------------------------------------;

; 下列是 ENU/CHT/CHS 三個語言的動作。
;
; !insertmacro MUI_INSTSUCCESS1 1033 "Do you want to install  ${NAME} as a default mailer?  It will execute MAPI installer."
; !insertmacro MUI_INSTSUCCESS1 1028 "你想要安裝 ${NAME} 做為預設信件程式嗎？將執行外部 MAPI 安裝程式。"
; !insertmacro MUI_INSTSUCCESS1 2052 "斕砑猁假蚾 ${NAME} 酕峈蘇�珃宎�最唗鎘ˋ蔚堍俴俋窒 MAPI 假蚾最唗﹝"
; Nomapi:

;==============================
; 5.3 安裝後，要求使用者讀取 README 檔案
 

;  ;------------------------------------------
;  !macro MUI_INSTSUCCESS2 LANGID TEXT README
 
;    StrCmp $LANGUAGE ${LANGID} "" +3
;;    MessageBox MB_YESNO|MB_ICONQUESTION  "${TEXT}" IDNO NoReadme
;;    ExecShell open notepad '$INSTDIR\${README}'
;;    ExecShell open '$INSTDIR\${README}'
;  !macroend
;; ;------------------------------------------
 
;; 下列是 ENU/CHT/CHS 三個語言的動作。
 
;; !insertmacro MUI_INSTSUCCESS2 1033 "Setup has been completed successfully .  Press [Yes] to continue README file." "${README_ENU}"
;; !insertmacro MUI_INSTSUCCESS2 1028 "安裝已成功地完成。按下 [Yes] 繼續讀取 README 檔案。" "${README_CHT}"
;; !insertmacro MUI_INSTSUCCESS2 2052 "假蚾眒傖髡華俇傖﹝偌狟 [Yes] 樟哿黍�� README 恅璃﹝" "${README_CHS}"
;; NoReadme:
;==============================
; 5.4 函式定義結束

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
; 9.2 解除安裝程式，初始化函式動作 (* 進階)

Function un.onInit

  ;從註冊表取得語言名稱
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
; ■eof 檔案結尾
