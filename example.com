server {
  server_name example.com;
  root /path/to/your/project;
  location / {
    fancyindex on;
    fancyindex_localtime on;
    fancyindex_exact_size off;
    fancyindex_header "/Nginx-Fancyindex-Theme-dark/header.html";
    fancyindex_footer "/Nginx-Fancyindex-Theme-dark/footer.html";
    fancyindex_ignore "examplefile.html"; # Ignored files will not show up in the directory listing, but will still be public. 
    fancyindex_ignore "Nginx-Fancyindex-Theme-dark"; # Making sure folder where files are don't show up in the listing. 
    # Warning: if you use an old version of ngx-fancyindex, comment the last line if you
    # encounter a bug. See https://github.com/Naereen/Nginx-Fancyindex-Theme/issues/10
    fancyindex_name_length 255; # Maximum file name length in bytes, change as you like.
  }
  listen 443 ssl; # managed by Certbot
  ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
  ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
  include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
