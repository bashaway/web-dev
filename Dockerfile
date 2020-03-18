FROM centos:centos8
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime ; \
    dnf -y update ; dnf -y install epel-release ; \
    dnf -y install nginx python36 python36-devel gcc certbot ; \
    pip3 install uwsgi 
COPY uwsgi.ini /usr/share/nginx/uwsgi/
COPY index.py  /usr/share/nginx/uwsgi/
COPY uwsgi.service /etc/systemd/system/
COPY uwsgi.conf /etc/nginx/conf.d/
COPY ssl.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY var-uwsgi.conf /usr/lib/tmpfiles.d/
RUN  mkdir /var/log/uwsgi ; \
     systemctl enable nginx ; systemctl enable uwsgi
CMD [ "/sbin/init" ]
