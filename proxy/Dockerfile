FROM alpine
RUN mkdir -p /run/nginx/ /var/www/html/validate /var/www/html/auth
RUN mkdir -p /var/www/html/slurm
RUN apk update
RUN apk add nginx php83 php83-fpm bash php83-session nginx-debug
RUN unlink /etc/nginx/http.d/default.conf
COPY www.conf /etc/php83/php-fpm.d/www.conf
COPY nginx.conf /etc/nginx/http.d/
COPY validate.php /var/www/html/validate/index.php
COPY auth.php /var/www/html/auth/index.php
RUN chmod 0755 /var/www/html/validate/index.php /var/www/html/auth/index.php
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "error_log syslog:server=unix:/dev/log,nohostname,tag=nginx debug;" >> /etc/nginx/nginx.conf
CMD bash -c '/usr/sbin/nginx & /usr/sbin/php-fpm83 -F& wait'

EXPOSE 8080/tcp
