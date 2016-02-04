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
RUN cd /usr/local/src && \
  wget http://php.net/distributions/php-5.3.29.tar.gz && \
  tar xzf php-5.3.29.tar.gz && \
  cd php-5.3.29 && \
  ./configure --prefix=/usr/local/php \
    --with-config-file-path=/usr/local/php/etc \
    --with-fpm-user=www --with-fpm-group=www \
    --enable-fpm \
    --disable-fileinfo \
    --enable-mysqlnd \
     --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --with-iconv-dir=/usr/local \
    --with-freetype-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib \
    --with-libxml-dir=/usr \
    --enable-xml \
    --disable-rpath \
    --enable-bcmath \
    --enable-shmop \
    --enable-exif \
    --enable-sysvsem \
    --enable-inline-optimization \
    --with-curl \
    --enable-mbregex \
    --enable-inline-optimization \
    --enable-mbstring \
    --with-mcrypt \
    --with-gd \
    --enable-gd-native-ttf \
    --with-openssl \
    --with-mhash \
    --enable-pcntl \
    --enable-sockets \
    --with-xmlrpc \
    --enable-ftp \
    --with-gettext \
    --enable-zip \
    --enable-soap \
    --disable-debug && \
  make && make install && \
  sed -i 's/PATH="/PATH="\/usr\/local\/php\/bin:/g' /etc/environment

# Config and clean
WORKDIR /wwwroot
COPY nginx.conf /etc/nginx
COPY www.conf /usr/local/php/etc/php-fpm.d
COPY run.sh /
RUN chmod +x /run.sh
RUN rm -rf /usr/local/src/*

# Set rewrite (Please modify this file before build)
COPY rewrite.conf /etc/nginx

EXPOSE 80
CMD ["/run.sh"]
