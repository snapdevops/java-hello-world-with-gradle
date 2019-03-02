FROM ubuntu:16.04
MAINTAINER Vamsi K Sannapureddy
RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
# Define working directory.
#WORKDIR /etc/nginx
ADD default /etc/nginx/sites-available/default
EXPOSE 80
EXPOSE 443
CMD ["nginx"]







