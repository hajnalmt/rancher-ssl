certbot renew --webroot --noninteractive --agree-tos --email $EMAIL --webroot-path=/usr/share/nginx/html --preferred-challenges html-01
/usr/sbin/service nginx reload

