# web-dev

docker ps -aq | xargs docker rm -f ; \
docker images -aq | xargs docker rmi ;\
docker volume ls -qf dangling=true | xargs -r docker volume rm ; \
docker-compose build ; docker-compose up -d


uwsgi --ini /usr/share/nginx/uwsgi/uwsgi.ini
uwsgi --stop /var/run/uwsgi/uwsgi.pid

git add -A ; git commit -m "commit msg" ;  git push -u origin master

# FIDO demo

## FIDO Alliance
```
git clone https://github.com/fido-alliance/webauthn-demo/
cd webauthn-demo
npm install
node app
```



## apowers313
```
git clone --recursive https://github.com/apowers313/fido2-server-demo
cd fido2-server-demo
npm install
npm start
```



# lets encrypt

## staging

```
certbot certonly \
 --server https://acme-staging-v02.api.letsencrypt.org/directory \
 --preferred-challenges http-01 \
 --agree-tos --no-eff-email \
 --webroot -w /usr/share/nginx/html \
 -d sakura01.prosper2.org \
 -m bashaway@gmail.com
```

## production

```
certbot certonly \
 --server https://acme-v02.api.letsencrypt.org/directory \
 --preferred-challenges http-01 \
 --agree-tos --no-eff-email \
 --webroot -w /usr/share/nginx/html \
 -d FQDN \
 -m MAIL@ADDRESS
```

