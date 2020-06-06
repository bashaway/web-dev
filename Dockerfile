FROM centos:centos7
RUN  yum -y install epel-release ; yum -y update ; \
     yum -y install gcc python3 python3-devel nginx git npm php ; \
     pip3 install uwsgi ; \
     cd
#COPY uwsgi.ini /usr/share/nginx/uwsgi/
#COPY index.py  /usr/share/nginx/uwsgi/
#COPY uwsgi.service /etc/systemd/system/
#COPY uwsgi.conf /etc/nginx/conf.d/
#COPY ssl.conf /etc/nginx/conf.d/
#COPY nginx.conf /etc/nginx/
#COPY var-uwsgi.conf /usr/lib/tmpfiles.d/
#RUN  mkdir /var/log/uwsgi ; \
#     systemctl enable nginx ; systemctl enable uwsgi
CMD [ "/sbin/init" ]
