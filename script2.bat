cd nginx
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 %*
@set path=C:\Program Files\NASM;%path%
nmake.exe /f objs\Makefile
exit
