#FROM 540455772678.dkr.ecr.ap-south-1.amazonaws.com/alpine:latest
FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add nginx
#RUN apk add php81 php81-fpm && php -v
# Install packages
RUN apk --no-cache add \
   php81 \
   php81-phar \
   php81-pdo \
   php81-pdo_mysql \
   php81-bcmath \
   php81-calendar \
   php81-mbstring \
   php81-exif \
   php81-openssl \
   php81-zip \
   php81-sysvsem \
   php81-sysvshm \
   php81-sysvmsg \
   php81-sockets \
   php81-zlib \
   php81-bz2 \
   php81-curl \
   php81-simplexml \
   php81-xml \
   php81-opcache \
   php81-dom \
   php81-xmlreader \
   php81-xmlwriter \
   php81-tokenizer \
   php81-ctype \
   php81-session \
   php81-fileinfo \
   php81-iconv \
   php81-json \
   php81-posix \
   php81-mysqli \
   php81-zip \
   php81-common \
   php81-fpm \
   php81-gd \
  supervisor \
  curl \
  bash \
  less

RUN ln -s /usr/bin/php81 /usr/bin/php && php -v

# Configure nginx
COPY DockerConfig/info.php /var/www/localhost/htdocs/
COPY DockerConfig/index.html /var/www/localhost/htdocs/
COPY DockerConfig/nginx.conf /etc/nginx/nginx.conf

# Configure PHP-FPM
COPY DockerConfig/fpm-pool.conf /etc/php81/php-fpm.d/zzz_custom.conf
COPY DockerConfig/php.ini /etc/php81/conf.d/zzz_custom.ini

# Configure supervisord
COPY DockerConfig/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 80
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
