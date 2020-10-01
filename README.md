# nginx-win64-builder
Automatic build 64-bit Windows binaries of the latest nginx and openssl releases. For basic authentication use `user1:1234567890` or change it by editing 8 and 9 line in `2.sh` before compiling.

### Used software:
- [nginx](https://nginx.org/) 1.19.2
- [ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) latest release
- [nginx-fancyindex-minimal](https://github.com/drklee3/Nginx-Fancyindex-Minimal) master branch
- [openssl](https://www.openssl.org/) latest release
- [zlib](https://www.zlib.net/) latest release
- [pcre](https://www.pcre.org/) latest release


### Prerequirements:
- Windows 10 x64
- [Visual Studio Build Tools 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16) with Visual C++ build tools
- [MSYS2 x64](https://www.msys2.org/)
- [NASM v2.14.02 x64](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/win64/) (Note: run installer with admin rights for system-wide installation)
- [Strawberry Perl x64](http://strawberryperl.com/)


### Compile nginx from sources:
1. [Download](https://github.com/cyberunknown/nginx-win64-builder/releases/latest) latest version of scripts;
2. Put files from archive to `C:\msys64\home\%username%\`;
3. Double click on `compile.bat` and wait until msys2 shell window are closed;
4. Press any key to continue and wait until all shell windows are closed;
5. Grab your freshly compiled nginx with openssl and fancyindex theme from `C:\msys64\home\%username%\`.
