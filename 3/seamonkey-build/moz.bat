@echo off
set MOZ_TOOLS=D:\MOZTOOLS
SET GLIB_PREFIX=%moztools%
SET LIBIDL_PREFIX=%moztools%
set CYGWINBASE=d:\cygwin
set CYGWIN=nodosfilewarning

path=%cygwinbase%\bin;%path%;%Moz_tools%\bin;
call D:\VStudio\VC\vcvarsall.bat x86
set WIN32_REDIST_DIR=%VCINSTALLDIR%\redist\x86\Microsoft.VC80.CRT
set VCPROFILE_PATH=d:\mozilla\obj\dist\bin\pgc