FROM node:argon
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Initialize the environment
RUN apt-get update
RUN apt-get -y install unzip

# Group nobody
RUN groupadd nobody && gpasswd -a nobody nobody

# Populate basic Ghost environment
WORKDIR /usr/src/ghost
RUN  wget https://ghost.org/zip/ghost-0.7.5.zip && \
  unzip ghost-0.7.5.zip && \
  npm install --production && \
  mv content content_default

# Install the Configuration
COPY config.js /usr/src/ghost/
COPY run.sh /usr/src/ghost/
RUN chmod +x run.sh

EXPOSE 2368
CMD ["./run.sh"]
