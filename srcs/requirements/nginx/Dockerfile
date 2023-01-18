FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY conf/default /etc/nginx/sites-enabled/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=wordpress/CN=fatilly.42.fr";

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]