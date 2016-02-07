FROM stackilo/php:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

WORKDIR /usr/src/owncloud
RUN wget https://download.owncloud.org/community/owncloud-8.2.2.zip && \
  unzip owncloud-8.2.2.zip && \
  rm owncloud-8.2.2.zip && \
  mv owncloud/* . && rm -rf owncloud && \
  chmod -R 755 .

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh

EXPOSE 80
CMD ["/run.sh"]
