FROM stackilo/php:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

WORKDIR /wwwroot

RUN cd /usr/local/src && \
  wget https://files.phpmyadmin.net/phpMyAdmin/4.5.4.1/phpMyAdmin-4.5.4.1-all-languages.zip && \
  unzip phpMyAdmin-4.5.4.1-all-languages.zip && \
  cd phpMyAdmin-4.5.4.1-all-languages && \
  mv * /wwwroot && \
  cd /usr/local/src && \
  rm -rf *

COPY config.inc.php /wwwroot/config.inc.php

EXPOSE 80
CMD ["/run.sh"]
