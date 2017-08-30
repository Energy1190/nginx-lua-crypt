FROM openresty/openresty:1.11.2.5-xenial

RUN luarocks install lua-resty-auto-ssl \
    && mkdir -p /etc/resty-auto-ssl \
    && chown www-data /etc/resty-auto-ssl
	
<<<<<<< HEAD
RUN sudo mkdir -p /etc/nginx/conf.d \
    && chown www-data -R /etc/nginx/
=======
RUN mkdir -p /etc/nginx/conf.d \
    && chown www-data /etc/nginx/conf.d
>>>>>>> origin/master

ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ADD fastcgi_params /etc/nginx/fastcgi_params

ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
