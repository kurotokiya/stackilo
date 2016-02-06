FROM base/archlinux:2015.06.01
MAINTAINER kurotokiya <kurotokiya@gmail.com>

# Initialize the environment
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm shadowsocks-libev

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 12345
CMD ["/run.sh"]
