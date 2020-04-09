wget https://github.com/nginx/nginx/archive/release-1.17.9.tar.gz https://github.com/aperezdc/ngx-fancyindex/archive/v0.4.4.tar.gz https://github.com/drklee3/Nginx-Fancyindex-Minimal/archive/master.tar.gz https://github.com/openssl/openssl/archive/OpenSSL_1_1_1f.tar.gz https://github.com/madler/zlib/archive/v1.2.11.tar.gz https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.gz
for i in `ls *.gz` ; do tar -xvzf $i ; done
rm *.gz
mv Nginx-Fancyindex-Minimal-*/fancyindex/ fancyindex/
rm fancyindex/footer.*
mv nginx-release-*/ nginx/
mkdir -p nginx/objs/lib/
mv openssl-*/ nginx/objs/lib/openssl/
mv zlib-*/ nginx/objs/lib/zlib/
mv pcre-*/ nginx/objs/lib/pcre/
mv ngx-fancyindex-*/ nginx/objs/lib/ngx-fancyindex/
cd nginx
sed -i 's/32/64A/g' auto/lib/openssl/makefile.msvc
sed -i 's/do_ms.bat/do_win64a.bat/g' auto/lib/openssl/makefile.msvc
sed -i 's/do_ms/do_win64a/g' auto/lib/openssl/makefile.msvc
sed -i 's/W4/W3/g' auto/cc/msvc
sed -i '14a NGX_MSVC_VER=19.25.28612' auto/cc/msvc
sed -i '14d' auto/cc/msvc
sed -i '15d' auto/cc/msvc
auto/configure \
    --with-cc=cl \
    --builddir=objs \
    --prefix= \
    --conf-path=conf/nginx.conf \
    --pid-path=logs/nginx.pid \
    --http-log-path=logs/access.log \
    --error-log-path=logs/error.log \
    --sbin-path=nginx.exe \
    --http-client-body-temp-path=temp/client_body_temp \
    --http-proxy-temp-path=temp/proxy_temp \
    --http-fastcgi-temp-path=temp/fastcgi_temp \
    --http-scgi-temp-path=temp/scgi_temp \
    --http-uwsgi-temp-path=temp/uwsgi_temp \
    --with-cc-opt=-DFD_SETSIZE=1024 \
    --with-pcre=objs/lib/pcre \
    --with-zlib=objs/lib/zlib \
    --with-openssl=objs/lib/openssl \
    --with-openssl-opt="no-tests" \
    --with-http_addition_module \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-ipv6 \
    --add-module=objs/lib/ngx-fancyindex
sed -i '1529,1533 d' objs/Makefile
