![](https://github.com/cyberunknown/nginx-win64-builder/blob/master/nginx.png)
# nginx-win64-builder
Automatic build nginx 64-bit binaries for Windows.

### Descriptions:
This scripts let you build 64-bit Windows binaries of the latest nginx and openssl release under Windows.
Currently uses this sources:
- nginx 1.17.9
- ngx-fancyindex 0.4.4
  - modified fancyindex theme from %author%
- openssl 1.1.1d
- zlib 1.2.11
- pcre 8.44

Also for example creates `user1` with password `1234567890` for `ngx_http_auth_basic_module`.


### Prerequirements:
- Windows 10 64-bit
- [Visual Studio Community 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16)
  - Visual C++
- [MSYS2 64-bit](http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20190524.exe)
- [NASM 64-bit](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/win64/nasm-2.14.02-installer-x64.exe)
- [Strawberry Perl 64-bit](http://strawberryperl.com/download/5.30.1.1/strawberry-perl-5.30.1.1-64bit.msi)


### Compile nginx from source:
1. Download latest version of nginx-win64-installer from [**here**](https://github.com/cyberunknown/nginx-win64-builder/archive/master.zip)
2. Put all files from zip in `C:\msys64\home\%username%\`;
3. Run `msys2.exe` from `C:\msys64\` type `sh script1.sh` and press Enter;
4. Run `script2.bat` **TODO**;
5. Run `sh script3.sh` in `msys2.exe`;
6. Grab your freshly compiled nginx from `C:\msys64\home\%username%\` and fancyindex theme.
