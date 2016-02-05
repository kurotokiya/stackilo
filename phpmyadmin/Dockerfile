FROM stackilo/php:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

RUN cd /usr/local/src && \
  wget https://files.phpmyadmin.net/phpMyAdmin/4.5.4.1/phpMyAdmin-4.5.4.1-all-languages.zip && \
  unzip phpMyAdmin-4.5.4.1-all-languages.zip && \
  cd phpMyAdmin-4.5.4.1-all-languages && \
  mv * /wwwroot

EXPOSE 80
CMD ["/run.sh"]
