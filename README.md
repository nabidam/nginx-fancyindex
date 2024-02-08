# nginx-fancyindex
This is a guide to install nginx fancyindex module.

You should build nginx from source with ngx-fancyindex module as dynamic module.
```bash
wget https://nginx.org/download/nginx-1.25.3.tar.gz
gunzip -c nginx-1.25.3.tar.gz | tar -xvf -
wget https://github.com/aperezdc/ngx-fancyindex/archive/refs/tags/v0.5.2.tar.gz
gunzip -c v0.5.2.tar.gz | tar -xvf -
```

Then `cd` to nginx directory to configure, before configuring you may install `libgd-dev`
```bash
./configure --add-dynamic-module=../ngx-fancyindex-0.5.2 \
--with-debug \
--with-http_addition_module \
--with-http_dav_module \
--with-http_geoip_module \
--with-http_gzip_static_module \
--with-http_image_filter_module \
--with-http_realip_module \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-http_sub_module \
--with-http_xslt_module \
--with-ipv6 \
--with-sha1=/usr/include/openssl \
--with-md5=/usr/include/openssl \
--with-mail \
--with-file-aio \
--with-mail_ssl_module \
--with-http_perl_module \
--with-http_flv_module \
--with-http_gunzip_module \
--with-http_image_filter_module \
--with-http_mp4_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_xslt_module \
--with-mail \
--without-mail_pop3_module \
--without-mail_imap_module \
--without-mail_smtp_module \
--with-mail_ssl_module
```

Now you can run `make` command, then install it using `make install`.

Finally copy `nginx.service` file to `/lib/systemd/system/nginx.service` and start it
```bash
cp nginx.service /lib/systemd/system/nginx.service\
systemctl daemon-reload
systemctl start nginx
systemctl status nginx
```

Check file `example.com` for instruction on how to activate fancyindex.

# resource
- https://www.nginx.com/resources/wiki/start/topics/examples/systemd/
- https://nginx.org/en/download.html
- https://github.com/Coozila/install-nginx-master-all-modules
- https://github.com/aperezdc/ngx-fancyindex
