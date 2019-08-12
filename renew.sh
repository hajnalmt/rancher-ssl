certbot renew --dry-run --webroot --noninteractive --agree-tos --email $EMAIL --webroot-path=/usr/share/nginx/html --standalone-supported-challenges tls-sni-01
/usr/sbin/service nginx reload
