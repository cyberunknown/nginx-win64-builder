# nginx-win64-builder
Automatic build 64-bit Windows binaries of the latest nginx and openssl releases. For basic authentication use `user1:1234567890` or change it by editing 8 and 9 line in `2.sh` before compiling.

Currently uses:
- [nginx](https://nginx.org/) 1.17.9
- [ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) 0.4.4
- [nginx-fancyindex-minimal](https://github.com/drklee3/Nginx-Fancyindex-Minimal) master
- [openssl](https://www.openssl.org/) 1.1.1f
- [zlib](https://www.zlib.net/) 1.2.11
- [pcre](https://www.pcre.org/) 8.44


### Prerequirements:
- Windows 10 64-bit;
- Install [Visual Studio Build Tools 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16):
  - Select `Visual C++ build tools`;
  - Uncheck all optional packages except `MSVC v142`;
  - Press `Install`.
- Install [MSYS2 64-bit](http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20190524.exe);
- Install [NASM 64-bit](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/win64/nasm-2.14.02-installer-x64.exe);
- Install [Strawberry Perl 64-bit](http://strawberryperl.com/download/5.30.2.1/strawberry-perl-5.30.2.1-64bit.msi).


### Compile nginx from sources:
1. Download latest version of scripts from [**here**](https://github.com/cyberunknown/nginx-win64-builder/releases);
2. Put files from archive to `C:\msys64\home\%username%\`;
3. Double click on `compile.bat` and wait until MSYS2 shell window are closed;
4. Press any key to continue and wait until all shell windows are closed;
5. Grab your freshly compiled nginx with openssl and fancyindex theme from `C:\msys64\home\%username%\`.
