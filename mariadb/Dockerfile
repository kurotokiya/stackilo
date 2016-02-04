FROM mariadb:latest
MAINTAINER kurotokiya <kurotokiya@gmail.com>

RUN sed -i 's/innodb_buffer_pool_size/innodb_buffer_pool_size = 32M #/g' /etc/mysql/my.cnf && \
  sed -i 's/query_cache_size/query_cache_size = 32M #/g' /etc/mysql/my.cnf && \
  sed -i 's/myisam_sort_buffer_size/myisam_sort_buffer_size = 32M #/g' /etc/mysql/my.cnf && \
  sed -i 's/key_buffer_size/key_buffer_size = 32M #/g' /etc/mysql/my.cnf

EXPOSE 3306
CMD ["mysqld"]
