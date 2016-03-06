; NSIS Modern User Interface version 1.62
; 
; NSIS �h�y���}���g�@�K��
; 
; �o�O KA ��a�Ω� MDaemon 4.05 ����ƪ��h�y���w�ˡA
; ����: NSIS 2.0b1, Modern UI 1.62
;
; ���K��\Ū�A�Щ� (* �i��) �̡A�����x���A�i�����L�C
; �X�G�O�Q��k�ΤW Modern UI 1.62 �s�����Ҧ��ޥ��F�C
; �p�G���Ѽg�o�Ӧh�A�l�`�A�����ӡA�л��ּg�H�|�ڡC
;
; ²��y�z�����A�]���b BIG5 �s�X���U�ϥ� GB2312 �A�G
; ���w���ýX�A�ٽШ��̡C�p�G�ݭn�b�������o���T�s�X�A
; ���x�s�� BIG5 plain text �A�A�ӳB�z�C�ڷ|�t�~�H
; attach file ���覡���b�O�W�C
;
; �ڨS���ϥΥ������� GUI ���u��C�p�G�A���e�w�g����
; �� 2.0a7 �� NSI �}���A��V�����ɦb Modern UI ���g
; �k�A�|��@�Ǥu�ҡC��p�s�@����تO���H�Ϊ� 
; magiclime �A�{�b�u��� advsplash �H�~���{���覡���J�C
; ���ΩȡA�ڦb�̭����g�F�C�p�G�ٶ��ӳ·СAJoost ���^
; �媩HTML �J���A�u���@���A��ĳ���ݡC
;
; �O�o�A�S�H�j���A�n�ϥΦh�y���A�S�H�j���A�n Modern 
; UI �A�S�H�j���A�n�w���ܤ���C�A�@�˥i�H���X�@�I�]
; ����N���A�ܶǲΪ��w�˵{���C���n�b���̼o�ܤ��� NSIS
; �U���U�Τj�C
;
; �o�ǳ��O�ۤv�M�w���C

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
; ��1.�w�q�ܼơB�w�˥ؿ��B��X�ɮסB�ϥ�
;=======================================================
; �u�n�b�o�̼g�n�A��L�������өw�q���ܼƤU�h�]�A�N�٤O�h�F�C
;
;==============================
; 1.1 �������X/�W��
;
!define VER_1 2                           ;�n�骩�����X 1 �A�p Eudora 4.3.1.2 �|�쪩�����X
!define VER_2 40                          ;�n�骩�����X 2
!define VER_3 " Alpha?"                  ;�n�骩�����X 3 (* �i��)
;!define VER_4 yyy                        ;�n�骩�����X 4 (* �i��)
;!define VER_R 3                           ;����ƦP�����ĴX�� (* �i��)
!define My_Version  "${VER_1}.${VER_2}${VER_3}" ;�{���W�� (�i�ϥΤj�p�g)
!define My_PRODUCT  "Unicode-At-on" ;�{���W�� (�i�ϥΤj�p�g)
Name "${My_PRODUCT} ${My_Version}"    ;�{���W�� (�i�ϥΤj�p�g)
!define PROGFNHEADER "unicodeaton_"              ;������ɮצW�٪��D�n���� (�����p�g)
!define PROGMAINEXE  "Ico10928.ico"        ;�D�{�������ɮצW�� (�t.exe)
Var FTPageLicense                      ;PageLicense ���X�СA����L�@����N�|�Q�F���F
Var FTPageCompoment                    ;PageCompoment ���X�СA����L�@����N�|�Q�F���F
Var Def3WBrowser                       ;�t�ιw�]�����s����
Var FromNLS
Var ComPath

;==============================
; 1.2 Ū���ɮ�/��X�ɮ�
;
; Ū����ܡA�]�A CHS/CHT/ENU �T�Ӫ����C�p�G�A���ݭn�s�@
; �h�y������ƪ����A�u�n�Ҽ{�@�ӡuŪ�ڡv�Y�i�C�o��Ū�ڡA
; �q�`���ө�u������ƪ��y�z�ɮסv�A�ӫD�@��n�骺 readme �C
;
; �ɮשR�W: (�����p�g)�C
; (cpatch)   c +        ${PROGFNHEADER} + �������X _(���u) �ĴX����ƪ��� . ���ɦW
; (hanzify) ha _(���u)  ${PROGFNHEADER} + �������X _(���u) �@�̦W . �X�i�W

!define MyFileName "${PROGFNHEADER}${VER_1}${VER_2}"
OUTFILE            "${MyFileName}.exe"

;==============================
; 1.3 �w�]�w�˥ؿ� (���ݤ��[ \)
;
; �q�`�|�X�{�b "C:\Program Files\xxxx " �o�إؿ��C
; �]�i�H�ϥ� ${AppPath} �b���U��M���ª��w�˥ؿ��C
; �p�G���U���w�˥ؿ� (���� \) �X�{�A���n�ϥΡA�H�K�o�Ϳ��~�C

InstallDir "$PROGRAMFILES\${My_PRODUCT}"

;==============================
; 1.4 ���v�v��
;
; �u�ݭn�@�ӴN�� (�@�w�n bmp �榡)�A�ĤG�ӬO���Ӫ�N�Ϊ��C
; �i�H�u�ϥΤ@�ӡA�Χ������ϥΡC

;!define SPLASH1 ".\434but\logo.bmp"
;!define SPLASH2 "BMP150chs.BMP"

;==============================
; 1.5 �w�˵{�����A
;
; �����/�����w�˪�/�٬O�ɺ�ɤB�H�w�ˮɥX�{�b caption �����C
; �Ѱ��w�ˮɡA�]�|�X�{�b���U��C

;!define PATCHTYPE_ENU "(CN+TW) localized"
;!define PATCHTYPE_CHT "(CN+TW) �����"
;!define PATCHTYPE_CHS "(CN+TW) ���Ļ�"

;==============================
; 1.6 �Ω�Ѱ��w�˪���T
;
; �]�t���q����/�n��\�෧�z�C�|��b Uninstall ���U���C

!define URLABOUT  'http://cpatch.org/unicode'
!define URLHELP   'http://leoboard.cpatch.org/cgi-bin/forums.cgi?forum=21'
!define URLUPDATE 'http://search.cpatch.org/search.php?query=unicode&type=fulltext'
!define PUBLISHER '2004 cpatch.org'
; �e���|�۰ʨ̻y���ɤW Copyright (c) �� ���v�Ҧ� (c) �A�]���᭱�u�n���W�~�N�M���q�W�١C


; �i�ۺ����W�������C�`�N: �^��y�z�����n�ϥ� ' " �r���A�_�h�|�L�k���פ�r���C

;=======================================================
; ��2.�ϥΪ̤���
;=======================================================
; �o�@�q���γ~�A�b��j���мg system.nsh ���^��w�]�]�w�ȡA
; �q�`�u���ܧ� �u�r���v�u�ϥܡv

;==============================
; 2.1 �r��

; �w�ˤ������r���w�]�j�p 8�A�@�w�n�ﱼ�A�_�h�b win98 ���夣�n�ݡC
; �p�U�C���y������ơA�ϥ� "Tahoma" �Y�i�C
; ���ݭn�S�O���w�u�s�ө���v�Ρu���^�v�C

;!define MUI_FONT "MS Shell Dlg"
;!define MUI_FONTSIZE "8"
;!define MUI_FONT_HEADER "MS Sans Serif"
;!define MUI_FONTSIZE_HEADER "8"
;
; �W�C: NSIS �r���u�w�]�ȡv�A�U�C: �r���u��ĳ�ק�ȡv�C
;
;!define MUI_FONT "Tahoma"         ; �b NSIS 2.0b4 2003-05-01 ���᪺�����A���ݭn�A�γo�өR�O�C�w�� *.NSH ���w�ӧO�y�����r���W�ٻP�j�p�C
;!define MUI_FONTSIZE "9"
;!define MUI_FONT_HEADER "Tahoma"
;!define MUI_FONTSIZE_HEADER "9"

;==============================
; 2.2 �ϥ�

; �w�˵{���ϥ�: �q�`�ڨϥΥD�{�����ϥܡA�t�~�� VC ����X�ӡC
; �Ѱ��w�˹ϥ�: ���F�� [����x | �s�W/�����{��] �X�{���T�ϥܡA�٬O�ΦP�@�ӹϥܡC
;               ���ɭԫh�ϥΥ������ϥ� (�]���ݰ_�Ӥ���)�C
;!define MUI_ICON   "${NSISDIR}\Contrib\Icons\modern-install.ico"
;!define MUI_UNICON "${NSISDIR}\Contrib\Icons\modern-uninstall.ico"
;
; �W�C: NSIS �ϥܡu�w�]�ȡv�A���榳�I�� InstallShield 6 �A�]�����C
; �U�C: �ۭq�ϥܡA�Ы��w���T�W��

;!define MUI_ICON      "${NSISDIR}\Contrib\Graphics\Icons\classic-install.ico"
;!define MUI_UNICON    "${NSISDIR}\Contrib\Graphics\Icons\nsis1-uninstall.ico"
!define MUI_ICON      "Ico10928.ico"
!define MUI_UNICON    "Ico10928.ico"
;==============================
; 2.3 ��L (* �i��)

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
; �}�ҧ󴫹Ϥ�
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
; ��3.�h�y���t��
;=======================================================
; ���J Modern UI\System.nsh ���ΡC

;==========================
; 3.1 �e�m�ۦP�ܼơA���ݭn�өw�C
;
; �q�`�X�{�b�󴫪����ɡA��}�����ܼƮե��C

;!define NAME "${My_PRODUCT}"

;��ܤ���Ƽ��D�A�� ENU/CHT/CHS �y�������P�C

CAPTION "$(MyCaption) ${My_Version} (Win98/SE/ME/2K/XP/2K3)"

;==========================
; 3.3 �ϥΪ̤���
;
; �p�G���n�o�ǹ�ܤ���A���� define �A�N���|�X�{�C

  !define MUI_WELCOMEPAGE             ;�w�ﭶ��
  !define MUI_LICENSEPAGE             ;���v����   !define MUI_LICENSEPAGE_RADIOBUTTONS
  !define MUI_COMPONENTSPAGE          ;���󭶭�
  !define MUI_DIRECTORYPAGE           ;�ؿ����
  !define MUI_ABORTWARNING            ;����ĵ�i
  !define MUI_UNINSTALLER             ;�Ѱ��w�˵{��
  !define MUI_UNCONFIRMPAGE           ;�����T�{����
; !define MUI_STARTMENUPAGE           ;��ܶ}�l�\���

  !define MUI_FINISHPAGE              ;�X�{���������A����{���MŪ�ڡC
    !define MUI_FINISHPAGE_NOAUTOCLOSE

;    !define MUI_FINISHPAGE_RUN "$INSTDIR\${PROGMAINEXE}"
     !define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\$(FILENAME_README)"

;;  !insertmacro MUI_SYSTEM             ;�ϥΪ̤����t��

;==============================
; 3.4 �U��y��

  !insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"

;==============================
; 3.5 ���v��r (* �i��)
;
; �o���ɮרS���X�{�b NSIS �w�]�]���C�p�G�A��W�S�� license �ɮסA
; �Ъ��� remark ���C

LicenseData "$(MyLicenseData)"

; �o�ǪF��|���Q�����Y�X�ӡC�O�d�o�X��b���� File ���O���e!)
; �u��Ω� BZIP2 ���Y

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
; ��6.�w�˪��Ҧ��ɮ�
;=======================================================

;==============================
; 6.1 �w������

; ������ӫܰ��F�C

InstType "$(DESC_InstTypeStandard)"
InstType "$(DESC_InstTypeMinimum)"

SetOverwrite on

;==============================
; 6.3 �w�˪��U�Ӹ`�q
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 Section "-Backup"
  SectionIn 1 2 RO

; �}�l�ƥ�
  SetOutPath "$INSTDIR\Backup"

  IfFileExists "$OutDir\$R7_950.nls" 0 +2
   return
  IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\$R7_950.nls" BakAgain

; �N $R7_950o.nls �ܦ��ƥ�
  IfFileExists "$SYSDIR\$R7_950o.nls" 0 DO1
   rename "$SYSDIR\$R7_950o.nls" "$OutDir\$R7_950.nls"
   StrCmp $R6 '98' DO98
    return

; �N���~���ƥ����쥿�T����m
BakAgain:
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\$R7_950.nls" "$OutDir\$R7_950.nls"
   StrCmp $R6 '98' 0 BakAgainNT
   StrCmp $6 '1028' 0 BakAgainNT
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\gdi.exe" "$OutDIR\gdi.exe"
   rename "$PROGRAMFILES\${My_PRODUCT}\Backup\unicode.bin" "$OutDIR\unicode.bin"

; �p�G���O���t�ΡA�N�i�H�⦹���~�ؿ��R�F
   IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\C_950.nls" 0 RMOldDir
    return

BakAgainNT:
   IfFileExists "$PROGRAMFILES\${My_PRODUCT}\Backup\CP_950.nls" 0 +2
    return

RMOldDir:
   RMDir /r "$PROGRAMFILES\${My_PRODUCT}"
    return

;  �S���ƥ��� $R7_950.nls�A�����ƥ��C
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

; 6.3.1 ����ƪ�Ū��
; �q�`��b�w�˪��D�ؿ��C

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

; 6.3.2 ����ƪ��{���ɮ�

; �q�`���ϥ� *.* ���A�A�ӭӧO���w�A�H�K�]�˿��~�C
; �`�`�O *.DLL *.EXE *.AX �������C�ڳ���o����b cht �������u�@�ؿ��C
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
;  �� AppLocale �� bug �ѨM�� (xp/2k3 only)
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

;  �N c_950.nls �q windows file protect �\��C������
   Delete $SYSDIR\dllcache\c_950.nls

;  �Ĥ@���p�G�i�H���� rename �A�N�}���@���N�ͮġC
  StrCmp $6 '1028' 0 NLS_OP
   Delete "$SYSDIR\C_950.nls"
   IfFileExists "$SYSDIR\C_950.nls" 0 NLS_OP

;  �p�G����A�٦��@�� REBOOTOK �ﶵ�A���ݭn�}���⦸�~��ͮġC
;  �o�˰��O�קK�U�@�Ĥ@���ϥΪ̵L�k�g�J�A���U [Igore] �ɡA�٦����|��^�����C
;  ps: �u���ϥΤ��D unicode �y�t�O�c���� user �~�ݭn���}�⦸�C
;    MessageBox MB_OK|MB_ICONEXCLAMATION "$(Lock950)"
     MessageBox MB_OK|MB_ICONEXCLAMATION "ĵ�i�G$\n======$\n�]��������]�A�A�� C_950.nls �w�D�t����w�I$\n$\n�A�ݭn�s�򭫷s�}���⦸�AUnicode �ɧ��p���~�|�ͮġC"
   goto NLS_OP

NLS_98:
  File ".\Win\CP_950_H.BIN"
  File ".\Win\CP_950_U2B.BIN"
   FileOpen $FromNLS "CP_950.nls" r

   delete "$Outdir\cp_950.100"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g100 -b73 -e1250 cp_950.nls'
   delete "$Outdir\cp_950.101"
   nsExec::Exec '"$ComPath\command.com" /c "$outdir\chop.exe" -z -g101 -b65633 -e65634 cp_950.nls'

;����b�q�}�l�I
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
;  �ϥ� rebootOK �����ءA���Ѫ��ܷ|�b�U�@���}���ɦ۰ʭ��s�R�W�C
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
;  �� NLS �r�X�����^ $R7_950.nls (�קK 2.00 ���� .nls ��w)
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

   ;���e���w�˳y�r��?
   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "SystemDefaultEUDCFont"

   ;���˪��ܡA�ݬݧڭ̪��ƥ��b���b�A�p�G�b�N���A���гƥ�
   IfErrors 0 set_eudc
   StrCmp $R0 "" set_eudc

   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "BackupSystemDefaultEUDCFont"
   IfErrors 0 set_eudc

   ;�ƥ�
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
  ; ���o�t�� Native �y���W��
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
;; ��ݬݦ��S���˹L�u����J�k�v�A�p�G�S�˹L�A�˧���@�ָ��J preload ��

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
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E05E0404" "layout text" "���"

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
; 6.4 �[�J��u�}�l���v
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
; ��7.�g�J�Ѱ��w�˵{��
;=======================================================
; �p�G�A�������A�i�H���g�Ѱ��w�˵{���A���� remark ���C

;==============================
; 7.1 �`�q�}�l

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Section "$(Item8)" SecItem8
  SectionIn 1 2 RO

;==============================
; 7.2 �g�J��u���U��v(��¦)
;
; �@��u���g�U���o�@�q�A���w�w�˥ؿ��C

  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "Install_Dir" "$INSTDIR"

;==============================
; 7.3 �g�J��u���U��v (* �i��)
;
; �U���o�q���U��ȡA�u�O�b {����x | �s�W�����{��] ��N�Ϊ��C
; �p�G�ݤ����A�i�H�������ϥΡC
; �Ѧ�  http://leoboard.cpatch.org/cgi-bin/topic.cgi?forum=2&topic=24&show=0

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" \
   "DisplayIcon" "$INSTDIR\${PROGMAINEXE}"       ; �@��ϥγo�ӫ��A�C�u�� MDaemon �ҥ~�C
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
; 7.4 �̷ӦU�ػy���A�۰ʼg�J���P�����U��� (* �i��)
; �]�A ENU/CHT/CHS
; ;------------------------------------------

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" "Comments" "$(REGMUI1)"

;==============================
; 7.5 �̷ӦU�ػy���A�۰ʼg�J���P�����U��� (* �i��)
; �]�A ENU/CHT/CHS
; ;------------------------------------------

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}" "Publisher" "$(REGMUI2) (c) ${Publisher}"

;==============================
; 7.6 �{�b�g�J�u�Ѱ��w�˵{���v

; �g�J�y���W�٨���U�� (�Ω�Ѱ��w�˵{��)
  WriteRegStr HKLM "Software\${My_PRODUCT}" "Installer Language" $LANGUAGE
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "CP" $R7
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "OS" $R6
  WriteRegStr HKLM "SOFTWARE\${My_PRODUCT}" "SysLang" $6
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ; �]�w�۰ʶ}�����X�СANSIS �|�߰ݨϥΪ̬O�_�@�N���s�}���C
; SetRebootFlag True

;    MessageBox MB_YESNO|MB_ICONQUESTION  "$(MSG_POSTINST)" IDNO No_reboot
;reboot
; No_reboot:

  MessageBox MB_OK|MB_ICONEXCLAMATION "$(MSG_POSTINST)"

SectionEnd


;==============================
; 7.8 ��ܡu�����v���Y

;�p�G���Q�ϥΡu�����v�����A�b�o�ӥ������ᴡ�J�C

;!insertmacro MUI_SECTIONS_FINISHHEADER

;=======================================================
; ��8.�y�z�\��
;=======================================================

;==============================
; 8.1 �y�z�\�઺���� (* �i��)
;
; �p�G���y�z�A�̦n�@�Ӥ@�ӥ[�J�����C
; �o�@�q�n�b�Ҧ��� section ����A�_�h�|�X�{�u�ܼƦW�٨S�����v�C
; �p�G MUI_FUNCTION_DESCRIPTION_BEGIN ���q�A�|�ܦ����ЩI�s�A�ӾɭP���~�C

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
; 8.2 �C�Ӹ`�q���y�z��r�A�����ϥΦU��y�� (* �i��)
;
; �o�O���ƹ����ʨ�w�˶��ؤW�ɡA�۰ʥX�{���y�z�\��C
; �ڨϥ� ENU/CHT/CHS �T�ӻy���C�p�G���·СA�i�H�u�ϥΤ@�ӻy���A�Ʀܤ��ϥδy�z�C

 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_ENGLISH}     "The installer is already running."
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_TRADCHINESE} "�w�˵{���w���b����"
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_SIMPCHINESE} "��װ��������������"
 LangString MSG_RunOnesAtTheSameTime_checked ${LANG_JAPANESE}    "�C���X�g�[�������s���Ă��܂��B"

 LangString MyCaption ${LANG_ENGLISH}     "Unicode-At-on (BIG5 Extension)"
 LangString MyCaption ${LANG_TRADCHINESE} "Unicode �ɧ��p�e"
 LangString MyCaption ${LANG_SIMPCHINESE} "Unicode ����ƻ�"
 LangString MyCaption ${LANG_JAPANESE}    "Unicode �⊮�v��"
 LicenseLangString MyLicenseData ${LANG_ENGLISH}     "license-enu.rtf"
 LicenseLangString MyLicenseData ${LANG_SIMPCHINESE} "license-chs.rtf"
 LicenseLangString MyLicenseData ${LANG_TRADCHINESE} "license-cht.rtf"
 LicenseLangString MyLicenseData ${LANG_JAPANESE}    "license-jap.rtf"

  LangString MSG_NT_PREINST1 ${LANG_ENGLISH}        "(1) Make sure you are login as an Administrator privilege.  $\n$\n(2) Close the programs to prevent NLS locking by system.  If popup an message cannot write, please press [Ignore]$\n$\n(3) The installer will popup a Janapese charactor rename programs, please execute it directly.   If you executed the program before, just close it.$\n$\n(4) Finish setup and reboot your compute."
  LangString MSG_NT_PREINST1 ${LANG_TRADCHINESE}    "(1) �w�T�{�A�֦� Administrator �v��$\n$\n(2) ��������L�Ҧ��{���A�H�קK NLS �ɮ׾D�t����w�C�U�@���X�u�L�k�g�J�v�A�Ъ����� [Ignore] �Y�i�C$\n$\n(3) �w�˵{���|���X����ɦW��s�{���A�Ъ�������C�p�G�w�g����L�A���������ӵ{���Y�i�C$\n$\n(4) �w�˧����s�}����A�N�����F�C"
  LangString MSG_NT_PREINST1 ${LANG_SIMPCHINESE}    "(1) ��ȷ����ӵ�� Administrator Ȩ��$\n$\n(2) ��ر��������г����Ա��� NLS �ļ���ϵͳ��������һ�������޷�д�롹����ֱ�Ӱ� [Ignore] ���ɡ�$\n$\n(3) ��װ�����¿����󣬾�����ˡ�"
; LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) �Ǘ��Ҍ����������Ă��邱�Ƃ��m�F���Ă��������B$\n$\n(2) �uNLS �t�@�C���v���V�X�e���Ƀ��b�N����Ȃ��悤�ɁA���̃A�v���P�[�V��������U�I�����ĉ������B�u�����@�������v�ƕ\������܂�����A [��Ignore��] �𒼐ڃN���b�N���邾���Ō��\�ł��B$\n$\n(3) �C���X�g�[�����I�����A�ċN������Ί����ł��B"
; LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) Administrator �������K�v�ł��B�m�F���Ă��������B$\n$\n(2) ���s���̂��ׂẴE�B���h�[��߂Ă��������B NLS �t�@�C�������b�N����錴���ƂȂ�܂��B�u�������݃G���[�v���N����ꍇ�A [Ignore] �Œ��f���Ă��������B$\n$\n(3) �C���X�g�[�����I�������A�V�X�e�����ċN�����Ă��������B"
  LangString MSG_NT_PREINST1 ${LANG_JAPANESE}       "(1) Administrator �����������Ă��邱�Ƃ��m�F���Ă��������B$\n$\n(2) �uNLS �t�@�C���v���V�X�e���Ƀ��b�N����Ȃ��悤�ɁA���̃A�v���P�[�V��������U�I�����ĉ������B�u�������݃G���[�v�ƕ\������܂�����A [Ignore] �𒼐ڃN���b�N���邾���Ō��\�ł��B$\n$\n(3) �C���X�g�[�����I�����A�ċN������Ί����ł��B"
  LangString MSG_9X_PREINST1 ${LANG_ENGLISH}        "This version will change the BIG5 mapping table, will affect Japanese charactor and EUDC font filename in you harddisk.  Please go to our forum to review detail explanation.  You need to take full responsibilities at your own risk.$\n$\nDue to Win98 OS limitation (Win2k no problem), solution need add-on steps.   $\n$\n(1) Install ChinaSea FontSet  $\n(2) change Win98 MingLiU (v2.10) to Win2k version (v3.21) for fulfilling unicode display.  $\n$\nTech details, read cpatch forum. http://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_TRADCHINESE}    "�������|����ɮרt�Ϊ� BIG5 ������A�i��|�v�T�A�w�и̪����B�~�r�ɦW�C�Ш쥻�n��Q�װϰѬݸӰ��D�Բӻ����A�æb�A��Ӱ��D�t�@���d���U�w�ˡC$\n$\n�ѩ� Win98 OS ���� (2k �L�����D)�A�ѨM��צh�@�ǨB�J�G$\n$\n(1) �~��w�ˤ�����r��$\n(2) ��ʧ󴫡u�³y�r�ɦW�v���u�з� Unicode �ɦW�v$\n(3) ��ʧ� Win98 MingLiU.TTC (v2.10) �� win2k ���� (v3.21)�AUnicode �r����ܷ|�󧹳ƺ}�G��C$\n$\n�޳N�Ӹ`�A�� cpatch ����ƱM�~�׾¡C$\nhttp://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_SIMPCHINESE}    "���� Win98 OS ���� (2k �޴�����)�����������һЩ���裺 $\n$\n�ֹ����� Win98 MingLiu.TTC (v2.10) Ϊ win2k �汾 (v3.21)��Unicode �ַ�����ʾ����걸Ư��ม�$\n$\n����ϸ�ڣ��� cpatch ���Ļ�רҵ��̳��$\nhttp://leoboard.cpatch.org"
  LangString MSG_9X_PREINST1 ${LANG_JAPANESE}       "Win98 OS �̐��� (2k �ł͂��̖��͂���܂���)�ɂ��A�Ώ��@�̎菇�͏��������ł��F$\n$\nWin98 �� MingLiU.TTC (v2.10) �� win2k �� (v3.21) �̂œ��ꊷ���鎖�ŁAUnicode �����R�[�h����肫�ꂢ�ɕ\�����܂���B$\n$\n�Z�p�ɂ��Ă̏ڍ׏��́A�uCPatch �����ꉻ���f���v�Ŋm�F���鎖���o���܂��B$\nhttp://leoboard.cpatch.org"

  LangString MSG_NO_IEPKTW_checked ${LANG_ENGLISH}        "Warning!!  You don't have any Tradition-Chinese Fonts!  Please install M$$-IE Traditional Chinese Suppliment first."
  LangString MSG_NO_IEPKTW_checked ${LANG_TRADCHINESE}    "ĵ�i�I�A�S������Ω�u�c�餤��v���r���I�Х��w�� IE ���u�c�餤��䴩�v�C"
  LangString MSG_NO_IEPKTW_checked ${LANG_SIMPCHINESE}    "���棡��û���κ����ڡ��������ġ������壡���Ȱ�װ IE �ġ���������֧�֡���"
  LangString MSG_NO_IEPKTW_checked ${LANG_JAPANESE}       "���ӁI�u��铎�������v�̃t�H���g���C���X�g�[�����Ă��܂���I��� IE �́u�ɑ̎�������T�|�[�g�v���C���X�g�[�����Ă��������B"

  LangString MSG_NS_OS_checked ${LANG_ENGLISH}        "Installer has detected your OS as Win95/NT or Unknown.  It cannot install Unicode-at-on."
  LangString MSG_NS_OS_checked ${LANG_TRADCHINESE}    "�w�˵{���v������A���@�~�t�άO Win95/NT or Unknown�C�L�k�w�� Unicode �ɧ��p�e�C"
  LangString MSG_NS_OS_checked ${LANG_SIMPCHINESE}    "��װ�����Ѽ�⵽��Ĳ���ϵͳ�� Win95/NT or Unknown���޷���װ Unicode ����ƻ���"
  LangString MSG_NS_OS_checked ${LANG_JAPANESE}       "���̃p�\�R���̃I�y���[�e�B���O�V�X�e���� Win95/NT ���s���ł��邱�Ƃ����o����܂����B�uUnicode �⊮�v��v���C���X�g�[�����邱�Ƃ��o���܂���B"
; LangString MSG_NS_OS_checked ${LANG_JAPANESE}       "���Ȃ���OS�� Win95/NT �ł��B Unicode �⊮�v��͂��̃o�[�W������OS���T�|�[�g���Ă��܂���B"

  LangString MSG_ME_SFP_checked ${LANG_ENGLISH}       "Installer has detected your OS as WinME�C$\n$\nPlease make sure that you have removed (System File Protection) & (System Restore), otherwise Unicode-At-On should INSTALL FAILED. �C$\n$\nPress [OK] to continue install, $\nPress [Cancel] to open related webpage links and exit installer."
  LangString MSG_ME_SFP_checked ${LANG_TRADCHINESE}   "�w�˵{���v������A���@�~�t�άO WinME�C$\n$\n�нT�w�A���ƥ������u�t���ɮ׫O�@ (System File Protection)�v&�u�t���٭� (System Restore)�v�A�_�h�uUnicode �ɧ��p�e�v�@�w�|�u�w�˥��ѡv�C$\n$\n���U [�T�w] �~��w�ˡC$\n���U [����] �}�Ҭ��������s���A�����}�w�˵{���C"
  LangString MSG_ME_SFP_checked ${LANG_SIMPCHINESE}   "��װ�����Ѽ�⵽��Ĳ���ϵͳ�� WinME��$\n$\n��ȷ�����������Ƴ���ϵͳ�ļ������� (System File Protection)��&��ϵͳ�ָ� (System File Protection)��������Unicode ����ƻ���һ���ᡸ��װʧ�ܡ���$\n$\n���� [ȷ��] ������װ��$\n���� [ȡ��] �������ҳ���ӣ����˳���װ����"
  LangString MSG_ME_SFP_checked ${LANG_JAPANESE}      "���̃p�\�R���̃I�y���[�e�B���O�V�X�e���� WinME �ł��邱�Ƃ����o����܂����B$\n$\n�u�V�X�e�� �t�@�C�� �ی�@�\ (System File Protection)�v&�u�V�X�e�� ���� (System Restore)�v���O����Ă��邱�Ƃ����m�F���������A�łȂ��ƁuUnicode �⊮�v�`�v�̃C���X�g�[���͕K�����s���܂��B$\n$\n[OK] ���N���b�N���Ď��ցB$\n[�L�����Z��] ���N���b�N���Ċ֘A�y�[�W�̃����N�ֈړ����A�C���X�g���[�V�������I�����܂��B"
; LangString MSG_ME_SFP_checked ${LANG_JAPANESE}      "���Ȃ��� OS �� WinME �ł��B$\n$\n�uSystem File Protection�v&�uSystem Restore�v�Ƃ����@�\�͍폜���Ȃ��ƁAUnicode �⊮�v��͐���ɃC���X�g�[������̂͂ł��܂���B$\n$\n[OK] �ŃC���X�g�[���ĊJ���܂��B$\n [�L�����Z��] �ŃC���X�g�[�����I�����܂��B"

  LangString MSG_OLD_Mingliu_checked ${LANG_ENGLISH}     "Installer has detected your MINGLIU.TTC is old version not contained Japanese katagana. Please update MINGLIU.TTC, at leaset WinME and above version MINGLIU.TTC will have Japanese katagana.$\n$\nPress [OK] to continue install."
  LangString MSG_OLD_Mingliu_checked ${LANG_TRADCHINESE} "�w�˵{���v������A���u�ө���v�O���t�u��尲�W�v���ª����A�ЧA�@�w�n��s�u�ө���v�A�ܤ֭n WinME �H�W�������u�ө���v�~���u��尲�W�v�C$\n$\n���U�u�T�w�v�~��w�ˡC"
  LangString MSG_OLD_Mingliu_checked ${LANG_SIMPCHINESE} "��װ�����Ѽ�⵽��ġ�MingLiu.TTC���ǲ��������ļ������ľɰ汾������һ��Ҫ���¡�MingLiu.TTC��������Ҫ WinME ���ϰ汾�ġ�MingLiu.TTC�����С����ļ�������$\n$\n���¡�ȷ����������װ��"
  LangString MSG_OLD_Mingliu_checked ${LANG_JAPANESE}    "���Ȃ��́u�ז�铁iMingliu�G������t�H���g�j�v�́u�����v���Ȃ��o�[�W�����ł��B�K���u�ז�铁v���A�b�v�f�[�g���Ă��������B$\n$\n�uOK�v�ŃC���X�g�[���ĊJ���܂��B"

  LangString MSG_OLD_Kaiu_checked ${LANG_ENGLISH}        "Installer has detected your KAIU.TTF is old version not contained Japanese katagana. Please update KAIU.TTF, at leaset WinME and above version KAIU.TTF will have Japanese katagana.$\n$\nPress [OK] to continue install."
  LangString MSG_OLD_Kaiu_checked ${LANG_TRADCHINESE}    "�w�˵{���v������A���u�з���v�O���t�u��尲�W�v���ª����A�ЧA�@�w�n��s�u�з���v�A�ܤ֭n WinME �H�W�������u�з���v�~���u��尲�W�v�C$\n$\n���U�u�T�w�v�~��w�ˡC"
  LangString MSG_OLD_Kaiu_checked ${LANG_SIMPCHINESE}    "��װ�����Ѽ�⵽��ġ�Kaiu.TTF���ǲ��������ļ������ľɰ汾������һ��Ҫ���¡�Kaiu.TTF��������Ҫ WinME ���ϰ汾�ġ�Kaiu.TTF�����С����ļ�������$\n$\n���¡�ȷ����������װ��"
  LangString MSG_OLD_Kaiu_checked ${LANG_JAPANESE}       "���Ȃ��́u�W��铁iKaiu�G������t�H���g�j�v�́u�����v���Ȃ��o�[�W�����ł��B�K���u�W��铁v���A�b�v�f�[�g���Ă��������B$\n$\n�uOK�v�ŃC���X�g�[���ĊJ���܂��B"

  LangString MSG_Admin_checked ${LANG_ENGLISH}      "You are has no System Administrator privilege. You can not continue install."
  LangString MSG_Admin_checked ${LANG_TRADCHINESE}  "�A���㦳�u�t�κ޲z���v�v���A�L�k�~��w�ˡC"
  LangString MSG_Admin_checked ${LANG_SIMPCHINESE}  "�㲻���С�ϵͳ����Ա��Ȩ�ޣ��޷�������װ��"
  LangString MSG_Admin_checked ${LANG_JAPANESE}     "���Ȃ��́uAdministrator�v�����������Ă��܂��񂩂�A�C���X�g�[���ł��܂���B"

  LangString REGMUI1 ${LANG_ENGLISH}     "Chinese (P.R.C.) and Chinese (Taiwan) ${My_PRODUCT} localized version by Kii Ali. Unicode At-on (Big5 Extension) with a method my mapping unicode/ansi, extend old BIG5 system compatibilities, and increase the number 2 bytes charactor for display and printing.  Solving problem on Disply and Printing in: Japanese charactor, Simplified Charactor, and China-Sea Charactor."
  LangString REGMUI1 ${LANG_TRADCHINESE} "���� (����j��) �P ���� (�O�W) ${My_PRODUCT} ���a�ƪ����A�� Kii Ali �s�@�C Unicode �ɧ��p�e (Big5 Extension) �H unicode/ansi �������覡 (�ӫD�y�r�覡) �A�X�R�ª� BIG5 �b�U�بt�Ϊ��ۮe�סA�P�W�[�i��ܻP�C�L�� 2 �줸�r���C�øѨM�H�U���C�L�P��ܰ��D: �������W�����W�B²�餤��B�H�Τ�����r���C"
  LangString REGMUI1 ${LANG_SIMPCHINESE} "���� (�й���½) �� ���� (̨��) ${My_PRODUCT} ���ػ��汾���� Kii Ali ������ Unicode ����ƻ� (Big5 Extension) �� unicode/ansi ӳ��ķ�ʽ (�������ַ�ʽ) ������ɵ� BIG5 �ڸ���ϵͳ�ļ��ݶȣ������ӿ���ʾ���ӡ�� 2 λԪ�ַ�����������µĴ�ӡ����ʾ����: ����Ƭ����ƽ�������������ġ��Լ��й����ַ�����"
  LangString REGMUI1 ${LANG_JAPANESE}    "${My_PRODUCT} ���{��o�[�W�����B Unicode �⊮�v�� (Big5 Extension) �́A���j�R�[�h��BIG5�R�[�h�̃}�b�s���O�𒲐�������@���g���Ă���A�ʏ�̊O�������Ƃ͈Ⴄ�l���ł���܂��B Unicode �⊮�v����C���X�g�[������ƁA���{���OS�ł��ABIG5�R�[�h�̉��������邱�Ƃ��ł���悤�ɂȂ�܂��B"

  LangString REGMUI2 ${LANG_ENGLISH}     "Copyright"
  LangString REGMUI2 ${LANG_TRADCHINESE} "���v�Ҧ�"
  LangString REGMUI2 ${LANG_SIMPCHINESE} "��Ȩ����"
  LangString REGMUI2 ${LANG_JAPANESE}    "���쌠�L��"

; LangString MSG_POSTINST ${LANG_ENGLISH}        "You need to REBOOT to make effect of installation.  Press [Yes] to restart immediately, [No] to restart later manually."
; LangString MSG_POSTINST ${LANG_TRADCHINESE}    "�A�ݭn���s�ҰʡA�H�K�Ϧw�˥ͮġC���U [Yes] �ߧY���s�ҰʡC[No] �y��A�ۦ歫�s�ҰʡC"
; LangString MSG_POSTINST ${LANG_SIMPCHINESE}    "����Ҫ�����������Ա�ʹ��װ��Ч������ [Yes] ��������������[No] �Ժ�����������������"
; LangString MSG_POSTINST ${LANG_JAPANESE}       "Unicode �⊮�v�����������ɂ́A�ċN�����Ȃ���΂Ȃ�܂���B [Yes] ���N���b�N���čċN�����܂��B [No] ���N���b�N���Ă��A��ōċN�����Ă��������B"
  LangString MSG_POSTINST ${LANG_ENGLISH}        "You need to REBOOT to make effect of installation.$\n$\nRestart later manually, please."
  LangString MSG_POSTINST ${LANG_TRADCHINESE}    "�A�ݭn���s�ҰʡA�H�K�Ϧw�˥ͮġC$\n$\n�Цۦ歫�s�ҰʡC"
  LangString MSG_POSTINST ${LANG_SIMPCHINESE}    "����Ҫ�����������Ա�ʹ��װ��Ч��$\n$\n����������������"
  LangString MSG_POSTINST ${LANG_JAPANESE}       "Unicode �⊮�v�����������ɂ́A�ċN�����Ȃ���΂Ȃ�܂���B$\n$\n��ōċN�����Ă��������B"
  LangString un.MSG_POSTINST ${LANG_ENGLISH}     "You need to REBOOT to make effect of uninstallation.  Press [Yes] to restart immediately, [No] to restart later manually."
  LangString un.MSG_POSTINST ${LANG_TRADCHINESE} "�A�ݭn���s�ҰʡA�H�K�ϸѰ��w�˥ͮġC���U [Yes] �ߧY���s�ҰʡC[No] �y��A�ۦ歫�s�ҰʡC"
  LangString un.MSG_POSTINST ${LANG_SIMPCHINESE} "����Ҫ�����������Ա�ʹ�����װ��Ч������ [Yes] ��������������[No] �Ժ�����������������"
  LangString un.MSG_POSTINST ${LANG_JAPANESE}    "�A���C���X�g�[������������ɂ́A�ċN�����Ȃ���΂Ȃ�܂���B [Yes] ���N���b�N���čċN�����܂��B [No] ���N���b�N���Ă��A��ōċN�����Ă��������B"

  LangString FILENAME_README  ${LANG_ENGLISH}     "${MyFileName}.txt"
  LangString FILENAME_README  ${LANG_TRADCHINESE} "${MyFileName}.txt"
  LangString FILENAME_README  ${LANG_SIMPCHINESE} "${MyFileName}_gb.txt"
  LangString FILENAME_README  ${LANG_JAPANESE}    "${MyFileName}.txt"
  LangString FILENAME_history ${LANG_ENGLISH}     "history.txt"
  LangString FILENAME_history ${LANG_TRADCHINESE} "history.txt"
  LangString FILENAME_history ${LANG_SIMPCHINESE} "history_gb.txt"
  LangString FILENAME_history ${LANG_JAPANESE}    "history.txt"

  LangString Sakura_layouttext_0404 ${LANG_ENGLISH}     "Chinese (Traditional) - Unicode Sakura"
  LangString Sakura_layouttext_0404 ${LANG_TRADCHINESE} "���� (�c��) - Unicode ���"
  LangString Sakura_layouttext_0404 ${LANG_SIMPCHINESE} "���� (����) - Unicode ӣ��"
  LangString Sakura_layouttext_0404 ${LANG_JAPANESE}    "��铎������� - Unicode ����"
  LangString Sakura_layouttext_0804 ${LANG_ENGLISH}     "Chinese (Simplified) - Unicode Sakura"
  LangString Sakura_layouttext_0804 ${LANG_TRADCHINESE} "���� (²�^) - Unicode ���"
  LangString Sakura_layouttext_0804 ${LANG_SIMPCHINESE} "���� (����) - Unicode ӣ��"
  LangString Sakura_layouttext_0804 ${LANG_JAPANESE}    "�ȑ̎������� - Unicode ����"

  LangString Japan_layouttext_0404 ${LANG_ENGLISH}     "Chinese (Traditional) - Unicode Japan"
  LangString Japan_layouttext_0404 ${LANG_TRADCHINESE} "���� (�c��) - Unicode ���"
  LangString Japan_layouttext_0404 ${LANG_SIMPCHINESE} "���� (����) - Unicode ����"
  LangString Japan_layouttext_0404 ${LANG_JAPANESE}    "��铎������� - Unicode ���{�ꉼ��"
  LangString Japan_layouttext_0804 ${LANG_ENGLISH}     "Chinese (Simplified) - Unicode Japan"
  LangString Japan_layouttext_0804 ${LANG_TRADCHINESE} "���� (²�^) - Unicode ���"
  LangString Japan_layouttext_0804 ${LANG_SIMPCHINESE} "���� (����) - Unicode ����"
  LangString Japan_layouttext_0804 ${LANG_JAPANESE}    "�ȑ̎������� - Unicode ���{�ꉼ��"

; LangString Lock950 ${LANG_ENGLISH}     "Warning:$\n======$\nYour C_950.nls was locked by OS with unknown reason.$\n$\nYou need to reboot twice to make Unicode-at-on take effect."
; LangString Lock950 ${LANG_TRADCHINESE} "ĵ�i�G$\n======$\n�]��������]�A�A�� C_950.nls �w�D�t����w�I$\n$\n�A�ݭn�s�򭫷s�}���⦸�AUnicode �ɧ��p���~�|�ͮġC"
; LangString Lock950 ${LANG_SIMPCHINESE} "���棺$\n======$\n��Ϊ����ԭ����� C_950.nls ����ϵͳ������$\n$\n����Ҫ�������¿������Σ�Unicode ����ƻ��Ż���Ч��"
; LangString Lock950 ${LANG_JAPANESE}    "���ӁF$\n======$\n�s���̌����ŁC C_950.nls �̓V�X�e���Ƀ��b�N����܂����I$\n$\nUnicode �⊮�v�����������ɂ́A OS ���u2��v�ċN�����Ȃ���΂Ȃ�܂���B"

; LangString Lock950un ${LANG_ENGLISH}     "Warning:$\n======$\nYour C_950.nls was locked by OS with unknown reason.$\n$\nYou need to reboot twice to make Unicode-at-on uninstallation."
; LangString Lock950un ${LANG_TRADCHINESE} "ĵ�i�G$\n======$\n�]��������]�A�A�� C_950.nls �w�D�t����w�I$\n$\n�A�ݭn�s�򭫷s�}���⦸�A�~�৹�������C"
; LangString Lock950un ${LANG_SIMPCHINESE} "���棺$\n======$\n��Ϊ����ԭ����� C_950.nls ����ϵͳ������$\n$\n����Ҫ�������¿������Σ���������Ƴ���"
; LangString Lock950un ${LANG_JAPANESE}    "���ӁF$\n======$\n�s���̌����ŁC C_950.nls �̓V�X�e���Ƀ��b�N����܂����I$\n$\n�A���C���X�g�[������������ɂ́A OS ���u2��v�ċN�����Ȃ���΂Ȃ�܂���B"

  LangString GetAnotherOne ${LANG_ENGLISH}     "Waringing:$\n======$\n    Because the other OS (98/me �� 2k/xp/2k3) on this computer has already installed Unicode-at-on, the directory cannot be removed.$\n$\nPS: When uninstall unicode-at-on on the other OS, the directory will be removed."
  LangString GetAnotherOne ${LANG_TRADCHINESE} "ĵ�i�G$\n======$\n    �]���A���x�q�����t�@�t�� (98/me �� 2k/xp/2k3) �]���� unicode �ɧ��p���A�ҥH���ؿ��L�k�����C$\n$\nPS: ��A�t�@�t�ΤW�� unicode �ɧ��p�������ɡA���ؿ��~�|�@�ֲ����C"
  LangString GetAnotherOne ${LANG_SIMPCHINESE} "���棺$\n======$\n    ��Ϊ���̨���������һϵͳ (98/me �� 2k/xp/2k3) Ҳ��װ unicode ����ƻ������Դ�Ŀ¼�޷��Ƴ���$\n$\nPS: ������һϵͳ�ϵ� unicode ����ƻ��Ƴ�ʱ����Ŀ¼�Ż�һ���Ƴ���"
  LangString GetAnotherOne ${LANG_JAPANESE}    "���ӁF$\n======$\n    ���̃R���s���[�^�̂ق���OS (98/me �� 2k/xp/2k3) �� Unicode �⊮�v����C���X�g�[�����Ă��܂��̂ŁA�t�H���_�͍폜����Ă��܂���B$\n$\nPS: ����OS�� Unicode �⊮�v����C���X�g�[�������ۂɁC�t�H���_�͍폜���܂��B"

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

  LangString DESC_InstTypeMinimum ${LANG_TRADCHINESE} "�̤p�w��"
  LangString DESC_InstTypeStandard ${LANG_TRADCHINESE} "�зǦw��"

  LangString Item1 ${LANG_TRADCHINESE} "Unicode �ɧ��p�e�֤�"
  LangString Item2 ${LANG_TRADCHINESE} "����J�k"
  LangString Item2eudc ${LANG_TRADCHINESE} "�ɥR�y�r��"
  LangString Item3 ${LANG_TRADCHINESE} "Unicode ����J�k"
  LangString Item3ime ${LANG_TRADCHINESE} "MS ��� IME ��J�k"
  LangString Item4 ${LANG_TRADCHINESE} "��尲�W�ɦW�ഫ�{��"
  LangString Item5 ${LANG_TRADCHINESE} "HTML���~�r�ۮe�ഫ��"
  LangString Item6 ${LANG_TRADCHINESE} "�६���"
  LangString Item7 ${LANG_TRADCHINESE} "�}�l�\����|"
  LangString Item8 ${LANG_TRADCHINESE} "�إ߸Ѱ��w�˵{��"

  LangString DESC_SecItem1 ${LANG_TRADCHINESE} "BIG5 ���X�i�r���C���A���ʦr�B�L�k��ܡB�ťաB�ýX"
  LangString DESC_SecItem2 ${LANG_TRADCHINESE} "��K�A��J��尲�W�C"
  LangString DESC_SecItem2eudc ${LANG_TRADCHINESE} "�ɥR�@�ǡu�ө���v�S�����r�C$\n$\n���`�N�G$\n�p�G�A���ˡu������r���v�A�����Ш����w�ˡC"
  LangString DESC_SecItem3 ${LANG_TRADCHINESE} "�P���P�ˡA�����X�r���֡A�A�X��������x���H�h�C"
  LangString DESC_SecItem3ime ${LANG_TRADCHINESE} "MS ��� IME�C"
  LangString DESC_SecItem4 ${LANG_TRADCHINESE} "���ª���尲�W�ɦW�A�ഫ���s�� Unicode �ɦW�C"
  LangString DESC_SecItem5 ${LANG_TRADCHINESE} "�N�A�� BIG5 HTML ��󤤩ҨϥΨ쪺�~�r�A�ഫ���C�ӤH���ݱo�쪺�Φ��C"
  LangString DESC_SecItem6 ${LANG_TRADCHINESE} "�w�ˬݬݡA�ڭ̪�F�ܦh�߫�e��A�ݭn�ҥ� Active Desktop"
  LangString DESC_SecItem7 ${LANG_TRADCHINESE} "�[�J���|��}�l�\���"
  LangString DESC_SecItem8 ${LANG_TRADCHINESE} "�إ߸Ѱ��w�˵{��"

  LangString SC1   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\�Ѱ��w�� Unicode �ɧ��p�e.lnk"
  LangString SC2   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Ū���ɮ�.lnk"
  LangString SC3   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\�������v.lnk"
  LangString SC4   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\��尲�W�ɦW�ഫ�{��.lnk"
  LangString SC5   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �ɧ��p�e����.lnk"
  LangString SC6   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �ɧ��p�e�׾�.lnk"
  LangString SC7   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\���խ� - ��尲�W.lnk"
  LangString SC8   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\���խ� - ²�餤��.lnk"
  LangString SC9   ${LANG_TRADCHINESE} "$SMPROGRAMS\${My_PRODUCT}\HTML���~�r�ۮe�ഫ��.lnk"

  LangString DESC_InstTypeMinimum ${LANG_SIMPCHINESE} "��С��װ"
  LangString DESC_InstTypeStandard ${LANG_SIMPCHINESE} "��׼��װ"

  LangString Item1 ${LANG_SIMPCHINESE} "Unicode ����ƻ�����"
  LangString Item2 ${LANG_SIMPCHINESE} "ӣ�����뷨"
  LangString Item2eudc ${LANG_SIMPCHINESE} "�������ֵ�"
  LangString Item3 ${LANG_SIMPCHINESE} "Unicode �������뷨"
  LangString Item3ime ${LANG_SIMPCHINESE} "MS ���� IME ���뷨"
  LangString Item4 ${LANG_SIMPCHINESE} "���ļ����ļ���ת������"
  LangString Item5 ${LANG_SIMPCHINESE} "HTML�ļ����ּ���ת����"
  LangString Item6 ${LANG_SIMPCHINESE} "ǽֽ��ʾ"
  LangString Item7 ${LANG_SIMPCHINESE} "��ʼ�˵���ݷ�ʽ"
  LangString Item8 ${LANG_SIMPCHINESE} "���������װ����"

  LangString DESC_SecItem1 ${LANG_SIMPCHINESE} "BIG5 �������ַ�����������ȱ�֡��޷���ʾ���հס�����"
  LangString DESC_SecItem2 ${LANG_SIMPCHINESE} "�������������ļ�����"
  LangString DESC_SecItem2eudc ${LANG_SIMPCHINESE} "����һЩ��Mingliu.TTC��û�е��֡�"
  LangString DESC_SecItem3 ${LANG_SIMPCHINESE} "��ӣ��ͬ�����������ֽ��٣��ʺ϶����Ľ���Ϥ����ʿ��"
  LangString DESC_SecItem3ime ${LANG_SIMPCHINESE} "MS ���� IME��"
  LangString DESC_SecItem4 ${LANG_SIMPCHINESE} "�Ѿɵ����ļ����ļ�����ת��Ϊ�µ� Unicode �ļ�����"
  LangString DESC_SecItem5 ${LANG_SIMPCHINESE} "����� BIG5 HTML �ļ�����ʹ�õ������֣�ת����ÿ���˶����ĵ�����ʽ��"
  LangString DESC_SecItem6 ${LANG_SIMPCHINESE} "��װ���������ǻ��˺ܶ���˼��ร���Ҫ���� Active Desktop"
  LangString DESC_SecItem7 ${LANG_SIMPCHINESE} "��ӿ�ݷ�ʽ����ʼ�˵�"
  LangString DESC_SecItem8 ${LANG_SIMPCHINESE} "���������װ����"

  LangString SC1   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\�����װ Unicode ����ƻ�.lnk"
  LangString SC2   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\�����ļ�.lnk"
  LangString SC3   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\�汾��ʷ.lnk"
  LangString SC4   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\���ļ����ļ���ת������.lnk"
  LangString SC5   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode ����ƻ���ҳ.lnk"
  LangString SC6   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode ����ƻ���̳.lnk"
  LangString SC7   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\����ҳ - ���ļ���.lnk"
  LangString SC8   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\����ҳ - ��������.lnk"
  LangString SC9   ${LANG_SIMPCHINESE} "$SMPROGRAMS\${My_PRODUCT}\HTML�ļ����ּ���ת����.lnk"

  LangString DESC_InstTypeMinimum ${LANG_JAPANESE} "�V���v���C���X�g�[��"
  LangString DESC_InstTypeStandard ${LANG_JAPANESE} "�W���C���X�g�[��"

  LangString Item1 ${LANG_JAPANESE} "Unicode �⊮�v��J�[�l��"
  LangString Item2 ${LANG_JAPANESE} "Unicode ����IME"
  LangString Item2eudc ${LANG_JAPANESE} "�O���t�@�C��"
  LangString Item3 ${LANG_JAPANESE} "Unicode ���{��IME"
  LangString Item3ime ${LANG_JAPANESE} "MS ���{�� IME"
  LangString Item4 ${LANG_JAPANESE} "���{�ꉼ���t�@�C�����ϊ��v���O����"
  LangString Item5 ${LANG_JAPANESE} "HTML�h�L�������gMS950�݊��v���O����"
  LangString Item6 ${LANG_JAPANESE} "�ǎ��\��"
  LangString Item7 ${LANG_JAPANESE} "�X�^�[�g���j���[�V���b�g�J�b�g"
  LangString Item8 ${LANG_JAPANESE} "�A���C���X�g�[��"

  LangString DESC_SecItem1 ${LANG_JAPANESE} "BIG5�̊g�������W�B���ꂩ��BIG5�̉����������܂��I"
  LangString DESC_SecItem2 ${LANG_JAPANESE} "�Ђ炪�Ȃ���͂���Ƃ��ɕ֗��ł��B"
  LangString DESC_SecItem2eudc ${LANG_JAPANESE} "�u�ז�铁v�ɂ͂Ȃ�����⑫���܂��B"
  LangString DESC_SecItem3 ${LANG_JAPANESE} "�u���ԁv�Ɠ����ł����A�u�d�����v�����Ȃ��A���{��ɂȂ�Ă�����ɓK���Ă��܂��B"
  LangString DESC_SecItem3ime ${LANG_JAPANESE} "MS ���{�� IME"
  LangString DESC_SecItem4 ${LANG_JAPANESE} "�Â��Ђ炪�Ȃō쐬�����t�@�C�������A�V���� Unicode �t�@�C�����֕ϊ����܂��B"
  LangString DESC_SecItem5 ${LANG_JAPANESE} "BIG5�z�[���y�[�W�ŏ������ނƂ��A�N�ł������鉼���ɓ]���ł���v���O�����B"
  LangString DESC_SecItem6 ${LANG_JAPANESE} "Windows�̕ǎ��ł��i�΁j�B Active Desktop ���K�v�ł��B"
  LangString DESC_SecItem7 ${LANG_JAPANESE} "�X�^�[�g���j���[�ɃV���b�g�J�b�g�����܂��B"
  LangString DESC_SecItem8 ${LANG_JAPANESE} "�A���C���X�g�[��"

  LangString SC1   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �⊮�v�� ���폜����.lnk"
  LangString SC2   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\READ ME�i������j.lnk"
  LangString SC3   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\�o�[�W���������i������j.lnk"
  LangString SC4   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\���{�ꉼ���t�@�C�����ϊ��v���O����.lnk"
  LangString SC5   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �⊮�v�� �z�[���y�[�W.lnk"
  LangString SC6   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\Unicode �⊮�v�� �t�H�[�����i������j.lnk"
  LangString SC7   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\�e�X�g�y�[�W - ����.lnk"
  LangString SC8   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\�e�X�g�y�[�W - �ȑ̎�������.lnk"
  LangString SC9   ${LANG_JAPANESE} "$SMPROGRAMS\${My_PRODUCT}\HTML�h�L�������gMS950�݊��v���O����.lnk"
;=======================================================
; ��9.�Ѱ��w�˵{���A�u�����ʧ@
;=======================================================
; �o�ӳ����A�M�e�����إ� CreateUninst �A�N�����@�˳�C
; �e��: �� uninstaller �{�����X�ӡC
; ���: ���w�o�ӵ{���A�n�R�������ɮ�/�ؿ�/���U���C

;==============================
; 9.1 �`�q�}�l

Section "Uninstall"

; �n�������Ѱ��w�˵{��

  ; �����}�l�\���B�ୱ�B�ֻ��Ұʵ����|�C
   Rename "$INSTDIR\Backup\$R7_950.nls" "$SYSDIR\$R7_950-.NLS"
   StrCmp $R6 '98' UnNLS98
    StrCmp $6 '1028' UnNLS98
     Delete "$SYSDIR\C_950.NLS"
     IfFileExists "$SYSDIR\C_950.NLS" +2
;      Rename "$SYSDIR\C_950-.nls" "$SYSDIR\C_950.nls"
;     goto UnRenOK
      MessageBox MB_OK|MB_ICONEXCLAMATION "ĵ�i�G$\n======$\n�]��������]�A�A�� C_950.nls �w�D�t����w�I$\n$\n�A�ݭn�s�򭫷s�}���⦸�A�~�৹�������C"

UnNLS98:
  Rename /REBOOTOK "$SYSDIR\$R7_950-.nls" "$SYSDIR\$R7_950.nls"
  StrCmp '98' 0 UnRenOK
   Delete /rebootok "$SYSDIR\UAO-EUDC.TTE"
   StrCmp $6 '1028' 0 +5
    Rename "$INSTDIR\Backup\unicode.bin" "$SYSDIR\unicode-.bin"
    Rename "$INSTDIR\Backup\gdi.exe" "$SYSDIR\GDI-.EXE"
    Rename /rebootok "$SYSDIR\unicode-.bin" "$SYSDIR\unicode.bin"
    Rename /rebootok "$SYSDIR\gdi-.exe" "$SYSDIR\GDI.EXE"

   ;�y�r�ƥ��b���b?
   ClearErrors
   ReadRegStr $R0 HKCU "eudc\950" "BackupSystemDefaultEUDCFont"

   ;�y�r�ƥ��b���ܡA�g�^��l�ȡF
   ;���b���ܡA�ݬݬO�_�O��J�ڭ̪��y�r�ɡA�O���ܡA�M�������X�C
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

  ; �R�� 2.00 �����d�U�̡C
  IfFileExists "$SYSDIR\$R7_950cs.nls" 0 +2
   Delete /rebootok "$SYSDIR\$R7_950cs.nls"

  StrCmp $R6 '98' +2
  ; �ˬd�ݬݬO�_�����t�ΡA�Y�O�A�h������ $instdir �ؿ�
   IfFileExists "$INSTDIR\Backup\CP_950.nls" nodel200 del_instdir

  ; �ˬd�ݬݬO�_�����t�ΡA�Y�O�A�h������ $instdir �ؿ�
   IfFileExists "$INSTDIR\Backup\C_950.nls" 0 del_instdir

nodel200:
  MessageBox MB_OK|MB_ICONINFORMATION  "$(GetAnotherOne)"
  goto del_instdir_ok

del_instdir:
  ; �����ϥιL���ؿ��C
  RMDir /r "$INSTDIR"

del_instdir_ok:
  ; �����}�l�\���B�ୱ�B�ֻ��Ұʵ����|�C
  RMDir /r "$SMPROGRAMS\${My_PRODUCT}"

  ; �R�� windows ���U�������w�˸��|
  DeleteRegKey HKLM SOFTWARE\${My_PRODUCT}

  ; �R�� windows ���U���Ѱ��w��
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${My_PRODUCT}"

  ; �R���ƹ��k��
;DeleteRegKey HKLM "SOFTWARE\Classes\CLSID\{b5eedee0-c06e-11cf-8c56-444553540000}\InProcServer32"
;DeleteRegKey HKLM "SOFTWARE\Classes\CLSID\{b5eedee0-c06e-11cf-8c56-444553540000}"

  ; �R�� uninstaller �ϥΪ��y���W�� (* �i��)
  DeleteRegValue HKLM "Software\${My_PRODUCT}" "Installer Language"

  ;��ܡu�����v���Y (* �i��)
;  !insertmacro MUI_UNFINISHHEADER

  StrCmp $R6 '2k3' 0 No2k3
   ;�٭�� Windows File Protect �C���ק�
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
; ��4.�w�˵{���A�w�˶}�l���e�m�ʧ@ (* �i��)
;=======================================================
; �p�G���ݭn�A�A�i�H���� remark�C

Function .onInit
; ���� OS & �t�λy��
; $6  �Ǧ^ �y�� (dec)�C
; $7  �Ǧ^ �y�� (hex)�C
; $R6 �Ǧ^ OS�C
; $R7 �Ǧ^ OS �� nls �N�X�C98=CP�BNT=C�C
;�ˬd os �ثe�y���A�Y�D 0x0404 (�x�W) or 0x0c04 (����)�A�h quit
System::Call 'kernel32::GetSystemDefaultLangID() i .r6'
IntOp $6 $6 & 0xFFFF

; IntFmt �� Format string �榡
; %c = %@Char[] = �uascii �Ʀr�v���u�r���v
; %u = %@Ascii[] = �u�r���v���uascii �Ʀr�v
; %x = �Q�i�� �� �Q���i�� �p�g
; %X = �Q�i�� �� �Q���i�� �j�g
; %0�ƦrX = �Q�i�� �� �Q���i�� �j�g�A�@�u�Ʀr�v��ơA�������ܦb�e��� 0�C
IntFmt $7 "%04X" $6

; TW=1028, HK=3076, �D��=5124, GB=2052, �s�[�Y=4100, JP=1041 => EN=1033=All Others
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

; ���K�]�w�u�y���v
StrCpy $LANGUAGE $6

StrCmp $r1 'HK' 0 +3
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "ĵ�i�I�w�˵{���o�{�A�ϥΪ��O�y������D���y�t�z�� Windows�C$\n$\n�Ъ`�N�I$\n$\n�uUnicode �ɧ��p�e�v�P�y��D�a�ϡz�ҳq�Ϊ��u����F���W�ɳy�r�� (HKSCS)�v�ä��ۮe�A�Y�A���ϥΡu����r�v���ݨD�A�~��w�˥��n��A�N�i��ɭP�\�h���`�{�H�o�͡C$\n$\n�аݭn�~��ܡH" IDYES +2
 Quit

; ���w�X�Ъ��
StrCpy $FTPageLicense "0"       ;PageLicense ���X�СA����L�@����N�|�Q�F���F
StrCpy $FTPageCompoment "0"     ;PageCompoment ���X�СA����L�@����N�|�Q�F���F
StrCpy $R7 'CP'

; ���o�t�Ϊ��u�w�]�s�����v
ReadRegStr $Def3WBrowser HKCR "http\shell\open\command" ""
StrLen $r1 $Def3WBrowser
IntOP $r1 $r1 - 10
StrCpy $r2 $Def3WBrowser 10 $r1
StrCmp $r2 ' -url "%1"' 0 +2
 StrCpy $Def3WBrowser $Def3WBrowser $r1

;==============================
; 4.2 �r�����  (* �i��)
;
; �u�v�T�w�˵{�����y����� dialog �A�]�����n�ϥΤ���r���W�١C
; Push Verdana
; Push 9

;==============================
; 4.4 �w�˫e�m�ʧ@ (�ק���U��) (* �i��)
;
; ���A�ݭn�A�i�H�������@�ǰʧ@�C

;==============================
; 4.5 �M���ª��w�w�˪��ؿ��C (* �i��)
;
; �p�G "Install_Dir" Ū�X�����ݦ� \ �Ÿ��A�N�� \ �h���C

  ReadRegStr $0 HKLM "Software\${My_PRODUCT}" "Install_Dir"
  StrLen $1 $0
  StrCmp $1 '0' Final_onInit
   IntOP $1 $1 - 1
   StrCpy $2 $0 1 $1
   StrCmp $2 '\' +2
    IntOP $1 $1 + 1
   StrCpy $INSTDIR $0 $1

Final_onInit:
; �ק� BIG5_Extension 2.10 2.00 �d�U���ݾl�C
   DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BIG5_Extension"

;InitPluginsDir
File /oname=$PLUGINSDIR\license1028.txt "1028license.txt"
File /oname=$PLUGINSDIR\license1033.txt "1033license.txt"
File /oname=$PLUGINSDIR\license1041.txt "1041license.txt"
File /oname=$PLUGINSDIR\license2052.txt "2052license.txt"
FunctionEnd
;===============================================================================
;;==============================
;; 4.3 �y�� (* �i��)
;;
;; ��F ENU/CHT/CHS �T�ӻy���C�A�n 18 �ӻy������A�]���Ϲ�C�j�p�j���W�[ 20 kb ���k�C
;; �p�G���O�h�y������Ʀw�ˡA�A�i�H���� remark ���C
;; LangDLL::LangDialog "MUI_LANGDLL_WINDOWTITLE" "MUI_LANGDLL_INFO" �i��ܻy���ƥ� �y��1 �y���N�X1 �y��2 �y���N�X2 �y��3 �y���N�X3 �y��4 �y���N�X4
;LangString IL ${LANG_ENGLISH}     "Installer Language"
;LangString IL ${LANG_TRADCHINESE} "�w�˻y��"
;LangString IL ${LANG_SIMPCHINESE} "��װ����"
;LangString IL ${LANG_JAPANESE}    "Installer Language"
;LangString CL ${LANG_ENGLISH}     "Please select a language."
;LangString CL ${LANG_TRADCHINESE} "�п�ܱz�n���w�˻y��"
;LangString CL ${LANG_SIMPCHINESE} "��ѡ����Ҫ�İ�װ����"
;LangString CL ${LANG_JAPANESE}    "Please select a language."
;LangString ENG ${LANG_ENGLISH}     "�^�yEN"
;LangString ENG ${LANG_TRADCHINESE} "�^�y"
;LangString ENG ${LANG_SIMPCHINESE} "Ӣ��"
;LangString ENG ${LANG_JAPANESE}    "�^�yJP"
;LangString ROC ${LANG_ENGLISH}     "�c�餤��EN"
;LangString ROC ${LANG_TRADCHINESE} "�c�餤��"
;LangString ROC ${LANG_SIMPCHINESE} "��������"
;LangString ROC ${LANG_JAPANESE}    "��铎�������"
;LangString PRC ${LANG_ENGLISH}     "²�餤��EN"
;LangString PRC ${LANG_TRADCHINESE} "²�餤��"
;LangString PRC ${LANG_SIMPCHINESE} "��������"
;LangString PRC ${LANG_JAPANESE}    "�ȑ̎�������"
;LangString JAP ${LANG_ENGLISH}     "��yEN"
;LangString JAP ${LANG_TRADCHINESE} "��y"
;LangString JAP ${LANG_SIMPCHINESE} "����"
;LangString JAP ${LANG_JAPANESE}    "���{��"
;
; �H�U������Ӥ�k�G
;
; ��k�@�A�ϥ� MUI ����k�G
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
; ��k�@�����C
;
; ��k�G�A���ϥ� MUI ����k�G
; LangDLL::LangDialog "$(IL)" "$(CL)" 4 "English $(ENG)" 1033 "Chinese (Traditional) $(ROC)" 1028 "Chinese (Simplified) $(PRC)" 2052 "Japanese $(JAP)" 1041
; Pop $LANGUAGE
; StrCmp $LANGUAGE "cancel" 0 LangSelOK
;    Abort
;;LangSelOK:
; ��k�G�����C
;===============================================================================
Function popup_message
StrCmp $FTPageLicense "0" +2
 return
StrCpy $FTPageLicense "1"

;; �T��u���i�J�v
System::Call 'kernel32::CreateMutexA(i 0, i 0, t "KiiAliButHoWitchFive") i .r1 ?e'
Pop $R0
StrCmp $R0 '0' +3
 MessageBox MB_OK|MB_ICONSTOP "$(MSG_RunOnesAtTheSameTime_checked)"
 Quit
;==============================
; 4.1 ��ܪ��v�v��
;
; �ª��i�ϥ� magiclime ���H�J�H�X�C���L�o�@���S�F�A�令
; advsplash �A�~���覡�C�����Y���{�ɥؿ��A��� splash �A�M��R���C
; �`�N: nsis 2.0a0 �� magicsplash �ɮסC���L 2.0b1 �~�M�S�����F�C

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

;�S�ˡuie �c�餤��䴩�v���å�A�����ˡC
StrCmp $6 "1028" +4
 IfFileExists "$Fonts\Mingliu.ttc" +3
  MessageBox MB_OK|MB_ICONSTOP "$(MSG_NO_IEPKTW_checked)"
  Quit

; �ˬd�@�~�t�Ϊ����A�M��� Win98_checked ��b�ɮק��ݡA�[ĵ�i�����C
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
     MessageBox MB_OK|MB_ICONEXCLAMATION "�`�N�G$\n$\nWindows 98/SE/ME ������ Alpha release$\n$\n�Цb�\Ū�Ҧ����B�ۤv�t�d���e���U�w�ˡC"
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
   MessageBox MB_YESNO|MB_ICONEXCLAMATION "ĵ�i�I�w�˵{���o�{�A�w�g�w�ˤF�u����F���W�ɳy�r�� (HKSCS)�v�C$\n$\n�uUnicode �ɧ��p�e�v�P HKSCS �ä��ۮe�A�~��w�ˡuUnicode �ɧ��p�e�v�N�ɭP HKSCS ���ġC$\n$\n�T�w�n�~��ܡH" IDYES +2
   Quit

;�A���@���A�S�ˡuie �c�餤��䴩�v���å�A�����ˡC
StrCmp $6 "1028" +4
 IfFileExists "$SysDir\$R7_950.NLS" +3
  MessageBox MB_OK|MB_ICONSTOP "$(MSG_NO_IEPKTW_checked)"
  Quit

;�]�����n�� command.com�A�p�G�S�� command.com ���H�A�����ˡC
StrCpy $ComPath '$windir'
IfFileExists "$ComPath\command.com" +5
 StrCpy $ComPath 'C:'
 IfFileExists "$ComPath\command.com" +3
 MessageBox MB_OK|MB_ICONSTOP "Can not find Command.com, Stop Install.$\n$\n�䤣�� Command.com�A�w�ˤ���C"
 quit


StrCmp $R6 '98' ChkMingliu98
  ; ���K���@�U�A�O���O Administrator�C
  UserInfo::GetAccountType
  Pop $R0
  StrCmp $R0 "Admin" CheckingOK
   MessageBox MB_OK|MB_ICONSTOP  "$(MSG_Admin_checked)"
   Quit

ChkMingliu98:
;���K���@�U�ݧA�ݤ��ݭn��s�u�ө���v&�u�з���v
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
; 4.6 �w�˫e���ܰT��

   StrCmp $R6 '98' +3
    MessageBox MB_OK|MB_ICONINFORMATION  "$(MSG_NT_PREINST1)"
    return
   MessageBox MB_OK|MB_ICONINFORMATION  "$(MSG_9X_PREINST1)"
;  StrCmp $6 '1028' 0 +2
;   ExecShell open "http://cpatch.org/witchfive/pastepic/lfnbakren/lfnbakren.html"

FunctionEnd
;===============================================================================
Function .onSelChange
; 98 �����uunicode ����J�v&�uMS ��� IME�v&�u���ɦW�{���v�C
; NT �����u�y�r�ɡv�C
;; �D big5 �ϥΪ̡G�����Ҧ��u��J�k�v&�u���ɦW�{���v�C
; �D big5 �ϥΪ̡G�����Ҧ��u�D unicode ��J�k�v&�u���ɦW�{���v�C
; �����k�G���]�w�� section ���u������v& Read Only ���A�A
;         �M��A��� section�u���áv�C
;SecItem2eudc - �y�r��
;SecItem2 - ����J�k
;SecItem3 - Unicode ����J�k
;SecItem3ime - MS ��� IME ��J�k
;SecItem4 - ���ɦW�{��

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

; �u�O��u���v���u�ġv�����@���Ӥw
   SectionGetFlags ${SecItem2} $R0
   IntOP $R0 $R0 & 0xFFFFFFFE
   SectionSetFlags ${SecItem2} $R0

NotFirstCall:
  !insertmacro DisSection "${SecItem2eudc}"


StrCmp $6 '1028' CheckOldRenameTable
 !insertmacro DisSection "${SecItem4}"
return

; �p�G�O�u�c�� nt kernel os�v�A�j��w�˧�W�{���C
CheckOldRenameTable:
;; �p�G uc-o2n.tbl �w�s�b�A�j��Ŀ�uUcFileRenamer�v
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
; ��5.�w�˵{���A�w�˧�����m�ʧ@ (* �i��)
;=======================================================
; �p�G���ݭn�A�A�i�H���� remark�C

;==============================
; 5.1 �禡�w�q�}�l
;Function .onInstSuccess

;==============================
; 5.2 �w�˧�����A���� ExecShell
;
; ���ӤH�ݭn�өw�A�ڥu�Φb Eudora �w�˦Ӥw�C
; ;------------------------------------------
; !macro MUI_INSTSUCCESS1 LANGID TEXT
;
;   StrCmp $LANGUAGE ${LANGID} "" +3
;   MessageBox MB_YESNO|MB_ICONQUESTION  "${TEXT}" IDNO Nomapi
;     ExecShell open '$INSTDIR\SWMAPI.EXE'
; !macroend
; ;------------------------------------------;

; �U�C�O ENU/CHT/CHS �T�ӻy�����ʧ@�C
;
; !insertmacro MUI_INSTSUCCESS1 1033 "Do you want to install  ${NAME} as a default mailer?  It will execute MAPI installer."
; !insertmacro MUI_INSTSUCCESS1 1028 "�A�Q�n�w�� ${NAME} �����w�]�H��{���ܡH�N����~�� MAPI �w�˵{���C"
; !insertmacro MUI_INSTSUCCESS1 2052 "����Ҫ��װ ${NAME} ��ΪĬ���ʼ������𣿽������ⲿ MAPI ��װ����"
; Nomapi:

;==============================
; 5.3 �w�˫�A�n�D�ϥΪ�Ū�� README �ɮ�
 

;  ;------------------------------------------
;  !macro MUI_INSTSUCCESS2 LANGID TEXT README
 
;    StrCmp $LANGUAGE ${LANGID} "" +3
;;    MessageBox MB_YESNO|MB_ICONQUESTION  "${TEXT}" IDNO NoReadme
;;    ExecShell open notepad '$INSTDIR\${README}'
;;    ExecShell open '$INSTDIR\${README}'
;  !macroend
;; ;------------------------------------------
 
;; �U�C�O ENU/CHT/CHS �T�ӻy�����ʧ@�C
 
;; !insertmacro MUI_INSTSUCCESS2 1033 "Setup has been completed successfully .  Press [Yes] to continue README file." "${README_ENU}"
;; !insertmacro MUI_INSTSUCCESS2 1028 "�w�ˤw���\�a�����C���U [Yes] �~��Ū�� README �ɮסC" "${README_CHT}"
;; !insertmacro MUI_INSTSUCCESS2 2052 "��װ�ѳɹ�����ɡ����� [Yes] ������ȡ README �ļ���" "${README_CHS}"
;; NoReadme:
;==============================
; 5.4 �禡�w�q����

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
; 9.2 �Ѱ��w�˵{���A��l�ƨ禡�ʧ@ (* �i��)

Function un.onInit

  ;�q���U����o�y���W��
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
; ��eof �ɮ׵���
