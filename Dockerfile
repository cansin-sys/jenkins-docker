FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx tree
ENV environment production
COPY index.nginx-debian.html /var/www/html
CMD nginx -g 'daemon off;'
