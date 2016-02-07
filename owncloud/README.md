## Stackilo/ownCloud

#### Run

    docker run -d -v /path/to/volume:/mnt/volume \
        -e OWNCLOUD_DATA="/mnt/volume" \
        -m 256m -p 12345:80 stackilo/owncloud

#### Proxy Configure

To use this image correctly,please use Nginx or other http proxy server.

Nginx configure:

    server {
      listen 80;
      listen 443 ssl;
      server_name cloud.example.com;
      ssl_certificate /path/to/your/ssl/certificate.crt;
      ssl_certificate_key /path/to/your/ssl/privatekey.key;
      
      location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Accept-Encoding "";
        proxy_pass http://127.0.0.1:12345;
      }
    }

#### Thanks

 - Docker
