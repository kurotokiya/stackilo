FROM ubuntu:trusty
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Initialize the environment
RUN apt-get update
RUN apt-get -y install wget libpcre3 libpcre3-dev zlib1g zlib1g-dev build-essential libxml2-dev libpcre3-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libxpm-dev libfreetype6-dev 
libmysqlclient-dev libt1-dev libgd2-xpm-dev libgmp-dev libsasl2-dev libmhash-dev unixodbc-dev freetds-dev libpspell-dev libsnmp-dev libtidy-dev libxslt1-dev libmcrypt-dev

# Install Nginx
RUN cd /usr/local/src && \
  wget http://nginx.org/download/nginx-1.9.10.tar.gz && \
  wget http://www.openssl.org/source/old/1.0.2/openssl-1.0.2e.tar.gz && \
  tar xzf nginx-1.9.10.tar.gz && \
  tar xzf openssl-1.0.2e.tar.gz && \
  cd nginx-1.9.10 && \
  ./configure \
    --user=www \
    --group=www  \
    --prefix=/usr/local/nginx \
    --with-http_stub_status_module \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-ipv6 \
    --with-http_v2_module \
    --with-openssl=../openssl-1.0.2e \
  make && make install && \
  sed -i 's/PATH=\"/PATH=\"\/usr\/local\/nginx\/sbin\:/g' /etc/environment

# Install PHP
RUN cd /usr/local/src && \
  wget http://php.net/distributions/php-7.0.2.tar.gz && \
  tar xzf php-7.0.2.tar.gz && \
  cd php-7.0.2 && \
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
    --with-openssl \
    --with-mhash \
    --enable-pcntl \
    --enable-sockets \
    --with-xmlrpc \
    --enable-ftp \
    --with-gettext \
    --enable-zip \
    --enable-soap \
    --disable-debug && \
  make && make install && \
  sed -i 's/PATH=\"/PATH=\"\/usr\/local\/php\/bin\:/g' /etc/environment && \
  cp php.ini-production /usr/local/php/etc/php.ini

# Update environment
RUN source /etc/environment && \
  mkdir -p /wwwroot && \
  sed -i 's/[opcache]/[opcache]\nzend_extension=opcache.so/g' /usr/local/php/etc/php.ini && \
  sed -i 's/;opcache.enable=0/opcache.enable=1/g' /usr/local/php/etc/php.ini && \
  cd /usr/local/php/etc && cp php-fpm.conf.default php-fpm.conf

# Config
COPY nginx.conf /usr/local/nginx/conf
COPY www.conf /usr/local/php/etc/php-fpm.d

# Set rewrite (Please modify this file before build)
COPY rewrite.conf /usr/local/nginx/conf

EXPOSE 80
CMD ["./run.sh"]
