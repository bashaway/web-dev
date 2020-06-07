FROM centos:centos7
RUN  yum -y install epel-release ; yum -y update ; \
     yum -y install gcc python3 python3-devel nginx git npm php-fpm certbot ; \
     pip3 install --upgrade pip ; \
     pip3 install uwsgi flask ; \
     cd
COPY uwsgi.ini /usr/share/nginx/uwsgi/
COPY myproject.py  /usr/share/nginx/uwsgi/
COPY wsgi.py  /usr/share/nginx/uwsgi/
COPY uwsgi.service /etc/systemd/system/
COPY certget.conf /etc/nginx/conf.d/
COPY uwsgi.conf.disabled /etc/nginx/conf.d/
COPY ssl.conf.disabled /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY var-uwsgi.conf /usr/lib/tmpfiles.d/
RUN  mkdir /var/log/uwsgi ; \
     systemctl enable nginx ; systemctl enable uwsgi
RUN  cd /usr/share/nginx/uwsgi && python3 -m venv venv && . venv/bin/activate && pip install uwsgi flask && deactivate
COPY docker-entrypoint.sh /tmp
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
CMD [ "/sbin/init" ]
