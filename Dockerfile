FROM alpine
MAINTAINER Xiakun Lu <luxiakun@gmail.com>

RUN apk add --no-cache \
        bash \
        nginx \
        ca-certificates \
        php-fpm \
        php-gd \
        php-iconv \
        php-json \
        php-mysqli \
        php-mcrypt \
        php-openssl \
        php-pdo \
        php-pdo_mysql \
        php-phar \
        php-xml \
        php-zlib

ADD files/run.sh /run.sh
RUN chmod +x /run.sh

RUN chown -R nginx:www-data /var/lib/nginx

ADD files/nginx.conf /etc/nginx/nginx.conf
ADD files/default.nginx /etc/nginx/conf.d/default.nginx
ADD files/php-fpm.conf /etc/php/php-fpm.conf

EXPOSE 80
VOLUME "/usr/share/nginx/"
WORKDIR "/usr/share/nginx/"

CMD ["/run.sh"]