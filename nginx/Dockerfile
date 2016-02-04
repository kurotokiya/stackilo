FROM base/archlinux:2015.06.01
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Initialize the environment
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm base-devel unzip wget git curl libxml2 libzip gd icu libmcrypt libtool libzip
RUN echo 'nobody ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN groupadd www && useradd -g www www

# Install Nginx
RUN cd /usr/local/src && \
  git clone https://aur.archlinux.org/nginx-mainline.git && \
  chmod -R 777 /usr/local/src/nginx-mainline && \
  cd /usr/local/src/nginx-mainline && \
  sudo -u nobody makepkg -sci --noconfirm

# Config
COPY nginx.conf /etc/nginx

EXPOSE 80
CMD ["nginx"]
