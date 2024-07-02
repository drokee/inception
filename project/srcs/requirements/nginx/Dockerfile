FROM    debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl

COPY index.html /var/www/html

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout  /etc/nginx/ssl/amahdiou.key -subj "/C=MA/ST=Martil/L=Martil/O=42Network/OU=1337/CN=amahdiou.42.fr" -out /etc/nginx/ssl/amahdiou.crt


COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# EXPOSE 443

CMD ["nginx" , "-g" , "daemon off;"]