# nginx-win64-builder
Automatic build 64-bit Windows binaries of the latest nginx and openssl releases. For basic authentication use `user1:1234567890` or change it by editing 8 and 9 line in `2.sh` before compiling.

### Used software:
- [nginx](https://nginx.org/) latest release
- [ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) latest release
- [nginx-fancyindex-minimal](https://github.com/drklee3/Nginx-Fancyindex-Minimal) master branch
- [openssl](https://www.openssl.org/) latest release
- [zlib](https://www.zlib.net/) latest release
- [pcre](https://www.pcre.org/) latest release


### Prerequirements:
- Windows 10 64-bit;
- Download and install [Visual Studio Build Tools 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16) with Visual C++ build tools;
- Download and install [MSYS2 64-bit](https://www.msys2.org/);
- Install [NASM 64-bit](https://www.nasm.us/);
- Install [Strawberry Perl 64-bit](http://strawberryperl.com/).


### Compile nginx from sources:
1. Download latest version of scripts from [**here**](https://github.com/cyberunknown/nginx-win64-builder/releases);
2. Put files from archive to `C:\msys64\home\%username%\`;
3. Double click on `compile.bat` and wait until MSYS2 shell window are closed;
4. Press any key to continue and wait until all shell windows are closed;
5. Grab your freshly compiled nginx with openssl and fancyindex theme from `C:\msys64\home\%username%\`.
