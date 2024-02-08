server {
  server_name example.com;
  root /path/to/your/project;
  location / {
          fancyindex on;
          fancyindex_exact_size off;
  }
  listen 443 ssl; # managed by Certbot
  ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
  ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
  include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
