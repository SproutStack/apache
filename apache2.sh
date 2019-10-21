#! /bin/bash

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/httpd*.pid

source /usr/local/apache2/bin/envvars
exec httpd -DFOREGROUND
