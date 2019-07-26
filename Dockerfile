# Pull from the ubuntu:14.04 image
FROM ubuntu:14.04

# Based on Vu Tran's <vu@vu-tran.com> Dockerfile
MAINTAINER Hoyoul Kang <hoyoul@gmail.com>

# Install Base
RUN apt-get update && apt-get -y install \
  wget \
  curl \
  vim \
  git \

# Download Nginx signing key
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C300EE8C

# Install LEMP
RUN apt-get -y install \
  nginx \
  php5-fpm \
  php5-mysql \
  php5-gd \
  mysql-server

# Turn off daemon mode
# Reference: http://stackoverflow.com/questions/18861300/how-to-run-nginx-within-docker-container-without-halting
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Backup the default configurations
RUN cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.original.bak
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original

# Configure PHP settings
RUN perl -pi -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
RUN perl -pi -e 's/allow_url_fopen = Off/allow_url_fopen = On/g' /etc/php5/fpm/php.ini
RUN perl -pi -e 's/expose_php = On/expose_php = Off/g' /etc/php5/fpm/php.ini

# Mount volumes
VOLUME []

# Boot up LEMP when container is started
CMD service php5-fpm start && service nginx start

# Set the current working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80
EXPOSE 443
