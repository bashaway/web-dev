FROM centos:centos8
RUN  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime ; \
     dnf -y update ; dnf -y install epel-release ; \
     dnf -y install gcc gcc-c++ make expat-devel libffi-devel systemtap-sdt-devel valgrind-devel ; \
     curl -OL https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz ; \
     tar -xf Python-3.8.3.tgz ; \
     cd Python-3.8.3 && \
     ./configure \
     --enable-ipv6 \
     # --enable-shared \
     # --with-computed-gotos=yes \
     # --with-dbmliborder=gdbm:ndbm:bdb \
     # --with-system-expat \
     # --with-system-ffi \
     # --enable-loadable-sqlite-extensions \
     # --with-dtrace \
     # --with-lto \
     # --with-ssl-default-suites=openssl \
     # --with-valgrind \
     --with-ensurepip \
     --enable-optimizations ; \
     make ; make install ; \
     # ln -s /usr/local/lib/libpython3.8.so.1.0 /usr/lib64 ; \
     dnf -y install nginx git npm php ; \
     pip3 install uwsgi ; \
     cd
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
