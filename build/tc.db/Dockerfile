FROM alpine:3.12

RUN apk add --no-cache \
  mariadb \
  mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY entrypoint.sh root.sql /root/
RUN chmod +x /root/entrypoint.sh

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306/tcp

ENTRYPOINT [ "/root/entrypoint.sh" ]

LABEL maintainer=troctsch.cpp@gmail.com
