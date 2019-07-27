# Download base image from ubuntu 14.04
FROM ubuntu:14.04

# Author info
MAINTAINER Hoyoul Kang <hoyoul@gmail.com>

# Define environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Update apt-get source list
RUN apt-get clean
RUN apt-get update

# Install base programs
RUN apt-get -yq install wget
RUN apt-get -yq install curl
RUN apt-get -yq install vim
RUN apt-get -yq install git

# Download nginx signing key
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C300EE8C

# Install LEMP
RUN apt-get -yq install nginx
RUN apt-get -yq install php5-fpm
RUN apt-get -yq install php5-mysql
RUN apt-get -yq install php5-gd
RUN apt-get -yq install mysql-server

# Remove unused dependencies
RUN apt-get -yq autoremove

# Copy over config files
COPY .vim/ /root/.vim/
COPY .vimrc /root/.vimrc
COPY nginx.conf /etc/nginx/sites-available/default
COPY index.php /var/www/html/index.php

# Turn off daemon mode
# Reference: http://stackoverflow.com/questions/18861300/how-to-run-nginx-within-docker-container-without-halting
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Configure PHP settings
RUN perl -pi -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
RUN perl -pi -e 's/allow_url_fopen = Off/allow_url_fopen = On/g' /etc/php5/fpm/php.ini
RUN perl -pi -e 's/expose_php = On/expose_php = Off/g' /etc/php5/fpm/php.ini

# Mount volumes
VOLUME [ "/etc/nginx/sites-enables", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/www/html" ]

# Boot up LEMP when container is started
CMD service php5-fpm start && service nginx start

# Set the current working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80
EXPOSE 443
