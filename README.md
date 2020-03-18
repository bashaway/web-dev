# web-dev

docker ps -aq | xargs docker rm -f ; \
docker images -aq | xargs docker rmi ;\
docker volume ls -qf dangling=true | xargs -r docker volume rm ; \
docker-compose build ; docker-compose up -d


uwsgi --ini /usr/share/nginx/uwsgi/uwsgi.ini
uwsgi --stop /var/run/uwsgi/uwsgi.pid

git add -A ; git commit -m "commit msg" ;  git push -u origin master
