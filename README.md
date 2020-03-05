# nginx-win64-builder
Automatic build nginx 64-bit binaries for Windows.

Prerequirements:
- Windows 10 64-bit
- [Visual Studio Community 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16)
  - Visual C++
- [MSYS2 64-bit](http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20190524.exe)
- [NASM 64-bit](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/win64/nasm-2.14.02-installer-x64.exe)
- [Strawberry Perl 64-bit](http://strawberryperl.com/download/5.30.1.1/strawberry-perl-5.30.1.1-64bit.msi)

Building from source:
1. Put all files in `C:\msys64\home\%username%\`
2. Run `msys2.exe` from `C:\msys64\` type `sh script1.sh` and press Enter
3. Run `script2.bat` **TODO**
4. Run `sh script3.sh` in `msys2.exe`
5. Done.