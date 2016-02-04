FROM base/archlinux:2015.06.01
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Initialize the environment
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm base-devel unzip wget git
RUN echo 'nobody ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN groupadd www && useradd -g www www

# Install Nginx
RUN cd /usr/local/src && \
  git clone https://aur.archlinux.org/nginx-mainline.git && \
  chmod -R 777 /usr/local/src/nginx-mainline && \
  cd /usr/local/src/nginx-mainline && \
  sudo -u nobody makepkg -sci --noconfirm

# Install PHP
RUN pacman -S --noconfirm php php-fpm php-gd php-geoip php-imap php-mcrypt php-memcached php-sqlite

# Config and clean
WORKDIR /wwwroot
COPY nginx.conf /etc/nginx
COPY www.conf /etc/php/php-fpm.d
COPY run.sh /
RUN chmod +x /run.sh
RUN rm -rf /usr/local/src/*

EXPOSE 80
CMD ["/run.sh"]
