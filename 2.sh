mv *.conf nginx/conf/
cd nginx
mv objs/nginx.exe ./
mv objs/lib/openssl/openssl/bin/openssl.exe ./
mkdir {logs,temp}
rm -r {auto,contrib,docs,misc,objs,src}
rm {.hgtags,Makefile}
openssl.exe passwd -apr1 1234567890 > conf/passwd
sed -i 's/$apr1/user1:$apr1/g' conf/passwd
rm ../*.{sh,bat,md,png,wget-hsts}
rm ../LICENSE
