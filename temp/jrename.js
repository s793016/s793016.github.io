//Unicode �ɧ��p�� ����ɦWUnicode��s�{��
//
// (��������WindowsNT/2000/XP�ϥΡC)
//==============================================================
//���}�G http://unicode.cosdreamer.com
//--------------------------------------------------------------
//�����k
//�ЦbDOS�����U >cscript jrename.js
//���n�ηƹ������L
//--------------------------------------------------------------
//���{�����ۥѳn��C����H�o�r���w�ˡB�ƻs�B���G���n��C�����o��
//�ܮM�󤺮e������C�礣�o�H���M��i��c��B�X���Ψ�L�����ζ���
//��Q���欰�C
//
// Program written by HO        (http://unicode.cosdreamer.com)
//                    Tim Chien (http://timc.idv.tw/dream/)
// Copyright (C) 2001

var WSHShell = WScript.CreateObject("WScript.Shell");
var start = WSHShell.Popup(
	"���{���N�|�ഫ�w�Ф��Ҧ��t����尲�W���ɮסA�N������쥿�T��Unicode��m�C\n" +
	"�j�P��ĳ�z�i�楻�@�~�A�_�h�i��z�N�L�k�H�Y�ǳn��}�ҳo���ɮסC\n\n" + 
	"�̵w�Фj�p�B�ɮצh�褧���P�A�i��ݭn�Ƥ������ɶ��������@�~�C\n\n" +
	"�аݭn�ഫ��?"
	,0 ,"Unicode�ɧ��p�� - ����ɦWUnicode��s�{��", 65 );
if (start == 2) WScript.Quit();

var re = new RegExp();
re.compile( "[^ \x00-\xFF�@-�]", "" );

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
WSHShell.Popup( "�@�@��"+chg+"���ɮ׳Q�ഫ�C\n\n" +
	"�H��Y�n�A���楻�{���A�п��[�{����]-[Unicode�ɧ��p��]-[����ɦW��s�{��]�A�����楻�{���C", 0, "�ഫ����\n", 64);

function openDir( dir ) {
	WScript.Echo ( '���b�j�M ' + dir );
	
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
					WScript.Echo ( '��Ƨ� ' + dir + " ���A�ɮ� " + nfn + ' �w�s�b�C\n' );
					WSHShell.Popup( "��Ƨ� " + dir + " ���A�w�g�s�b���@���ɮ� " + nfn + " �C\n" +
					"���F���n�л\�ɮסA�o���ɮױN�L�k��W�C\n\n" +
					"�Цb����ɦW����A�п��[�{����]-[Unicode�ɧ��p��]-[����ɦW��s�{��]�A�����楻�{���C",
					20 ,"Unicode�ɧ��p��", 64 );
					Output( '(ERROR) File ' + dir + "\\" + nfn + ' cannot be renamed.' );
				}
				else {
					fn.name = nfn;
					WScript.Echo ( '���F�ɮ� ' + fn.path + ' �C\n' );
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
					WScript.Echo ( '��Ƨ� ' + dir + "\\" + nfn + ' �w�s�b�C\n' );
					WSHShell.Popup( "��Ƨ� " + dir + "\\" + nfn + " �w�s�b�C\n" +
					"���F�w���A�o�Ӹ�Ƨ��N�L�k��W�C\n\n" + 
					"�Цb����Ƨ��W�٤���A�п��[�{����]-[Unicode�ɧ��p��]-\n[����ɦW��s�{��]�A�����楻�{���C",
					20 ,"Unicode�ɧ��p��", 64 );
					Output( '(ERROR) Folder ' + dir + "\\" + nfn + ' cannot be renamed.' );
				}
				else {
					di.name = nfn;
					WScript.Echo ( '���F��Ƨ� ' + di.path + '.\n' );
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
		if ((unicode >= 63223) && (unicode <= 63305)) unicode -= 50870; //�Y�p���Q
		else if ((unicode >= 63306) && (unicode <= 63391)) unicode -= 50857; //ǧǻǧ��
	}
	else if ( unicode == 63219 ) {
		unicode = 12540; //��O��
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