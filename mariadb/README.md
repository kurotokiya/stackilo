## Stackilo/MairaDB

#### Environment

 - MYSQL\_ROOT\_PASSWORD : Your root password

#### Run

    docker run -d -v /path/to/volume:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD="yourrootpassword" \
        -m 256m \
        -p 3306:3306 \
        --name mariadb stackilo/mariadb

#### Link to other containers

    docker run -it --link mariadb:mysql -d yourcontainer

#### Thanks

 - Docker
