FROM stackilo/nginx:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Install PHP
RUN pacman -S --noconfirm php php-fpm php-gd php-geoip php-imap php-mcrypt php-memcached php-sqlite

# Config PHP
RUN sed -i 's/;extension=gd.so/extension=gd.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=iconv.so/extension=iconv.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=imap.so/extension=imap.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=mcrypt.so/extension=mcrypt.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=mysqli.so/extension=mysqli.so/g' /etc/php/php.ini && \
  sed -i 's/;zend_extension=opcache.so/zend_extension=opcache.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=pdo_mysql.so/extension=pdo_mysql.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=pdo_sqlite.so/extension=pdo_sqlite.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=sockets.so/extension=sockets.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=sqlite3.so/extension=sqlite3.so/g' /etc/php/php.ini && \
  sed -i 's/;extension=xmlrpc.so/extension=xmlrpc.so/g' /etc/php/php.ini

# Config and clean
WORKDIR /wwwroot
COPY www.conf /etc/php/php-fpm.d
COPY run.sh /
RUN chmod +x /run.sh
RUN rm -rf /usr/local/src/*

EXPOSE 80
CMD ["/run.sh"]
