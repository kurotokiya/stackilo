FROM stackilo/nginx:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Install PHP
RUN pacman -S --noconfirm php php-fpm php-gd php-geoip php-imap php-mcrypt php-memcached php-sqlite

# Config and clean
WORKDIR /wwwroot
COPY www.conf /etc/php/php-fpm.d
COPY run.sh /
RUN chmod +x /run.sh
RUN rm -rf /usr/local/src/*

EXPOSE 80
CMD ["/run.sh"]
