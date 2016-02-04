FROM stackilo/nginx:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Install PHP
RUN cd /usr/local/src && \
  wget http://php.net/distributions/php-5.3.29.tar.gz && \
  tar xzf php-5.3.29.tar.gz && \
  cd php-5.3.29 && \
  ./configure --prefix=/usr/local/php \
    --with-config-file-path=/usr/local/php/etc \
    --with-fpm-user=www --with-fpm-group=www \
    --enable-fpm \
    --disable-fileinfo \
    --enable-mysqlnd \
     --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --with-iconv-dir=/usr/local \
    --with-freetype-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib \
    --with-libxml-dir=/usr \
    --enable-xml \
    --disable-rpath \
    --enable-bcmath \
    --enable-shmop \
    --enable-exif \
    --enable-sysvsem \
    --enable-inline-optimization \
    --with-curl \
    --enable-mbregex \
    --enable-inline-optimization \
    --enable-mbstring \
    --with-mcrypt \
    --with-gd \
    --enable-gd-native-ttf \
    --with-mhash \
    --enable-pcntl \
    --enable-sockets \
    --with-xmlrpc \
    --enable-ftp \
    --with-gettext \
    --enable-zip \
    --enable-soap \
    --disable-debug && \
  make && make install

# Config and clean
WORKDIR /wwwroot
RUN cp /usr/local/src/php-5.3.29/php.ini-production /usr/local/php/etc/php.ini
COPY www.conf /usr/local/php/etc/php-fpm.conf
COPY run.sh /
RUN chmod +x /run.sh
RUN rm -rf /usr/local/src/*

EXPOSE 80
CMD ["/run.sh"]
