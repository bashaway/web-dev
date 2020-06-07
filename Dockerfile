FROM centos:centos7
RUN  yum -y install epel-release ; yum -y update ; \
     yum -y install gcc python3 python3-devel nginx git npm php-fpm certbot uwsgi uwsgi-plugin-python36 ; \
     sed -i -e "1,/^uid = ..*/s/^uid = ..*/uid = nginx/" /etc/uwsgi.ini ; \
     sed -i -e "1,/^gid = ..*/s/^gid = ..*/gid = nginx/" /etc/uwsgi.ini ; \
     pip3 install --upgrade pip ; \
     # pip3 install uwsgi flask ; \
     cd
COPY certget.conf /etc/nginx/conf.d/
COPY uwsgi.conf.disabled /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY var-uwsgi.conf /usr/lib/tmpfiles.d/
RUN  mkdir /var/log/uwsgi ; \
     systemctl enable nginx ; systemctl enable uwsgi
COPY hello.ini /etc/uwsgi.d/
COPY hello.py  /usr/share/nginx/hello/
RUN  cd /usr/share/nginx/hello && python3 -m venv venv && . venv/bin/activate && pip install flask && deactivate
COPY app1.ini /etc/uwsgi.d/
COPY app1.py  /usr/share/nginx/app1/
RUN  cd /usr/share/nginx/app1 && python3 -m venv venv && . venv/bin/activate && pip install flask && deactivate
COPY docker-entrypoint.sh /tmp
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
CMD [ "/sbin/init" ]
