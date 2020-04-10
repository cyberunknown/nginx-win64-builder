cd "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\"
for /d %%F in (*) do cd "%%F" & goto :break
:break
strings "bin\Hostx64\x64\cl.exe" > cl
@call C:\msys64\msys2_shell.cmd -bash -lc "sh 1.sh"
pause
cd nginx
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64 %*
@set path=C:\Program Files\NASM;%path%
nmake.exe /f objs\Makefile
cd ..
@call C:\msys64\msys2_shell.cmd -bash -lc "sh 2.sh"
