FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}

RUN sed -i "s/user\s*nginx/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN mkdir -p /var/www