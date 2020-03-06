cd nginx
@set path=C:\Program Files\NASM;%path%
@set path=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\;%path%
nmake.exe /f objs\Makefile
