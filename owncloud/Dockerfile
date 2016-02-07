FROM stackilo/php:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

RUN mkdir -p /usr/src && cd /usr/src && \
  wget https://download.owncloud.org/community/owncloud-8.2.2.zip && \
  unzip owncloud-8.2.2.zip && \
  rm owncloud-8.2.2.zip && \
  chmod -R 755 .

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh

EXPOSE 80
CMD ["/run.sh"]
