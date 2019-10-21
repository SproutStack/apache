FROM alpine:latest

MAINTAINER Rhys Botfield <rhys@sproutstack.co.uk>

RUN apk add --no-cache apache2-ctl apache2-error apache2-http2 apache2-proxy apache2-ssl

RUN mkdir -p /etc/ssl/ \
    && openssl req -x509 -newkey rsa:4086 -keyout /etc/ssl/selfsign-key.pem -out /etc/ssl/selfsign-cert.pem \
    -days 3650 -nodes -sha256 -subj "/C=GB/ST=Manchester/L=Manchester/O=SproutDesk/OU=development/CN=sproutstack.local"

RUN mkdir /workspace /etc/apache2/sites/ && ln -s /workspace /var/www/workspace

ADD httpd.conf /etc/apache2/httpd.conf

CMD httpd -DFOREGROUND
