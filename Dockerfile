
# Using Ubuntu image
FROM ubuntu:18.04
# Information about me
MAINTAINER denys naida <NaidaDV@nmu.one>
# Updating and upgrading 
RUN apt-get update && apt-get upgrade -y && apt-get install apache2 -y
# Deleting default apache page
RUN rm /var/www/html/*.html
# Copying artifact to apache
COPY ./build/* /var/www/html/
# Starting apache
CMD ["apachectl", "-D", "FOREGROUND"]
