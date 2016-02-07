FROM stackilo/php:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

WORKDIR /usr/local/owncloud
RUN wget https://download.owncloud.org/community/owncloud-8.2.2.zip && \
  unzip owncloud-8.2.2.zip && \
  rm owncloud-8.2.2.zip && \
  mv owncloud/* . && rm -rf owncloud

COPY run /run.sh

EXPOSE 80
CMD ["/run.sh"]
