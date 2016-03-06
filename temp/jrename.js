//Unicode 補完計劃 日文檔名Unicode更新程式
//
// (本版本限WindowsNT/2000/XP使用。)
//==============================================================
//網址： http://unicode.cosdreamer.com
//--------------------------------------------------------------
//執行方法
//請在DOS視窗下 >cscript jrename.js
//不要用滑鼠雙擊他
//--------------------------------------------------------------
//本程式為自由軟體。任何人得字型安裝、複製、散佈本軟體。惟不得改
//變套件內容之完整。亦不得以本套件進行販賣、出租或其他直接或間接
//營利之行為。
//
// Program written by HO        (http://unicode.cosdreamer.com)
//                    Tim Chien (http://timc.idv.tw/dream/)
// Copyright (C) 2001

var WSHShell = WScript.CreateObject("WScript.Shell");
var start = WSHShell.Popup(
	"本程式將會轉換硬碟中所有含有日文假名的檔案，將其對應到正確的Unicode位置。\n" +
	"強烈建議您進行本作業，否則可能您將無法以某些軟體開啟這些檔案。\n\n" + 
	"依硬碟大小、檔案多寡之不同，可能需要數分鐘的時間完成本作業。\n\n" +
	"請問要轉換嗎?"
	,0 ,"Unicode補完計劃 - 日文檔名Unicode更新程式", 65 );
if (start == 2) WScript.Quit();

var re = new RegExp();
re.compile( "[^ \x00-\xFF一-龠]", "" );

var bfso, bfc, spacer, chg;
bfso = new ActiveXObject("Scripting.FileSystemObject");
bfc = new Enumerator(bfso.Drives);
var chg = 0;

var today = new Date();
Output( '\n\n---------------------------------------------------------' );
Output( '  Rename Log File on ' + today );
Output( '---------------------------------------------------------' );

for ( ; !bfc.atEnd(); bfc.moveNext() ) {
	var dri = bfc.item();
	if ( ( dri.DriveType == 1 || dri.DriveType == 2 ) && dri.IsReady ) {
		openDir( dri.RootFolder );
	}
}
Output( chg + ' files/folders renamed.' );
WSHShell.Popup( "一共有"+chg+"個檔案被轉換。\n\n" +
	"以後若要再執行本程式，請選取[程式集]-[Unicode補完計劃]-[日文檔名更新程式]再次執行本程式。", 0, "轉換完成\n", 64);

function openDir( dir ) {
	WScript.Echo ( '正在搜尋 ' + dir );
	
	var fso, f, fc;
	fso = new ActiveXObject( "Scripting.FileSystemObject" );
	f = fso.GetFolder( dir );

	fc = new Enumerator( f.files );
	for ( ; !fc.atEnd(); fc.moveNext() ) {
		var fn = fc.item();
		if ( fn.name.search( re ) > -1 ) {
			var nfn = '';
			for ( var k=0; k < fn.name.length; k++ ) {
				nfn += String.fromCharCode( b5jpcovt( fn.name.charCodeAt(k) ) );
			}
			if ( fn.name != nfn ) {
				if ( fso.FileExists( dir + "\\" + nfn ) ) {
					WScript.Echo ( '資料夾 ' + dir + " 中，檔案 " + nfn + ' 已存在。\n' );
					WSHShell.Popup( "資料夾 " + dir + " 中，已經存在有一個檔案 " + nfn + " 。\n" +
					"為了不要覆蓋檔案，這個檔案將無法更名。\n\n" +
					"請在更改檔名之後，請選取[程式集]-[Unicode補完計劃]-[日文檔名更新程式]再次執行本程式。",
					20 ,"Unicode補完計劃", 64 );
					Output( '(ERROR) File ' + dir + "\\" + nfn + ' cannot be renamed.' );
				}
				else {
					fn.name = nfn;
					WScript.Echo ( '更改了檔案 ' + fn.path + ' 。\n' );
					Output( 'Rename file ' + fn.path );
					chg ++;
				}
			}
		}
	}
	
	fc = new Enumerator( f.SubFolders );
	for ( ; !fc.atEnd(); fc.moveNext() ) {
		var di = fc.item();
		if ( di.name.search( re ) > -1 ) {
			var nfn = '';
			for ( var k=0; k < di.name.length; k++ ) {
				nfn += String.fromCharCode( b5jpcovt( di.name.charCodeAt(k) ) );
			}
			if ( di.name != nfn ) { 
				if ( fso.FolderExists( dir + "\\" + nfn ) ) {
					WScript.Echo ( '資料夾 ' + dir + "\\" + nfn + ' 已存在。\n' );
					WSHShell.Popup( "資料夾 " + dir + "\\" + nfn + " 已存在。\n" +
					"為了安全，這個資料夾將無法更名。\n\n" + 
					"請在更改資料夾名稱之後，請選取[程式集]-[Unicode補完計劃]-\n[日文檔名更新程式]再次執行本程式。",
					20 ,"Unicode補完計劃", 64 );
					Output( '(ERROR) Folder ' + dir + "\\" + nfn + ' cannot be renamed.' );
				}
				else {
					di.name = nfn;
					WScript.Echo ( '更改了資料夾 ' + di.path + '.\n' );
					Output( 'Rename folder ' + di.path );
					chg ++;
				}
			}
		}

		if ( di.name != 'RECYCLER' &&
			 di.name != 'Windows' &&
			 di.name != 'Program Files' &&
			 di.name != 'WINNT' &&
			 di.name != 'Microsoft' &&
			 di.name != 'Cookies' &&
			 di.name != 'Temp' &&
			 di.name != 'Temporary Internet Files' &&
			 di.name != 'Recent' &&
			 di.name != 'Inetpub' ) {
			openDir( di );
		}
	}
}

function b5jpcovt(unicode) {
	if ((unicode >= 63223) && (unicode <= 63391)) {		
		if ((unicode >= 63223) && (unicode <= 63305)) unicode -= 50870; //チヘゎス
		else if ((unicode >= 63306) && (unicode <= 63391)) unicode -= 50857; //ロУロЮ
	}
	else if ( unicode == 63219 ) {
		unicode = 12540; //み記號
	}
	return unicode;
}

function Output( str )
{
	var fso, tf;
	fso = new ActiveXObject( "Scripting.FileSystemObject" );
	tf = fso.OpenTextFile( ".\\renamelog.txt", 8, true );
	tf.WriteLine( str );
	tf.Close();
}