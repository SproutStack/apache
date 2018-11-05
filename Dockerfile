FROM alpine:latest

MAINTAINER Rhys Botfield <rhys@sproutstack.co.uk>

RUN apk add --no-cache apache2-ctl apache2-error apache2-http2 apache2-icons apache2-proxy apache2-ssl apache2-utils apache-mod-fcgid

RUN mkdir -p /etc/ssl/ \
    && openssl req -x509 -newkey rsa:4086 -keyout /etc/ssl/selfsign-key.pem -out /etc/ssl/selfsign-cert.pem \
    -days 3650 -nodes -sha256 -subj "/C=GB/ST=Manchester/L=Manchester/O=SproutDesk/OU=development/CN=sproutstack.local"

CMD httpd -DFOREGROUND
