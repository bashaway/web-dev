#!/bin/sh


if [ ! -d "/etc/letsencrypt/live" ]; then
   rm -f /usr/share/nginx/html/index.html 
   echo 'sample' > /usr/share/nginx/html/index.html
   nginx && \
   certbot certonly --server https://acme-staging-v02.api.letsencrypt.org/directory  --preferred-challenges http-01  --agree-tos --no-eff-email  --webroot -w /usr/share/nginx/html  -d sakura01.prosper2.org  -m bashaway@gmail.com &> /tmp/letsenc.log
   cat /var/run/nginx.pid  | xargs kill
   mv /etc/nginx/conf.d/ssl.conf.disabled /etc/nginx/conf.d/ssl.conf
   mv /etc/nginx/conf.d/uwsgi.conf.disabled /etc/nginx/conf.d/uwsgi.conf
   rm -f /etc/nginx/conf.d/certget.conf
fi

exec "$@"


