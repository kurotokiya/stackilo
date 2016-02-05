FROM stackilo/php:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

WORKDIR /wwwroot

RUN cd /usr/local/src && \
  wget https://files.phpmyadmin.net/phpMyAdmin/4.5.4.1/phpMyAdmin-4.5.4.1-all-languages.zip && \
  unzip phpMyAdmin-4.5.4.1-all-languages.zip && \
  cd phpMyAdmin-4.5.4.1-all-languages && \
  mv * /wwwroot

RUN mv config.sample.inc.php config.inc.php && \
  echo "\$cfg['blowfish_secret'] = 'ljglaksjfkldsajfls';" >> config.inc.php && \
  echo "\$cfg['Servers'][0]['host'] = 'mysql';" >> config.inc.php

RUN rm -rf /usr/local/src/*

EXPOSE 80
CMD ["/run.sh"]
