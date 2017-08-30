FROM openresty/openresty:1.11.2.5-xenial

RUN luarocks install lua-resty-auto-ssl \
    && mkdir -p /etc/resty-auto-ssl \
	&& chown www-data /etc/resty-auto-ssl
	
RUN sudo mkdir -p /etc/nginx/conf.d \
    && chown www-data /etc/nginx/conf.d

ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]