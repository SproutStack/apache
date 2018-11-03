FROM alpine:latest

MAINTAINER Rhys Botfield <rhys@sproutstack.co.uk>

RUN apk add --no-cache apache2

RUN apk add --no-cache openssl \
&& mkdir -p /etc/ssl/ \
    && openssl req -x509 -newkey rsa:4086 -keyout /etc/ssl/selfsign-key.pem -out /etc/ssl/selfsign-cert.pem \
    -days 3650 -nodes -sha256 -subj "/C=GB/ST=Manchester/L=Manchester/O=SproutDesk/OU=development/CN=sproutstack.local" \
&& apk del openssl

COPY httpd.conf /etc/apache2/httpd.conf
COPY apache2.sh /apache2.sh

RUN chmod +x /apache2.sh
ENTRYPOINT ["/apache2.sh"]
