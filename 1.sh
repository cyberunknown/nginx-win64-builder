cl_version=`cat cl | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'`
nginx_latest=`wget -O- https://github.com/nginx/nginx/releases | grep -Eo 'release-[0-9\.]+.tar.gz' | sort -V | tail -1 | sed -nre 's/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p'`
fancyindex_latest=`wget -O- https://github.com/aperezdc/ngx-fancyindex/releases | grep -Eo 'v[0-9\.]+.tar.gz' | sort -V | tail -1 | sed -nre 's/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p'`
openssl_latest=`wget -O- https://www.openssl.org/source/ | grep -Eo 'openssl-[A-Za-z0-9\.]+.tar.gz' | sort -V | tail -1 | sed -nre 's|^[^0-9]*(([0-9]+\.)*[A-Za-z0-9]+).*|\1|p'`
zlib_latest=`wget -O- https://github.com/madler/zlib/releases | grep -Eo 'v[0-9\.]+.tar.gz' | sort -V | tail -1 | sed -nre 's/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p'`
pcre_latest=`wget -O- https://ftp.pcre.org/pub/pcre/ | grep -Eo 'pcre-[0-9\.]+.tar.gz' | sort -V | tail -1 | sed -nre 's/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p'`
wget https://github.com/nginx/nginx/archive/release-${nginx_latest}.tar.gz https://github.com/aperezdc/ngx-fancyindex/archive/v${fancyindex_latest}.tar.gz https://github.com/drklee3/Nginx-Fancyindex-Minimal/archive/master.tar.gz https://www.openssl.org/source/openssl-${openssl_latest}.tar.gz https://github.com/madler/zlib/archive/v${zlib_latest}.tar.gz https://ftp.pcre.org/pub/pcre/pcre-${pcre_latest}.tar.gz
for i in `ls *.gz` ; do tar -xvzf $i ; done
rm *.gz
mv Nginx-Fancyindex-Minimal-*/fancyindex/ fancyindex/
rm fancyindex/footer.*
mv nginx-release-*/ nginx/
mkdir -p nginx/objs/lib/
mv openssl-*/ nginx/objs/lib/openssl-${openssl_latest}/
mv zlib-*/ nginx/objs/lib/zlib-${zlib_latest}/
mv pcre-*/ nginx/objs/lib/pcre-${pcre_latest}/
mv ngx-fancyindex-*/ nginx/objs/lib/ngx-fancyindex-${fancyindex_latest}/
cd nginx
sed -i 's/32/64A/g' auto/lib/openssl/makefile.msvc
sed -i 's/do_ms.bat/do_win64a.bat/g' auto/lib/openssl/makefile.msvc
sed -i 's/do_ms/do_win64a/g' auto/lib/openssl/makefile.msvc
sed -i 's/W4/W3/g' auto/cc/msvc
sed -i "14a NGX_MSVC_VER=$cl_version" auto/cc/msvc
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
    --with-pcre=objs/lib/pcre-${pcre_latest} \
    --with-zlib=objs/lib/zlib-${zlib_latest} \
    --with-openssl=objs/lib/openssl-${openssl_latest} \
    --with-openssl-opt=no-tests \
    --with-http_addition_module \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-stream \
    --with-stream_ssl_module \
    --add-module=objs/lib/ngx-fancyindex-${fancyindex_latest}
sed -i '1529,1533 d' objs/Makefile
