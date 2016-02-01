FROM base/archlinux:2015.06.01
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Initialize the environment
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm nodejs npm wget unzip

WORKDIR /usr/src/ghost

# Populate basic Ghost environment
RUN  wget https://ghost.org/zip/ghost-0.7.5.zip && \
  unzip ghost-0.7.5.zip && \
  sed -i 's/preinstall/uncheck/g' package.json && \
  npm install --production && \
  mv content content_default

# Install the Configuration
COPY config.js /usr/src/ghost/
COPY run.sh /usr/src/ghost/
RUN chmod +x run.sh

EXPOSE 2368
CMD ["./run.sh"]
