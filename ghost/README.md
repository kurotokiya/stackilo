## Stackilo/Ghost

---

#### Environment

 - GHOST_DATA: Path to your Ghost's content dir.If you mount a volume,please set it.
 - GHOST_URL: Your blog URL,without "https" or "http".
 - GHOST_PROTOCOL: The protocol you use,can be set as "https" or "http".
 - GHOST_MAILGUN_USER: Your Mailgun Username.
 - GHOST_MAILGUN_PASS: Your Mailgun Password.

#### Run

    docker run -d -v /path/to/volume:/mnt/volume/content \
        -e GHOST_DATA="/mnt/volume/content" \
        -e GHOST_URL="blog.example.com" \
        -e GHOST_PROTOCOL="https" \
        -e GHOST_MAILGUN_USER="youruser" \
        -e GHOST_MAILGUN_PASS="yourpass" \
        -p 127.0.0.1:12345:2368 stackilo/ghost

#### Proxy Configure

To use this image correctly,please use Nginx or other http proxy server.

Nginx configure:

    server {
      listen 80;
      listen 443 ssl;
      server_name blog.example.com;
      ssl_certificate /path/to/your/ssl/certificate.crt;
      ssl_certificate_key /path/to/your/ssl/privatekey.key;
      
      location / {
        # sub_filter only for China users
        sub_filter 'ajax.googleapis.com' 'ajax.css.network';
        sub_filter 'fonts.googleapis.com' 'fonts.css.network';
        sub_filter 'www.gravatar.com' 'gravatar.css.network';
        sub_filter 'cdnjs.cloudflare.com/ajax/libs' 'cdn.css.net/libs';
        sub_filter_once off;
        sub_filter_types text/css text/html;
        
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Accept-Encoding "";
        proxy_pass http://127.0.0.1:12345;
      }
    }

#### Thanks

 - Docker
 - Ghost
 - Nginx
 - PeterCxy
