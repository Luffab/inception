FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm wget

EXPOSE 9000

COPY ./conf /var/www
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN chmod +x /var/www/wordpress.sh

RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
RUN	chown -R www-data:www-data /var/www/*
RUN	chown -R 755 /var/www/*
RUN	mkdir -p /run/php/
RUN	touch /run/php/php7.3-fpm.pid

ENTRYPOINT [ "/var/www/wordpress.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
