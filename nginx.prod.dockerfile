FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}

RUN sed -i "s/user\s*nginx/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN mkdir -p /var/www

ADD nginx/default.prod.conf /etc/nginx/conf.d/default.conf
ADD nginx/laravel-docker.test.pem /etc/nginx/certs/laravel-docker.test.pem
ADD nginx/laravel-docker.test-key.pem /etc/nginx/certs/laravel-docker.test-key.pem

